<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestionarSolicitudes.aspx.cs" Inherits="Proyecto.gestionarSolicitudes" %>

<%@ Register Src="~/modelo/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/modelo/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Dog Rescate - Gestión de Solicitudes</title>

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
            background-color: #f8f9fa;
            color: #333333;
        }

        /* Disposición vertical obligatoria: Header arriba, Contenido centro, Footer abajo */
        #form1 {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            width: 100%;
        }

        /* Empuja el contenido hacia abajo para que el Header no tape el título */
        .main-wrapper {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 130px 20px 60px 20px;
            box-sizing: border-box;
            width: 100%;
        }

        .container {
            width: 100%;
            max-width: 1100px;
            text-align: center;
        }

        .header-title {
            color: #ff6b2b;
            font-size: 32px;
            font-weight: 800;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            margin-bottom: 30px;
        }

        .custom-table {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
            border: 1px solid #f0f0f0;
        }

        .custom-table th {
            background-color: #f26522;
            color: #ffffff;
            padding: 14px 12px;
            font-weight: bold;
            font-size: 13px;
            text-align: left;
            border: none;
        }

        .custom-table td {
            padding: 14px 12px;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
            text-align: left;
            font-size: 13px;
            color: #333333;
        }

        .custom-table tr:last-child td {
            border-bottom: none;
        }

        .num-codigo {
            font-weight: bold;
            color: #1a1a1a;
        }

        .adoptante-nombre {
            font-weight: bold;
            display: block;
        }

        .adoptante-user {
            color: #777777;
            font-size: 12px;
        }

        .mascota-nombre {
            font-weight: bold;
            color: #e05411;
        }

        /* Badges de Estado */
        .badge-estado {
            padding: 6px 14px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
            display: inline-block;
            color: #ffffff;
        }

        .badge-pendiente { background-color: #ffc107; color: #000000; }
        .badge-aprobado { background-color: #28a745; }
        .badge-verificado { background-color: #17a2b8; }

        .acciones-texto {
            color: #888888;
            font-weight: 600;
            font-size: 12px;
        }

        .link-back {
            display: inline-block;
            margin-top: 25px;
            color: #888888;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
            border: none;
            background: none;
            cursor: pointer;
            transition: color 0.2s;
        }

        .link-back:hover {
            color: #444444;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        
        <!-- Header -->
        <uc:Header ID="HeaderControl" runat="server" />

        <!-- Contenedor central -->
        <div class="main-wrapper">
            <div class="container">
                
                <!-- Encabezado con Icono -->
                <div class="header-title">
                    <asp:Image ID="Image1" runat="server" Height="32px" ImageUrl="~/icon2.PNG" Width="32px" />
                    <span>Gestión de Solicitudes de Adopción</span>
                </div>

                <!-- Tabla GridView -->
                <asp:GridView ID="gvSolicitudes" runat="server" AutoGenerateColumns="False" CssClass="custom-table" GridLines="None" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="#">
                            <ItemTemplate>
                                <span class="num-codigo"><%# Eval("Codigo") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Adoptante">
                            <ItemTemplate>
                                <span class="adoptante-nombre"><%# Eval("NombreAdoptante") %></span>
                                <span class="adoptante-user"><%# Eval("UsuarioAdoptante") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="DNI" HeaderText="DNI" />

                        <asp:TemplateField HeaderText="Mascota">
                            <ItemTemplate>
                                <span class="mascota-nombre"><%# Eval("NombreMascota") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Vivienda" HeaderText="Vivienda" />
                        <asp:BoundField DataField="HorasSolo" HeaderText="Horas solo" />

                        <asp:TemplateField HeaderText="Identidad">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("Identidad")) ? "✅" : "⏳" %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contrato">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("Contrato")) ? "✅" : "⏳" %>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Estado">
                            <ItemTemplate>
                                <asp:Label ID="lblEstado" runat="server" 
                                    Text='<%# Eval("Estado") %>' 
                                    CssClass='<%# GetCssEstado(Eval("Estado").ToString()) %>'>
                                </asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Fecha" HeaderText="Fecha" />

                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <span class="acciones-texto"><%# Eval("Acciones") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <!-- Botón de retorno -->
                <asp:Button ID="btnVolver" runat="server" Text="← Volver al panel" CssClass="link-back" OnClick="btnVolver_Click" />

            </div>
        </div>

        <!-- Footer -->
        <uc:Footer ID="FooterControl" runat="server" />

    </form>
</body>
</html>