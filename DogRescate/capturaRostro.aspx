<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="capturaRostro.aspx.cs" Inherits="DogRescate.capturaRostro" %>

<!DOCTYPE html>
<html lang="es">
<head runat="server">
    <meta charset="utf-8" />
    <title>Captura de Rostro</title>
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
        
        <asp:Label ID="lblTitulo" runat="server" Text="Captura de Rostro" CssClass="titulo-principal h2 d-block mb-3" />
        
        <asp:Label ID="lblEstado" runat="server" Text="Iniciando cámara y modelo de reconocimiento..." CssClass="estado-cargando fw-bold mb-2 d-block" />
        
        <asp:Label ID="lblSubtitulo" runat="server" Text="Posiciónate frente a la cámara para generar tu vector biométrico." ForeColor="#333333" />

        <asp:Panel ID="pnlContenedorCamara" runat="server" CssClass="contenedor-camara mb-3" BorderColor="DarkOrange">
            <video id="video" autoplay="autoplay" muted="muted" playsinline="playsinline"></video>
            <canvas id="overlayCanvas"></canvas>
        </asp:Panel>

        <button type="button" id="btnCapturar" class="btn btn-primary w-100 py-2" disabled onclick="extraerVector();">
            ESPERANDO ROSTRO...
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
        let monitoreando = false;

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
                    console.warn("Fallo con resolución preferida, reintentando con config por defecto:", errResolucion);
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

        window.addEventListener('DOMContentLoaded', async () => {
            const camaraOk = await iniciarCamara();
            if (!camaraOk) return;

            try {
                const URL_M = 'modelos_reconocimiento/';
                actualizarEstado("Cargando modelos de reconocimiento...", "orange");

                await Promise.all([
                    faceapi.nets.ssdMobilenetv1.loadFromUri(URL_M),
                    faceapi.nets.tinyFaceDetector.loadFromUri(URL_M),
                    faceapi.nets.faceLandmark68Net.loadFromUri(URL_M),
                    faceapi.nets.faceRecognitionNet.loadFromUri(URL_M)
                ]);

                detectorPrincipal = new faceapi.SsdMobilenetv1Options({ minConfidence: 0.4 });
                detectorAlternativo = new faceapi.TinyFaceDetectorOptions({ inputSize: 224, scoreThreshold: 0.3 });

                actualizarEstado("Modelo Listo. Enfoca tu rostro.", "black");

                if (!monitoreando) {
                    monitoreando = true;
                    monitorearRostro();
                }
            } catch (error) {
                actualizarEstado("Error al cargar modelos.", "red");
                console.error("Error face-api:", error);
            }
        });

        async function monitorearRostro() {
            if (video.videoWidth > 0 && video.videoHeight > 0 && !video.paused) {
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
                        const btnCapturar = document.getElementById('btnCapturar');
                        btnCapturar.disabled = false;
                        btnCapturar.innerText = "REGISTRAR CARA Y GENERAR VECTOR";
                    } else {
                        actualizarEstado("Buscando rostro...", "black");
                        const btnCapturar = document.getElementById('btnCapturar');
                        btnCapturar.disabled = true;
                        btnCapturar.innerText = "ESPERANDO ROSTRO...";
                    }
                } catch (err) {
                    console.error("Error en monitoreo:", err);
                }
            }
            setTimeout(monitorearRostro, 200);
        }

        async function extraerVector() {
            const btnCapturar = document.getElementById('btnCapturar');
            btnCapturar.disabled = true;
            actualizarEstado("Procesando vector biométrico...", "orange");

            const canvas = document.createElement('canvas');
            canvas.width = video.videoWidth || 640;
            canvas.height = video.videoHeight || 480;

            const localCtx = canvas.getContext('2d');
            localCtx.translate(canvas.width, 0);
            localCtx.scale(-1, 1);
            localCtx.drawImage(video, 0, 0, canvas.width, canvas.height);

            const fotoBase64 = canvas.toDataURL('image/jpeg', 0.65);

            try {
                let deteccion = await faceapi.detectSingleFace(canvas, detectorPrincipal)
                    .withFaceLandmarks()
                    .withFaceDescriptor();

                if (!deteccion) {
                    deteccion = await faceapi.detectSingleFace(canvas, detectorAlternativo)
                        .withFaceLandmarks()
                        .withFaceDescriptor();
                }

                if (deteccion) {
                    const vectorArray = Array.from(deteccion.descriptor);
                    actualizarEstado("Guardando en la carpeta...", "blue");

                    const response = await fetch('capturaRostro.aspx/GuardarBiometria', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json; charset=utf-8' },
                        body: JSON.stringify({
                            fotoBase64: fotoBase64,
                            vectorJson: JSON.stringify(vectorArray)
                        })
                    });

                    const resData = await response.json();
                    const resultado = resData.d;

                    if (resultado.exito) {
                        actualizarEstado("Guardado completado", "green");
                        alert("Rostro y vector guardados");
                        window.location.href = 'validacionRostro.aspx'; // -> aqui ponga el formulario que sigue
                    } else {
                        actualizarEstado("Error al guardar: " + resultado.mensaje, "red");
                    }
                } else {
                    actualizarEstado("No se pudo extraer la cara. Intenta de nuevo.", "red");
                }
            } catch (e) {
                console.error("Error al extraer el vector:", e);
                actualizarEstado("Error al extraer el rostro.", "red");
            } finally {
                btnCapturar.disabled = false;
            }
        }
    </script>
</body>
</html>