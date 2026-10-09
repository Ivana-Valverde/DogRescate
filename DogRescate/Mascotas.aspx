<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Mascotas.aspx.cs" Inherits="perros.Mascotas" %>

<%@ Register Src="~/modelo/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/modelo/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="estilos/estilos.css" rel="stylesheet" type="text/css" />
    <link href="estilos/styles.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        main {
            min-height: 100vh;
            padding: 70px 5%;
            background: radial-gradient(
                ellipse at top,
                #331A09 0%,
                #111110 50%
            );
        }
        .auto-style1{
            font-size:50px;
        }
        .auto-style2{
            padding:20px 20px 0px;
        }
        .auto-style4 {
            color: #C0C0C0;
            height: 26px;
        }
        .huella{
            display: block;
            padding: 4px;
            font-size: 23px;
            text-align:center;

        }
        .btn-info {
        width: 100%;
        margin-top: 15px;
        padding: 12px;
        border: 1px solid #e87928;
        border-radius: 10px;
        background: transparent;
        color: #ff994e;
        font-weight: bold;
        cursor: pointer;
        }

        .btn-info:hover {
            background: #e87928;
            color: #111110;
        }

       
        .fondo-modal {
            background-color: #000;
            opacity: 0.75;
        }

      
        .ventana-mascota {
            box-sizing: border-box;
            width: 460px;
            max-width: 92vw;
            max-height: 85vh;
            overflow-y: auto;
            border: 1px solid #664026;
            border-radius: 18px;
            background: #191613;
            color: white;
            box-shadow: 0 20px 60px rgba(0, 0, 0, 0.6);
        }

        .cabecera-modal {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 15px;
            padding: 18px 22px;
        }

        .cabecera-modal h2 {
            margin: 0;
            color: #ff994e;
            font-size:30px;
        }

        .cerrar-modal {
            width: 34px;
            height: 34px;
            border: none;
            border-radius: 50%;
            background: #33251b;
            color: white;
            cursor: pointer;
        }

        .foto-modal {
            display: block;
            width: 100%;
            height: 230px;
            object-fit: cover;
        }

        .informacion-modal {
            padding: 22px;
        }

        .detalles-mascota {
            display: flex;
            gap: 10px;
        }

        .detalles-mascota span {
            padding: 6px 12px;
            border-radius: 20px;
            background: #33251b;
            color: #ffc18f;
            font-size: 13px;
        }

        .informacion-modal p {
            color: #d2cbc5;
            line-height: 1.6;
            font-size:15px;
            padding:12px 0px;
        }

        .aviso-adopcion {
            padding: 12px;
            border-left: 3px solid #e87928;
            background: #251d17;
            font-size: 13px;
            margin:5px;
        }

        .btn-adoptar {
            display: block;
            margin-top: 18px;
            padding: 13px;
            border-radius: 10px;
            background: #e87928;
            color: #111110;
            text-align: center;
            text-decoration: none;
            font-weight: bold;
        }

        .btn-adoptar:hover {
            background: #ff994e;
        }
        .auto-style5 {
            color: #FF9933;
        }
        .auto-style6 {
            color: #FFFFFF;
        }
    </style>
    <script>
        (function() {
            if (!window.chatbase || window.chatbase("getState") !== "initialized") {
                window.chatbase = (...arguments) => {
                    if (!window.chatbase.q) {
                        window.chatbase.q = []
                    }
                    window.chatbase.q.push(arguments)
                };
                window.chatbase = new Proxy(window.chatbase, {
                    get(target, prop) {
                        if (prop === "q") {
                            return target.q
                        }
                        return (...args) => target(prop, ...args)
                    }
                })
            }
            const onLoad = function() {
                const script = document.createElement("script");
                script.src = "https://www.chatbase.co/embed.min.js";
                script.id = "OmKIof1Sh7hX9EL3LSyn8";
                script.domain = "www.chatbase.co";
                document.body.appendChild(script)
            };
            if (document.readyState === "complete") {
                onLoad()
            } else {
                window.addEventListener("load", onLoad)
            }
        })();
    </script>
</head>
<body style="background-color:black">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <uc:Header ID="Header1" runat="server" />
        <main>
            <div>
                <h3 class="auto-style2">ADOPCIONES</h3>
                <h1 class="auto-style1">CONOCELOS. ELIGE A TU </h1>
                <h1 class="auto-style1">COMPAÑERO</h1>
                <p class="auto-style4">Cada uno tiene su historia y una personalidad única</p>

            </div>
                <section>
                    <div class="lista-perros">
                        <article class="tarjeta-perro">
                            <div class="foto-contenedor">
                                <img src="img/perro policia.jpg" alt="Luna"/>
                                <div class="etiquetas">
                                    <span class="tamano">MEDIANO</span>
                                    <span class="disponible">DISPONIBLE</span>
                                </div>
                            </div>
                            <div class="datos-perro">
                                <div class="nombre-edad">
                                    <h2>Luna</h2>
                                    <span>5 años</span>
                                </div>
                                <p>Cariñosa y tranquila. Ideal para familias.</p>
                                <asp:Button
                                    ID="btnInfoLuna"
                                    runat="server"
                                    Text="Ver información"
                                    CssClass="btn-info"
                                    CausesValidation="false" />
                            </div>
                        </article>

                        <article class="tarjeta-perro">
                            <div class="foto-contenedor">
                                <img src="img/solicitud.jpg" alt="Rocco"/>
                                <div class="etiquetas">
                                    <span class="tamano">PEQUEÑO</span>
                                    <span class="disponible">DISPONIBLE</span>
                                </div>
                            </div>
                            <div class="datos-perro">
                                <div class="nombre-edad">
                                    <h2>Rocco</h2>
                                    <span>2 años</span>
                                </div>
                                <p>Juguetón y sociable. Ideal para familias activas.</p>
                                 <asp:Button
                                    ID="btnInfoRocco"
                                    runat="server"
                                    Text="Ver información"
                                    CssClass="btn-info"
                                    CausesValidation="false" />
                            </div>
                        </article>

                        <article class="tarjeta-perro">
                            <div class="foto-contenedor">
                                <img src="img/perro golden.jpg" alt="Nela"/>
                                <div class="etiquetas">
                                    <span class="tamano">GRANDE</span>
                                    <span class="urgente">URGENTE</span>
                                </div>
                            </div>
                            <div class="datos-perro">
                                <div class="nombre-edad">
                                    <h2>Nela</h2>
                                    <span>4 años</span>
                                </div>
                                <p>Inteligente y tranquila. Necesita hogar sin gatos.</p>
                                <asp:Button
                                    ID="btnInfoNela"
                                    runat="server"
                                    Text="Ver información"
                                    CssClass="btn-info"
                                    CausesValidation="false" />
                            </div>
                        </article>
                    </div>
                </section>
        </main>
        <asp:Panel
            ID="pnlInfoLuna"
            runat="server"
            CssClass="ventana-mascota"
            Style="display: none;">

            <div class="cabecera-modal">
                <h2>Conoce a Luna</h2>

                <asp:Button
                    ID="btnCerrarLuna"
                    runat="server"
                    Text="✕"
                    CssClass="cerrar-modal"
                    CausesValidation="false" />
            </div>

            <img src="img/perro policia.jpg"
                 alt="Luna"
                 class="foto-modal" />

            <div class="informacion-modal">
                <div class="detalles-mascota">
                    <span>5 años</span>
                    <span>Mediano</span>
                </div>

                <p>
                    Luna es cariñosa y tranquila.
                    Es una compañera ideal para familias.
                </p>

                <p class="aviso-adopcion">
                    Para solicitar su adopción, inicia sesión.
                    Si todavía no tienes una cuenta, podrás registrarte
                    desde la página de acceso.
                </p>

                <asp:HyperLink
                    ID="lnkAdoptarLuna"
                    runat="server"
                    NavigateUrl="~/Login.aspx"
                    CssClass="btn-adoptar">
                    Iniciar sesión para adoptar 🐾
                </asp:HyperLink>
            </div>
        </asp:Panel>

        <asp:Panel
        ID="pnlInfoRocco"
        runat="server"
        CssClass="ventana-mascota"
        Style="display: none;">

        <div class="cabecera-modal">
            <h2>Conoce a Rocco</h2>

            <asp:Button
                ID="btnCerrarRocco"
                runat="server"
                Text="✕"
                CssClass="cerrar-modal"
                CausesValidation="false" />
        </div>

        <img src="img/solicitud.jpg"
             alt="Rocco"
             class="foto-modal" />

        <div class="informacion-modal">
            <div class="detalles-mascota">
                <span>2 años</span>
                <span>Pequeño</span>
            </div>

            <p>
                Rocco es juguetón y sociable.
                Es un compañero ideal para familias activas.
            </p>

            <p class="aviso-adopcion">
                Para solicitar su adopción, inicia sesión.
                Si todavía no tienes una cuenta, podrás registrarte
                desde la página de acceso.
            </p>

            <asp:HyperLink
                ID="lnkAdoptarRocco"
                runat="server"
                NavigateUrl="~/Login.aspx"
                CssClass="btn-adoptar">
                Iniciar sesión para adoptar 🐾
            </asp:HyperLink>
        </div>
    </asp:Panel>

        <asp:Panel
            ID="pnlInfoNela"
            runat="server"
            CssClass="ventana-mascota"
            Style="display: none;">

            <div class="cabecera-modal">
                <h2>Conoce a Nela</h2>

                <asp:Button
                    ID="btnCerrarNela"
                    runat="server"
                    Text="✕"
                    CssClass="cerrar-modal"
                    CausesValidation="false" />
            </div>

            <img src="img/perro golden.jpg"
                 alt="Nela"
                 class="foto-modal" />

            <div class="informacion-modal">
                <div class="detalles-mascota">
                    <span>4 años</span>
                    <span>Grande</span>
                </div>

                <p>
                    Nela es inteligente y tranquila.
                    Necesita un hogar sin gatos.
                </p>

                <p class="aviso-adopcion">
                    Para solicitar su adopción, inicia sesión.
                    Si todavía no tienes una cuenta, podrás registrarte
                    desde la página de acceso.
                </p>

                <asp:HyperLink
                    ID="lnkAdoptarNela"
                    runat="server"
                    NavigateUrl="~/Login.aspx"
                    CssClass="btn-adoptar">
                    Iniciar sesión para adoptar 🐾
                </asp:HyperLink>
            </div>
        </asp:Panel>


    <asp:ModalPopupExtender
        ID="modalNela"
        runat="server"
        TargetControlID="btnInfoNela"
        PopupControlID="pnlInfoNela"
        CancelControlID="btnCerrarNela"
        BackgroundCssClass="fondo-modal" />


    <asp:AnimationExtender
        ID="animacionNela"
        runat="server"
        TargetControlID="btnInfoNela">

        <Animations>
            <OnClick>
                <FadeIn
                    AnimationTarget="pnlInfoNela"
                    Duration="1.5"
                    Fps="30" />
            </OnClick>
        </Animations>
    </asp:AnimationExtender>

        <asp:ModalPopupExtender
            ID="modalRocco"
            runat="server"
            TargetControlID="btnInfoRocco"
            PopupControlID="pnlInfoRocco"
            CancelControlID="btnCerrarRocco"
            BackgroundCssClass="fondo-modal" />


    <asp:AnimationExtender
        ID="animacionRocco"
        runat="server"
        TargetControlID="btnInfoRocco">

        <Animations>
            <OnClick>
                <FadeIn
                    AnimationTarget="pnlInfoRocco"
                    Duration="1.5"
                    Fps="30" />
            </OnClick>
        </Animations>
    </asp:AnimationExtender>

       
        <asp:ModalPopupExtender
            ID="modalLuna"
            runat="server"
            TargetControlID="btnInfoLuna"
            PopupControlID="pnlInfoLuna"
            CancelControlID="btnCerrarLuna"
            BackgroundCssClass="fondo-modal" />

       
        <asp:AnimationExtender
            ID="animacionLuna"
            runat="server"
            TargetControlID="btnInfoLuna">

            <Animations>
                <OnClick>
                    <FadeIn
                        AnimationTarget="pnlInfoLuna"
                        Duration="1.5"
                        Fps="30" />
                </OnClick>
            </Animations>
        </asp:AnimationExtender>
        <uc:Footer ID="Footer1" runat="server" />
    </form>
</body>
</html>
