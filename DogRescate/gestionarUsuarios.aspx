<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="gestionarUsuarios.aspx.cs" Inherits="Proyecto.gestionarUsuarios" %>

<%@ Register Src="~/modelo/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/modelo/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Dog Rescate - Gestión de Usuarios</title>

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

        /* Fuerza la disposición vertical: Header arriba, Contenido al medio, Footer abajo */
        #form1 {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            width: 100%;
        }

        /* Espaciado superior para despejar el menú desplegable del Header */
        .main-content {
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
            max-width: 980px;
            text-align: center;
        }

        /* Título del encabezado */
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

        /* Buscador */
        .search-box {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 12px;
            margin-bottom: 25px;
        }

        .input-search {
            flex-grow: 1;
            padding: 12px 18px;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            font-size: 14px;
            outline: none;
            background-color: #ffffff;
            box-shadow: inset 0 1px 2px rgba(0,0,0,0.02);
        }

        .btn-search {
            background-color: #2d3138;
            color: #ffffff;
            border: none;
            padding: 12px 28px;
            border-radius: 8px;
            font-weight: bold;
            font-size: 14px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-search:hover {
            background-color: #1a1c20;
        }

        /* Estilos de la tabla GridView */
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
            padding: 14px 16px;
            font-weight: bold;
            font-size: 14px;
            text-align: left;
            border: none;
        }

        .custom-table td {
            padding: 14px 16px;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
            text-align: left;
            font-size: 14px;
            color: #333333;
        }

        .custom-table tr:last-child td {
            border-bottom: none;
        }

        /* Fotos de perfil */
        .img-avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            object-fit: cover;
            display: block;
        }

        /* Badges de Roles */
        .badge-role {
            background-color: #6c757d;
            color: #ffffff;
            padding: 5px 12px;
            border-radius: 12px;
            font-size: 11px;
            font-weight: bold;
            display: inline-block;
            letter-spacing: 0.5px;
        }

        .badge-admin {
            background-color: #2d3138;
        }

        /* Controles dentro de las celdas de acción */
        .select-rol {
            padding: 6px 10px;
            border: 1px solid #dcdcdc;
            border-radius: 8px;
            font-size: 13px;
            outline: none;
            margin-right: 6px;
            background-color: #ffffff;
        }

        .btn-guardar {
            background-color: #f26522;
            color: #ffffff;
            border: none;
            padding: 7px 16px;
            border-radius: 16px;
            font-weight: bold;
            font-size: 12px;
            cursor: pointer;
            margin-right: 4px;
            transition: background-color 0.2s;
        }

        .btn-guardar:hover {
            background-color: #e05411;
        }

        .btn-eliminar {
            background-color: #dc3545;
            color: #ffffff;
            border: none;
            padding: 7px 16px;
            border-radius: 16px;
            font-weight: bold;
            font-size: 12px;
            cursor: pointer;
            transition: background-color 0.2s;
        }

        .btn-eliminar:hover {
            background-color: #bd2130;
        }

        /* Enlace inferior */
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
        
        <!-- Header Superior -->
        <uc:Header ID="HeaderControl" runat="server" />

        <!-- Sección Central -->
        <div class="main-content">
            <div class="container">
                
                <!-- Encabezado con Icono -->
                <div class="header-title">
                    <asp:Image ID="Image1" runat="server" Height="32px" ImageUrl="~/icon1.PNG" Width="32px" />
                    <span>Gestión de Usuarios</span>
                </div>

                <!-- Buscador -->
                <div class="search-box">
                    <asp:TextBox ID="txtBuscar" runat="server" CssClass="input-search" Placeholder="Buscar por nombre, usuario o DNI..."></asp:TextBox>
                    <asp:Button ID="btnBuscar" runat="server" Text="Buscar" CssClass="btn-search" OnClick="btnBuscar_Click" />
                </div>

                <!-- Tabla GridView -->
                <asp:GridView ID="gvUsuarios" runat="server" AutoGenerateColumns="False" CssClass="custom-table" GridLines="None" Width="100%">
                    <Columns>
                        <asp:TemplateField HeaderText="Foto">
                            <ItemTemplate>
                                <asp:Image ID="imgAvatar" runat="server" CssClass="img-avatar" 
                                    ImageUrl='<%# string.IsNullOrEmpty(Eval("FotoUrl") as string) ? "~/icon1.PNG" : Eval("FotoUrl") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario" />
                        <asp:BoundField DataField="DNI" HeaderText="DNI" />

                        <asp:TemplateField HeaderText="Rol">
                            <ItemTemplate>
                                <span class='<%# Eval("Rol").ToString() == "ADMIN" ? "badge-role badge-admin" : "badge-role" %>'>
                                    <%# Eval("Rol") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:BoundField DataField="FechaRegistro" HeaderText="Registrado" />

                        <asp:TemplateField HeaderText="Acciones">
                            <ItemTemplate>
                                <%# Eval("EsActual").ToString() == "True" ? "<span style='color:#888888;'>(Tú)</span>" : "" %>
                                <asp:Panel ID="pnlAcciones" runat="server" Visible='<%# Eval("EsActual").ToString() != "True" %>' style="display:inline-block;">
                                    <asp:DropDownList ID="ddlRol" runat="server" CssClass="select-rol">
                                        <asp:ListItem Text="usuario" Value="usuario" />
                                        <asp:ListItem Text="admin" Value="admin" />
                                    </asp:DropDownList>
                                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn-guardar" CommandName="Guardar" CommandArgument='<%# Eval("DNI") %>' />
                                    <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" CssClass="btn-eliminar" CommandName="Eliminar" CommandArgument='<%# Eval("DNI") %>' />
                                </asp:Panel>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>

                <!-- Botón de retorno -->
                <asp:Button ID="btnVolver" runat="server" Text="← Volver al panel" CssClass="link-back" OnClick="btnVolver_Click" />

            </div>
        </div>

        <!-- Footer Abajo del Todo -->
        <uc:Footer ID="FooterControl" runat="server" />

    </form>
</body>
</html>