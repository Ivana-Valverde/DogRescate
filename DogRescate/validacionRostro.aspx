<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="validacionRostro.aspx.cs" Inherits="DogRescate.validacionRostro" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <title>Validación de Rostro</title>
    <link rel="stylesheet" href="estilos/bootstrap.css" />
    <link rel="stylesheet" href="estilos/biometria.css" />
    <script src="js/face-api.js"></script>

    <style>
        .contenedor-camara {
            position: relative;
            display: inline-block;
            width: 100%;
            max-width: 640px;
            background-color: #000;
            border-radius: 8px;
            overflow: hidden;
        }
        #video {
            width: 100%;
            height: auto;
            display: block;
            transform: scaleX(-1); 
        }
        #overlayCanvas {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            transform: scaleX(-1); 
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Panel ID="pnlCartaVerificacion" runat="server" CssClass="carta-verificacion text-center p-3">
            <asp:Label ID="lblTitulo" runat="server" Text="Validación Facial" CssClass="titulo-principal h2 d-block mb-3" />
            <asp:Label ID="lblEstado" runat="server" Text="Iniciando cámara y modelos de reconocimiento..." CssClass="estado-cargando fw-bold mb-2 d-block" />
            <asp:Label ID="lblSubtitulo" runat="server" Text="Posiciónate frente a la cámara para verificar tu identidad." ForeColor="#333333" />

            <asp:Panel ID="pnlContenedorCamara" runat="server" CssClass="contenedor-camara mb-3" BorderColor="DarkOrange">
                <video id="video" autoplay="autoplay" muted="muted" playsinline="playsinline"></video>
                <canvas id="overlayCanvas"></canvas>
            </asp:Panel>

            <button type="button" id="btnCapturar" class="btn btn-primary w-100 py-2" disabled onclick="tomarCaptura();">
                BUSCANDO ROSTRO...
            </button>
        </asp:Panel>
    </form>

    <script>
        const video = document.getElementById('video');
        const overlayCanvas = document.getElementById('overlayCanvas');
        const btnCapturar = document.getElementById('btnCapturar');
        const estado = document.getElementById('<%= lblEstado.ClientID %>');

        let detectorPrincipal;
        let detectorAlternativo;
        let comparadorRostros = null;
        let monitoreando = false;
        let verificando = false;

        function actualizarEstado(mensaje, color = 'black') {
            if (estado) {
                estado.innerText = mensaje;
                estado.style.color = color;
            }
        }

        async function iniciarCamara() {
            try {
                if (!navigator.mediaDevices || !navigator.mediaDevices.getUserMedia) {
                    actualizarEstado("Tu navegador bloqueó la cámara, vuelve a intentarlo.", "red");
                    return false;
                }

                let stream;
                try {
                    stream = await navigator.mediaDevices.getUserMedia({
                        video: { width: { ideal: 640 }, height: { ideal: 480 }, facingMode: "user" },
                        audio: false
                    });
                } catch (errResolucion) {
                    console.warn("Fallo con resolución preferida, reintentando con configuración por defecto:", errResolucion);
                    stream = await navigator.mediaDevices.getUserMedia({ video: true, audio: false });
                }

                video.srcObject = stream;
                await video.play();
                return true;
            } catch (err) {
                actualizarEstado("No se detectó ninguna cámara.", "red");
                console.error("Error getUserMedia:", err);
                return false;
            }
        }

        function cargarRostrosReferencia(listaUsuarios) {
            try {
                const labeledDescriptors = listaUsuarios.map(u => {
                    const FloatArray = new Float32Array(u.vector);
                    return new faceapi.LabeledFaceDescriptors(u.nombre, [FloatArray]);
                });
                return new faceapi.FaceMatcher(labeledDescriptors, 0.6);
            } catch (err) {
                console.error("Error al procesar descriptores biométricos:", err);
                return null;
            }
        }

        window.addEventListener('DOMContentLoaded', async () => {
            const camaraOk = await iniciarCamara();
            if (!camaraOk) return;

            try {
                const URL_M = './modelos_reconocimiento/';
                actualizarEstado("Cargando modelos de reconocimiento...", "orange");

                await Promise.all([
                    faceapi.nets.ssdMobilenetv1.loadFromUri(URL_M),
                    faceapi.nets.tinyFaceDetector.loadFromUri(URL_M),
                    faceapi.nets.faceLandmark68Net.loadFromUri(URL_M),
                    faceapi.nets.faceRecognitionNet.loadFromUri(URL_M)
                ]);

                detectorPrincipal = new faceapi.SsdMobilenetv1Options({ minConfidence: 0.4 });
                detectorAlternativo = new faceapi.TinyFaceDetectorOptions({ inputSize: 224, scoreThreshold: 0.3 });

                actualizarEstado("Cargando vectores de referencia...", "orange");

                const response = await fetch('validacionRostro.aspx/ObtenerVectores', {
                    method: 'POST',
                    headers: { 'Content-Type': 'application/json; charset=utf-8' },
                    body: JSON.stringify({})
                });

                const data = await response.json();
                const listaUsuarios = data.d;

                if (!listaUsuarios || listaUsuarios.length === 0) {
                    actualizarEstado("Error: No existen vectores de referencia guardados en /capturas/.", "red");
                    return;
                }

                comparadorRostros = cargarRostrosReferencia(listaUsuarios);

                if (comparadorRostros) {
                    actualizarEstado("Modelo listo. Enfoca tu rostro.", "black");
                    if (!monitoreando) {
                        monitoreando = true;
                        monitorearRostro();
                    }
                } else {
                    actualizarEstado("Error al procesar los vectores guardados.", "red");
                }

            } catch (error) {
                actualizarEstado("Error al iniciar el sistema de reconocimiento. Revisa la consola (F12).", "red");
                console.error("Error en inicialización face-api / red:", error);
            }
        });

        async function monitorearRostro() {
            if (video.videoWidth > 0 && video.videoHeight > 0 && !video.paused && !verificando) {
                try {
                    const displaySize = { width: video.videoWidth, height: video.videoHeight };
                    faceapi.matchDimensions(overlayCanvas, displaySize);

                    let deteccion = await faceapi.detectSingleFace(video, detectorPrincipal);
                    if (!deteccion) {
                        deteccion = await faceapi.detectSingleFace(video, detectorAlternativo);
                    }

                    const ctx = overlayCanvas.getContext('2d');
                    ctx.clearRect(0, 0, overlayCanvas.width, overlayCanvas.height);

                    if (deteccion) {
                        const resizedDeteccion = faceapi.resizeResults(deteccion, displaySize);
                        faceapi.draw.drawDetections(overlayCanvas, resizedDeteccion);

                        actualizarEstado("Rostro Encontrado", "green");
                        btnCapturar.disabled = false;
                        btnCapturar.innerText = "VERIFICAR IDENTIDAD";
                    } else {
                        actualizarEstado("Buscando rostro...", "black");
                        btnCapturar.disabled = true;
                        btnCapturar.innerText = "ESPERANDO ROSTRO...";
                    }
                } catch (err) {
                    console.error("Error en monitoreo:", err);
                }
            }
            setTimeout(monitorearRostro, 200);
        }

        async function tomarCaptura() {
            if (!comparadorRostros || verificando) return;

            verificando = true;
            btnCapturar.disabled = true;
            actualizarEstado("Verificando identidad biométrica...", "orange");

            try {
                let deteccion = await faceapi.detectSingleFace(video, detectorPrincipal)
                    .withFaceLandmarks()
                    .withFaceDescriptor();

                if (!deteccion) {
                    deteccion = await faceapi.detectSingleFace(video, detectorAlternativo)
                        .withFaceLandmarks()
                        .withFaceDescriptor();
                }

                if (deteccion) {

                    const coincidencia = comparadorRostros.findBestMatch(deteccion.descriptor);
                    console.log("Coincidencia detectada:", coincidencia.toString());

                    const usuarioDetectado = coincidencia.label;
                    const distancia = coincidencia.distance;

                    const resp = await fetch('validacionRostro.aspx/ProcesarVerificacion', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json; charset=utf-8' },
                        body: JSON.stringify({ usuarioDetectado: usuarioDetectado })
                    });

                    const data = await resp.json();
                    const resultado = data.d;

                    if (resultado && resultado.ok) {
                        actualizarEstado(`¡Identidad verificada con éxito! Bienvenido(a), ${usuarioDetectado}.`, "green");
                        btnCapturar.innerText = "ACCESO PERMITIDO";
                        btnCapturar.className = "btn btn-success w-100 py-2";

                    } else {
         
                        actualizarEstado(`Acceso denegado: ${resultado.error || "Rostro no reconocido en el sistema."}`, "red");
                        btnCapturar.innerText = "REINTENTAR VALIDACIÓN";
                        btnCapturar.className = "btn btn-danger w-100 py-2";

                        setTimeout(() => {
                            verificando = false;
                            btnCapturar.disabled = false;
                            btnCapturar.className = "btn btn-primary w-100 py-2";
                        }, 3000);
                    }
                } else {
                    actualizarEstado("No se pudo extraer los rasgos del rostro. Intenta enfocar mejor.", "red");
                    btnCapturar.innerText = "REINTENTAR";

                    setTimeout(() => {
                        verificando = false;
                        btnCapturar.disabled = false;
                    }, 2500);
                }
            } catch (e) {
                console.error("Error al verificar rostro:", e);
                actualizarEstado("Error en el proceso de verificación biométrica.", "red");
                verificando = false;
                btnCapturar.disabled = false;
            }
        }
    </script>
</body>
</html>