<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="formAdmin.aspx.cs" Inherits="Proyecto.formAdmin" %>

<%@ Register Src="~/modelo/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/modelo/Footer.ascx" TagPrefix="uc" TagName="Footer" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Dog Rescate - Panel de Administración</title>

    <link href="~/estilos/bootstrap.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="~/estilos/estilos.css" rel="stylesheet" type="text/css" runat="server" />
    <link href="~/estilos/styles.css" rel="stylesheet" type="text/css" runat="server" />

    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333333;
        }

        /* Fuerza la disposición vertical: Header (arriba), Contenido (centro), Footer (abajo) */
        #form1 {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            width: 100%;
        }

        /* Contenedor que centra la tarjeta y da espacio superior para no taparla con el Header */
        .admin-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 130px 20px 60px 20px;
            box-sizing: border-box;
            width: 100%;
        }

        /* Tarjeta Blanca Centrada */
        .card-panel {
            background-color: #ffffff;
            width: 100%;
            max-width: 580px;
            padding: 40px 45px;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.08);
            box-sizing: border-box;
            text-align: center;
        }

        .titulo {
            font-size: 28px;
            font-weight: 800;
            color: #1a1a1a;
            margin: 0 0 6px 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .sub {
            font-size: 15px;
            color: #777777;
            margin-bottom: 30px;
        }

        .btn-admin-action {
            border: none;
            display: block;
            background-color: #f26522;
            color: #ffffff;
            padding: 18px 20px;
            margin-bottom: 16px;
            border-radius: 12px;
            font-size: 15px;
            font-weight: bold;
            letter-spacing: 0.5px;
            cursor: pointer;
            text-align: center;
            transition: all 0.2s ease-in-out;
            box-sizing: border-box;
            width: 100%;
            text-decoration: none;
        }

        .btn-admin-action:hover {
            background-color: #e05411;
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(242, 101, 34, 0.3);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        
        <uc:Header ID="HeaderControl" runat="server" />

        
        <div class="admin-container">
            <div class="card-panel">
                
                <h1 class="titulo">
                    <span>Hola, admin</span> 
                    <asp:Image ID="Image1" runat="server" Height="29px" ImageUrl="~/mano.PNG" Width="40px" />
                </h1>
                <p class="sub">Tienes privilegios para editar el catálogo.</p>

                <asp:Button ID="btnGestionarUsuarios" runat="server" CssClass="btn-admin-action" Text="GESTIONAR USUARIOS" OnClick="btnGestionarUsuarios_Click" />
                
                <asp:Button ID="btnGestionarSolicitudes" runat="server" CssClass="btn-admin-action" Text="GESTIONAR SOLICITUDES" OnClick="btnGestionarSolicitudes_Click" />
                
                <asp:Button ID="btnRegistrarMascota" runat="server" CssClass="btn-admin-action" Text="REGISTRAR NUEVA MASCOTA" OnClick="btnRegistrarMascota_Click" />

            </div>
        </div>

        <!-- Footer Inferior -->
        <uc:Footer ID="FooterControl" runat="server" />

    </form>
</body>
</html>