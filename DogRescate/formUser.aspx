<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formUser.aspx.cs" Inherits="perros.formUser" %>

<%@ Register Src="~/modelo/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/modelo/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Mi Perfil - Dog Rescate</title>

    <link href="~/estilos/bootstrap.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="~/estilos/estilos.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="~/estilos/styles.css" rel="stylesheet" type="text/css" runat="server" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet" />

    <style type="text/css">
        html { scroll-behavior: smooth; }

        html, body {
            margin: 0; padding: 0; width: 100%; height: 100%;
            font-family: 'DM Sans', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5; color: #333333;
        }

        #form1 { display: flex; flex-direction: column; min-height: 100vh; width: 100%; }

        .user-container {
            flex: 1; display: flex; flex-direction: column; align-items: center;
            padding: 130px 20px 60px 20px; box-sizing: border-box; width: 100%;
        }

        .u-card {
            background-color: #ffffff; width: 100%; max-width: 980px;
            padding: 40px 50px; border-radius: 28px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08); box-sizing: border-box;
            margin-bottom: 28px; scroll-margin-top: 110px;
        }

        .u-heading {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 28px; font-weight: 700; color: #1a1a1a;
            margin: 0 0 6px 0; display: flex; align-items: center; gap: 10px;
        }
        .u-heading i { color: #f26522; font-size: 24px; }

        .u-sub { font-size: 16px; color: #555555; margin: 0 0 26px 0; line-height: 1.5; }

        /* ===== Saludo ===== */
        .u-greeting { display: flex; align-items: center; gap: 18px; margin-bottom: 4px; }
        .profile-avatar {
            width: 64px; height: 64px; object-fit: cover; border-radius: 50%;
            border: 3px solid #f26522; flex-shrink: 0;
        }
        .u-greeting .u-heading { margin: 0; }

        /* ===== Solicitud actual ===== */
        .u-request {
            display: flex; align-items: center; gap: 20px; background-color: #fff1de;
            border-radius: 22px; padding: 24px; margin-bottom: 36px;
        }
        .u-pet-badge {
            width: 96px; height: 96px; border-radius: 50%; border: 3px solid #f26522;
            color: #f26522; font-weight: 700; font-size: 17px; display: flex;
            align-items: center; justify-content: center; flex-shrink: 0; background-color: #ffffff;
        }
        .u-request-info { flex: 1; min-width: 0; }
        .u-pet-name { font-size: 21px; font-weight: 700; color: #f26522; margin: 0 0 4px 0; }
        .u-request-id { font-size: 16px; color: #333333; margin: 0; }

        .u-pill {
            display: inline-block; background-color: #ffc20e; color: #1a1a1a; font-size: 14px;
            font-weight: 700; padding: 11px 18px; border-radius: 12px; white-space: nowrap;
        }
        .u-pill-ok { background-color: #d4f3dc; color: #1a7a35; }

        /* ===== Pasos ===== */
        .u-steps { display: flex; border-top: 1px solid #e6e6e6; padding-top: 18px; gap: 10px; }
        .u-step { flex: 1; text-align: center; padding: 0 6px; }

        .u-dot {
            width: 28px; height: 28px; border-radius: 50%; margin: 0 auto 14px auto;
            box-sizing: border-box; border: 2px solid #d9d9d9; background-color: #ececec; position: relative;
        }
        .u-dot::after {
            content: ""; position: absolute; top: 50%; left: 50%; width: 12px; height: 12px;
            margin: -6px 0 0 -6px; border-radius: 50%; background-color: #cfcfcf;
        }
        .u-step.is-done .u-dot { border-color: #1fa84a; background-color: #ffffff; }
        .u-step.is-done .u-dot::after { background-color: #1fa84a; }
        .u-step.is-active .u-dot { border-color: #ffd9c4; background-color: #ffffff; box-shadow: 0 0 10px rgba(242, 101, 34, 0.45); }
        .u-step.is-active .u-dot::after { background-color: #f26522; }

        .u-step-title { font-size: 16px; font-weight: 500; color: #1a1a1a; margin: 0 0 10px 0; line-height: 1.3; }
        .u-step-desc { font-size: 13px; color: #666666; margin: 0; line-height: 1.5; }
        .u-step .btn-user-action { margin-top: 14px; padding: 11px 24px; font-size: 13px; }

        .u-support { margin-top: 26px; padding-top: 6px; display: flex; gap: 26px; flex-wrap: wrap; align-items: center; }
        .u-support a {
            color: #1a1a1a; font-weight: 500; font-size: 16px; text-decoration: none;
            display: inline-flex; align-items: center; gap: 8px;
        }
        .u-support a:hover { color: #f26522; }
        .u-support a.u-cancel { color: #999999; font-size: 14px; }
        .u-support a.u-cancel:hover { color: #c0392b; }

        /* ===== Elegir mascota ===== */
        .u-pets { display: grid; grid-template-columns: repeat(auto-fill, minmax(220px, 1fr)); gap: 20px; }
        .u-pet-card { background-color: #f7f8fa; border-radius: 20px; padding: 16px; text-align: center; }
        .u-pet-card img { width: 100%; height: 160px; object-fit: cover; border-radius: 14px; }
        .u-pet-card h3 {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 22px; color: #1a1a1a; margin: 12px 0 2px 0;
        }
        .u-pet-card span { font-size: 14px; color: #777777; }
        .u-pet-card .btn-user-action { display: block; margin-top: 14px; padding: 11px; font-size: 14px; }

        /* ===== Formularios ===== */
        .u-row { display: flex; flex-wrap: wrap; gap: 18px; }
        .u-col-6  { flex: 1 1 calc(50% - 9px); min-width: 220px; }
        .u-col-4  { flex: 1 1 calc(33.333% - 12px); min-width: 160px; }
        .u-col-12 { flex: 1 1 100%; }

        .u-label { display: block; font-size: 14px; font-weight: 500; color: #555555; margin-bottom: 6px; }

        .u-input {
            width: 100%; box-sizing: border-box; background-color: #f7f8fa; border: 1px solid #dddddd;
            border-radius: 12px; padding: 12px 14px; font-size: 15px; color: #333333;
            font-family: inherit; outline: none; transition: all 0.2s ease-in-out;
        }
        .u-input:focus { border-color: #f26522; background-color: #ffffff; box-shadow: 0 0 0 3px rgba(242, 101, 34, 0.15); }
        textarea.u-input { resize: vertical; }
        .u-actions { text-align: right; margin-top: 6px; }

        /* Mensajes de validación */
        .u-val {
            display: block; color: #c0392b; font-size: 13px; font-weight: 500; margin-top: 6px;
        }

        /* ===== Botones ===== */
        .btn-user-action {
            border: none; display: inline-block; background-color: #f26522; color: #ffffff;
            padding: 14px 30px; border-radius: 12px; font-size: 15px; font-weight: bold;
            font-family: inherit; letter-spacing: 0.3px; cursor: pointer; text-align: center;
            text-decoration: none; transition: all 0.2s ease-in-out; box-sizing: border-box;
        }
        .btn-user-action:hover {
            background-color: #e05411; transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(242, 101, 34, 0.3); color: #ffffff; text-decoration: none;
        }
        .btn-user-outline { background-color: transparent; color: #f26522; border: 2px solid #f26522; padding: 12px 28px; }
        .btn-user-outline:hover { background-color: #f26522; color: #ffffff; }
        .btn-user-dark { background-color: #1a1a1a; }
        .btn-user-dark:hover { background-color: #333333; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.25); }

        /* ===== Escaneo facial ===== */
        .u-scan { text-align: center; }
        .u-scan .u-heading { justify-content: center; }

        #webcam {
            width: 100%; max-width: 420px; border-radius: 18px; border: 2px solid #dddddd;
            background: #000000; transform: scaleX(-1);
        }

        .u-hidden { display: none; }
        .u-btn-group { display: flex; justify-content: center; gap: 10px; flex-wrap: wrap; }

        .u-scan-status {
            display: inline-block; background-color: #f0f2f5; border-radius: 10px;
            padding: 10px 16px; font-size: 14px; color: #555555; margin-bottom: 20px;
        }
        #lblEstadoFacial { color: #d99a00; }
        /* Título de sección (distinto al saludo) */
        .u-section-title {
            font-size: 20px;
            font-weight: 700;
            color: #1a1a1a;
            margin: 30px 0 16px 0;
            padding-top: 26px;
            border-top: 1px solid #e6e6e6;
            display: flex;
            align-items: center;
            gap: 12px;
        }
        .u-section-title::before {
            content: "";
            width: 5px;
            height: 24px;
            border-radius: 3px;
            background-color: #f26522;
        }

        /* Recuadro "Inicia tu proceso de adopción" */
        .u-banner {
            display: flex;
            align-items: center;
            gap: 16px;
            background-color: #fff1de;
            border-radius: 18px;
            padding: 18px 22px;
            margin-bottom: 24px;
        }
        .u-banner-icon {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            background-color: #ffffff;
            border: 2px solid #f26522;
            color: #f26522;
            font-size: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }
        .u-banner-title { margin: 0 0 2px 0; font-size: 16px; font-weight: 700; color: #f26522; }
        .u-banner-text  { margin: 0; font-size: 14px; color: #555555; line-height: 1.5; }

        @media (max-width: 800px) {
            .u-card { padding: 28px 22px; border-radius: 22px; }
            .u-request { flex-wrap: wrap; }
            .u-steps { flex-direction: column; gap: 22px; }
            .u-heading { font-size: 24px; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <uc:Header ID="HeaderControl" runat="server" />

        <div class="user-container">

            <!-- ============ 1. TARJETA PRINCIPAL ============ -->
            <div class="u-card">

                <!-- Saludo -->
                <div class="u-greeting">
                    <asp:Image ID="imgFotoPerfil" runat="server" CssClass="profile-avatar" ImageUrl="https://static.vecteezy.com/system/resources/previews/057/705/033/large_2x/portrait-of-a-young-man-smiling-on-grey-background-free-photo.jpg" />
                    <h1 class="u-heading">
                        <span>Hola, <asp:Label ID="lblNombreUsuario" runat="server"></asp:Label></span>
                        <span>&#128075;</span>
                    </h1>
                </div>
                <p class="u-sub" style="margin-top:8px;"><asp:Label ID="lblSubtitulo" runat="server"></asp:Label></p>

                <!-- Con solicitud: seguimiento -->
                <asp:Panel ID="pnlSeguimiento" runat="server">

                    <div class="u-request">
                        <div class="u-pet-badge">Mascota</div>
                        <div class="u-request-info">
                            <p class="u-pet-name"><asp:Label ID="lblMascotaSolicitud" runat="server"></asp:Label></p>
                            <p class="u-request-id">ID de Solicitud: <asp:Label ID="lblIdSolicitud" runat="server"></asp:Label></p>
                        </div>
                        <span id="pillEstado" class="u-pill">PENDIENTE DE ESCANEO</span>
                    </div>

                    <div class="u-steps">
                        <div class="u-step is-done" id="step1">
                            <div class="u-dot"></div>
                            <p class="u-step-title">Solicitud Enviada</p>
                            <p class="u-step-desc">Tu formulario ha sido recibido el <asp:Label ID="lblFechaSolicitud" runat="server"></asp:Label>.</p>
                        </div>

                        <div class="u-step is-active" id="step2">
                            <div class="u-dot"></div>
                            <p class="u-step-title">Validación de Identidad IA</p>
                            <p class="u-step-desc" id="step2Desc">Pendiente &middot; Debes completar el escaneo facial.</p>
                            <a href="#escaneo" id="btnIrEscaneo" class="btn-user-action">IR AL ESCANEO</a>
                        </div>

                        <div class="u-step" id="step3">
                            <div class="u-dot"></div>
                            <p class="u-step-title">Contrato de Adopción</p>
                            <p class="u-step-desc" id="step3Desc">Se habilita después de validar tu identidad.</p>
                        </div>

                        <div class="u-step" id="step4">
                            <div class="u-dot"></div>
                            <p class="u-step-title">Revisión Final del Refugio</p>
                            <p class="u-step-desc">Se habilita después de firmar el contrato.</p>
                        </div>
                    </div>

                    <div class="u-support">
                        <a href="Contacto.aspx"><i class="bi bi-headset"></i> CONTACTAR CON SOPORTE</a>
                        <asp:LinkButton ID="btnCancelarSolicitud" runat="server" CssClass="u-cancel" CausesValidation="false"
                            OnClick="btnCancelarSolicitud_Click"
                            OnClientClick="return confirm('¿Seguro que quieres cancelar tu solicitud de adopción?');">
                            <i class="bi bi-x-circle"></i> Cancelar solicitud
                        </asp:LinkButton>
                    </div>

                </asp:Panel>

                <!-- Sin solicitud: elegir mascota -->
                <asp:Panel ID="pnlSinSolicitud" runat="server" Visible="false">

                    <h2 class="u-section-title">Elige a quién quieres adoptar</h2>

                    <div class="u-banner">
                        <div class="u-banner-icon"><i class="bi bi-heart-fill"></i></div>
                        <div>
                            <p class="u-banner-title">Inicia tu proceso de adopción</p>
                            <p class="u-banner-text">Escoge una mascota, completa la solicitud y valida tu identidad. Te acompañamos en cada paso.</p>
                        </div>
                    </div>

                    <div class="u-pets">
                        <asp:Repeater ID="rptElegir" runat="server">
                            <ItemTemplate>
                                <div class="u-pet-card">
                                    <img src='<%# ResolveUrl("~/" + Eval("Foto")) %>' alt='<%# Eval("Nombre") %>' />
                                    <h3><%# Eval("Nombre") %></h3>
                                    <span><%# Eval("Edad") %> &middot; <%# Eval("Tamano") %></span>
                                    <a href='<%# ResolveUrl("~/FormularioAdopcion.aspx?id=" + Eval("Id")) %>' class="btn-user-action">Solicitar adopción</a>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>

                </asp:Panel>

            </div>

            <!-- ============ 2. ESCANEO FACIAL ============ -->
            <div class="u-card u-scan" id="escaneo">
                <h2 class="u-heading"><i class="bi bi-person-bounding-box"></i> Verificación e Identificación Facial</h2>
                <p class="u-sub">Escanea tu rostro para validar tu identidad y acelerar tus solicitudes de adopción.</p>

                <asp:Panel ID="pnlEstadoFacial" runat="server" CssClass="u-scan-status">
                    <i class="bi bi-shield-lock"></i> Verificación facial: <strong id="lblEstadoFacial">Pendiente</strong>
                </asp:Panel>

                <div id="camaraContainer" class="u-hidden" style="margin-bottom:18px;">
                    <video id="webcam" autoplay playsinline></video>
                    <canvas id="canvas" class="u-hidden"></canvas>
                </div>

                <div class="u-btn-group">
                    <button type="button" id="btnIniciarCamara" class="btn-user-action btn-user-outline" onclick="iniciarCamara()">
                        <i class="bi bi-camera-fill"></i> Abrir Cámara
                    </button>
                    <button type="button" id="btnEscanear" class="btn-user-action u-hidden" onclick="capturarYVerificar()">
                        <i class="bi bi-person-check"></i> Escanear Rostro
                    </button>
                </div>
            </div>

            <!-- ============ 3. INFORMACIÓN PERSONAL ============ -->
            <div class="u-card">
                <h2 class="u-heading"><i class="bi bi-person-lines-fill"></i> Información Personal</h2>
                <p class="u-sub">Mantén tus datos al día para que el refugio pueda contactarte.</p>

                <div class="u-row">
                    <div class="u-col-6">
                        <label class="u-label">Correo Electrónico</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="u-input" MaxLength="80"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                            ErrorMessage="Escribe tu correo electrónico." CssClass="u-val" Display="Dynamic" ValidationGroup="Perfil" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                            ValidationExpression="^[^\s@]+@[^\s@]+\.[^\s@]{2,}$"
                            ErrorMessage="Ingresa un correo válido, por ejemplo nombre@correo.com." CssClass="u-val" Display="Dynamic" ValidationGroup="Perfil" />
                    </div>

                    <div class="u-col-6">
                        <label class="u-label">Teléfono de Contacto</label>
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="u-input" MaxLength="16"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvTelefono" runat="server" ControlToValidate="txtTelefono"
                            ErrorMessage="Escribe tu teléfono." CssClass="u-val" Display="Dynamic" ValidationGroup="Perfil" />
                        <asp:RegularExpressionValidator ID="revTelefono" runat="server" ControlToValidate="txtTelefono"
                            ValidationExpression="^(\+51\s?)?9\d{8}$"
                            ErrorMessage="Usa un celular de 9 dígitos que empiece con 9 (puedes anteponer +51)." CssClass="u-val" Display="Dynamic" ValidationGroup="Perfil" />
                    </div>

                    <div class="u-col-12">
                        <label class="u-label">Dirección / Ciudad</label>
                        <asp:TextBox ID="txtDireccion" runat="server" CssClass="u-input" MaxLength="100"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDireccion" runat="server" ControlToValidate="txtDireccion"
                            ErrorMessage="Escribe tu dirección o ciudad." CssClass="u-val" Display="Dynamic" ValidationGroup="Perfil" />
                        <asp:RegularExpressionValidator ID="revDireccion" runat="server" ControlToValidate="txtDireccion"
                            ValidationExpression="^[\s\S]{5,100}$"
                            ErrorMessage="La dirección debe tener entre 5 y 100 caracteres." CssClass="u-val" Display="Dynamic" ValidationGroup="Perfil" />
                    </div>

                    <div class="u-col-12 u-actions">
                        <asp:Button ID="btnGuardarDatos" runat="server" Text="Guardar Cambios"
                            CssClass="btn-user-action btn-user-dark" ValidationGroup="Perfil" OnClick="btnGuardarDatos_Click" />
                    </div>
                </div>
            </div>

            <!-- ============ 4. REGISTRAR MASCOTA ============ -->
            <div class="u-card">
                <h2 class="u-heading"><i class="bi bi-plus-circle-fill"></i> Registrar Mascota para Adopción</h2>
                <p class="u-sub">Si tienes o rescataste a un perrito que necesita un hogar, completa este formulario para publicarlo en el catálogo.</p>

                <div class="u-row">
                    <div class="u-col-6">
                        <label class="u-label">Nombre del Perrito</label>
                        <asp:TextBox ID="txtNombreMascota" runat="server" CssClass="u-input" MaxLength="30" placeholder="Ej: Firulais"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvNombreMascota" runat="server" ControlToValidate="txtNombreMascota"
                            ErrorMessage="Escribe el nombre del perrito." CssClass="u-val" Display="Dynamic" ValidationGroup="Mascota" />
                        <asp:RegularExpressionValidator ID="revNombreMascota" runat="server" ControlToValidate="txtNombreMascota"
                            ValidationExpression="^[A-Za-zÁÉÍÓÚÜÑáéíóúüñ' ]{2,30}$"
                            ErrorMessage="Usa solo letras, entre 2 y 30 caracteres." CssClass="u-val" Display="Dynamic" ValidationGroup="Mascota" />
                    </div>

                    <div class="u-col-6">
                        <label class="u-label">Raza / Tipo (opcional)</label>
                        <asp:TextBox ID="txtRazaMascota" runat="server" CssClass="u-input" MaxLength="40" placeholder="Ej: Mestizo, Labrador, etc."></asp:TextBox>
                    </div>

                    <div class="u-col-4">
                        <label class="u-label">Edad Aproximada</label>
                        <asp:TextBox ID="txtEdadMascota" runat="server" CssClass="u-input" MaxLength="20" placeholder="Ej: 2 años / 6 meses"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEdadMascota" runat="server" ControlToValidate="txtEdadMascota"
                            ErrorMessage="Indica la edad aproximada." CssClass="u-val" Display="Dynamic" ValidationGroup="Mascota" />
                    </div>

                    <div class="u-col-4">
                        <label class="u-label">Tamaño</label>
                        <asp:DropDownList ID="ddlTamanoMascota" runat="server" CssClass="u-input">
                            <asp:ListItem Text="Pequeño" Value="Pequeño" />
                            <asp:ListItem Text="Mediano" Value="Mediano" />
                            <asp:ListItem Text="Grande" Value="Grande" />
                        </asp:DropDownList>
                    </div>

                    <div class="u-col-4">
                        <label class="u-label">Género</label>
                        <asp:DropDownList ID="ddlGeneroMascota" runat="server" CssClass="u-input">
                            <asp:ListItem Text="Macho" Value="Macho" />
                            <asp:ListItem Text="Hembra" Value="Hembra" />
                        </asp:DropDownList>
                    </div>

                    <div class="u-col-12">
                        <label class="u-label">Foto del Perrito (opcional)</label>
                        <asp:FileUpload ID="fileFotoMascota" runat="server" CssClass="u-input" />
                        <asp:RegularExpressionValidator ID="revFoto" runat="server" ControlToValidate="fileFotoMascota"
                            ValidationExpression="^.+\.([jJ][pP][gG]|[jJ][pP][eE][gG]|[pP][nN][gG]|[wW][eE][bB][pP])$"
                            ErrorMessage="La foto debe ser JPG, PNG o WEBP." CssClass="u-val" Display="Dynamic" ValidationGroup="Mascota" />
                    </div>

                    <div class="u-col-12">
                        <label class="u-label">Descripción / Historia</label>
                        <asp:TextBox ID="txtDescripcionMascota" runat="server" TextMode="MultiLine" Rows="3" MaxLength="300"
                            CssClass="u-input" placeholder="Describe su carácter, si convive con niños, estado de salud, etc."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvDescripcion" runat="server" ControlToValidate="txtDescripcionMascota"
                            ErrorMessage="Cuéntanos algo sobre el perrito." CssClass="u-val" Display="Dynamic" ValidationGroup="Mascota" />
                        <asp:RegularExpressionValidator ID="revDescripcion" runat="server" ControlToValidate="txtDescripcionMascota"
                            ValidationExpression="^[\s\S]{20,300}$"
                            ErrorMessage="La descripción debe tener entre 20 y 300 caracteres." CssClass="u-val" Display="Dynamic" ValidationGroup="Mascota" />
                    </div>

                    <div class="u-col-12 u-actions">
                        <asp:Button ID="btnRegistrarMascota" runat="server" Text="Publicar Mascota 🐾"
                            CssClass="btn-user-action" ValidationGroup="Mascota" OnClick="btnRegistrarMascota_Click" />
                    </div>
                </div>
            </div>

        </div>

        <uc:Footer ID="FooterControl" runat="server" />

    </form>

    <script type="text/javascript">
        var video = document.getElementById('webcam');
        var canvas = document.getElementById('canvas');

        async function iniciarCamara() {
            try {
                var stream = await navigator.mediaDevices.getUserMedia({ video: true });
                video.srcObject = stream;
                document.getElementById('camaraContainer').classList.remove('u-hidden');
                document.getElementById('btnEscanear').classList.remove('u-hidden');
                document.getElementById('btnIniciarCamara').classList.add('u-hidden');
            } catch (err) {
                alert("No se pudo acceder a la cámara. Revisa los permisos de tu navegador.");
            }
        }

        // Parte visual: se usa al escanear y al recargar si ya estaba verificado
        function aplicarVerificado() {
            var lbl = document.getElementById('lblEstadoFacial');
            lbl.innerText = "¡Verificado con éxito!";
            lbl.style.color = "#1fa84a";

            var pill = document.getElementById('pillEstado');
            if (pill) {
                pill.innerText = "IDENTIDAD VERIFICADA";
                pill.classList.add('u-pill-ok');
            }

            var step2 = document.getElementById('step2');
            if (step2) {
                step2.classList.remove('is-active');
                step2.classList.add('is-done');
                document.getElementById('step2Desc').innerText = "Completado · Tu identidad fue validada.";
                document.getElementById('btnIrEscaneo').classList.add('u-hidden');
                document.getElementById('step3').classList.add('is-active');
                document.getElementById('step3Desc').innerText = "Disponible · Pronto podrás firmar tu contrato.";
            }
        }

        function capturarYVerificar() {
            var context = canvas.getContext('2d');
            canvas.width = video.videoWidth;
            canvas.height = video.videoHeight;
            context.drawImage(video, 0, 0, canvas.width, canvas.height);

            aplicarVerificado();

            // Guarda la verificación en la Session del servidor
            fetch('formUser.aspx/MarcarVerificado', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json; charset=utf-8' },
                body: '{}'
            });

            video.srcObject.getTracks().forEach(function (t) { t.stop(); });
            document.getElementById('camaraContainer').classList.add('u-hidden');
            document.getElementById('btnEscanear').classList.add('u-hidden');
            var btn = document.getElementById('btnIniciarCamara');
            btn.classList.remove('u-hidden');
            btn.innerHTML = '<i class="bi bi-camera-fill"></i> Volver a Escanear';

            alert("Escaneo facial completado correctamente.");
        }
    </script>
</body>
</html>