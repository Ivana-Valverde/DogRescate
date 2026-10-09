<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FormularioAdopcion.aspx.cs" Inherits="DogRescate.FormularioAdopcion" %>

<%@ Register Src="~/modelo/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/modelo/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Solicitud de Adopción - Dog Rescate</title>

    <link href="~/estilos/bootstrap.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="~/estilos/estilos.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="~/estilos/styles.css" rel="stylesheet" type="text/css" runat="server" />

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=DM+Sans:wght@400;500;700&family=Playfair+Display:wght@700&display=swap" rel="stylesheet" />

    <style type="text/css">
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
            background-color: #ffffff; width: 100%; max-width: 900px;
            padding: 40px 50px; border-radius: 28px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08); box-sizing: border-box;
        }

        .u-heading {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 28px; font-weight: 700; color: #1a1a1a;
            margin: 0 0 6px 0; display: flex; align-items: center; gap: 10px;
        }
        .u-heading i { color: #f26522; font-size: 24px; }

        .u-sub { font-size: 16px; color: #555555; margin: 0 0 26px 0; line-height: 1.5; }

        .u-section {
            font-family: 'Playfair Display', Georgia, serif;
            font-size: 20px; font-weight: 700; color: #1a1a1a;
            margin: 30px 0 16px 0; display: flex; align-items: center; gap: 8px;
        }
        .u-section i { color: #f26522; }

        .u-divider { border: 0; border-top: 1px solid #e6e6e6; margin: 30px 0 0 0; }

        .u-request {
            display: flex; align-items: center; gap: 20px;
            background-color: #fff1de; border-radius: 22px; padding: 20px 24px;
        }
        .u-pet-photo {
            width: 84px; height: 84px; border-radius: 50%; object-fit: cover;
            border: 3px solid #f26522; flex-shrink: 0; background: #ffffff;
        }
        .u-pet-name { font-size: 21px; font-weight: 700; color: #f26522; margin: 0 0 4px 0; }
        .u-request-id { font-size: 15px; color: #333333; margin: 0; }

        .u-row { display: flex; flex-wrap: wrap; gap: 18px; }
        .u-col-6  { flex: 1 1 calc(50% - 9px); min-width: 220px; }
        .u-col-12 { flex: 1 1 100%; }

        .u-label { display: block; font-size: 14px; font-weight: 500; color: #555555; margin-bottom: 6px; }

        .u-input {
            width: 100%; box-sizing: border-box; background-color: #f7f8fa;
            border: 1px solid #dddddd; border-radius: 12px; padding: 12px 14px;
            font-size: 15px; color: #333333; font-family: inherit; outline: none;
            transition: all 0.2s ease-in-out;
        }
        .u-input:focus { border-color: #f26522; background-color: #ffffff; box-shadow: 0 0 0 3px rgba(242, 101, 34, 0.15); }
        .u-input[readonly] { background-color: #eceef1; color: #777777; cursor: default; }
        textarea.u-input { resize: vertical; }

        .u-error { color: #c0392b; font-size: 14px; font-weight: 500; margin-top: 14px; display: block; }

        .u-footer-actions {
            display: flex; justify-content: space-between; align-items: center;
            gap: 12px; flex-wrap: wrap; margin-top: 34px;
        }

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
        .btn-user-outline { background-color: transparent; color: #555555; border: 2px solid #cccccc; padding: 12px 28px; }
        .btn-user-outline:hover { background-color: #1a1a1a; border-color: #1a1a1a; color: #ffffff; box-shadow: none; }

        @media (max-width: 800px) {
            .u-card { padding: 28px 22px; border-radius: 22px; }
            .u-heading { font-size: 24px; }
            .u-request { flex-wrap: wrap; }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <uc:Header ID="HeaderControl" runat="server" />

        <div class="user-container">
            <div class="u-card">

                <h1 class="u-heading"><i class="bi bi-file-earmark-text-fill"></i> Solicitud de Adopción</h1>
                <p class="u-sub">Completa la información para procesar la adopción de tu nueva mascota.</p>

                <!-- Mascota elegida -->
                <div class="u-request">
                    <asp:Image ID="imgPerro" runat="server" CssClass="u-pet-photo" />
                    <div>
                        <p class="u-pet-name">Mascota a adoptar: <asp:Label ID="lblNombrePerro" runat="server" Text="Cargando..."></asp:Label></p>
                        <p class="u-request-id">Código de referencia: #<asp:Label ID="lblIdPerro" runat="server" Text="00"></asp:Label></p>
                    </div>
                </div>

                <!-- 1. Datos del solicitante -->
                <h2 class="u-section"><i class="bi bi-person-check-fill"></i> 1. Datos del solicitante</h2>
                <div class="u-row">
                    <div class="u-col-6">
                        <label class="u-label">Nombre completo</label>
                        <asp:TextBox ID="txtNombreUsuario" runat="server" CssClass="u-input" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="u-col-6">
                        <label class="u-label">Correo electrónico</label>
                        <asp:TextBox ID="txtEmailUsuario" runat="server" CssClass="u-input" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="u-col-6">
                        <label class="u-label">Teléfono</label>
                        <asp:TextBox ID="txtTelefonoUsuario" runat="server" CssClass="u-input" ReadOnly="true"></asp:TextBox>
                    </div>
                    <div class="u-col-6">
                        <label class="u-label">Verificación facial</label>
                        <asp:TextBox ID="txtEstadoFacial" runat="server" CssClass="u-input" ReadOnly="true"></asp:TextBox>
                    </div>
                </div>

                <hr class="u-divider" />

                <!-- 2. Hogar -->
                <h2 class="u-section"><i class="bi bi-house-door-fill"></i> 2. Información del hogar</h2>
                <div class="u-row">
                    <div class="u-col-6">
                        <label class="u-label">Tipo de vivienda</label>
                        <asp:DropDownList ID="ddlTipoVivienda" runat="server" CssClass="u-input">
                            <asp:ListItem Text="Casa con jardín" Value="CasaConJardin" />
                            <asp:ListItem Text="Casa sin jardín" Value="CasaSinJardin" />
                            <asp:ListItem Text="Departamento" Value="Departamento" />
                        </asp:DropDownList>
                    </div>
                    <div class="u-col-6">
                        <label class="u-label">¿Tienes otras mascotas?</label>
                        <asp:DropDownList ID="ddlOtrasMascotas" runat="server" CssClass="u-input">
                            <asp:ListItem Text="No" Value="No" />
                            <asp:ListItem Text="Sí (perros)" Value="Si_Perros" />
                            <asp:ListItem Text="Sí (gatos)" Value="Si_Gatos" />
                            <asp:ListItem Text="Sí (otros)" Value="Si_Otros" />
                        </asp:DropDownList>
                    </div>
                    <div class="u-col-12">
                        <label class="u-label">¿Por qué deseas adoptar a este perrito?</label>
                        <asp:TextBox ID="txtMotivo" runat="server" TextMode="MultiLine" Rows="4" CssClass="u-input" placeholder="Cuéntanos brevemente tu motivación..."></asp:TextBox>
                    </div>
                </div>

                <asp:Label ID="lblError" runat="server" CssClass="u-error" Visible="false"></asp:Label>

                <div class="u-footer-actions">
                    <a href="Mascotas.aspx" class="btn-user-action btn-user-outline">Cancelar</a>
                    <asp:Button ID="btnEnviarSolicitud" runat="server" Text="Enviar solicitud de adopción 🐾" CssClass="btn-user-action" OnClick="btnEnviarSolicitud_Click" />
                </div>

            </div>
        </div>

        <uc:Footer ID="FooterControl" runat="server" />

    </form>
</body>
</html>