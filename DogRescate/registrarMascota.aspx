<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="registrarMascota.aspx.cs" Inherits="Proyecto.registrarMascota" %>
<%@ Register Src="~/modelo/Header.ascx" TagPrefix="uc" TagName="Header" %>
<%@ Register Src="~/modelo/Footer.ascx" TagPrefix="uc" TagName="Footer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Dog Rescate - Registrar Mascota</title>

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
            background-color: #f4f6f9;
            color: #333333;
        }

        #form1 {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            width: 100%;
        }

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
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            max-width: 900px;
        }

        .card-form {
            background-color: #ffffff;
            border-radius: 16px;
            padding: 35px 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
            width: 100%;
            box-sizing: border-box;
            margin-bottom: 30px;
        }

        .title-header {
            text-align: center;
            font-size: 26px;
            color: #ff6b2b;
            font-weight: bold;
            margin-bottom: 25px;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }

        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 15px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            flex: 1;
            position: relative;
        }

        .form-group label {
            font-size: 13px;
            font-weight: bold;
            color: #555555;
            margin-bottom: 6px;
        }

        .form-control {
            height: 44px !important;
            padding: 8px 14px !important;
            border: 1px solid #e0e0e0 !important;
            border-radius: 8px !important;
            font-size: 14px !important;
            line-height: 1.4 !important;
            outline: none !important;
            box-sizing: border-box !important;
            width: 100% !important;
            background-color: #ffffff !important;
            color: #333333 !important;
        }

        textarea.form-control {
            height: auto !important;
            min-height: 90px !important;
        }

        .form-control:focus {
            border-color: #ff6b2b !important;
            box-shadow: 0 0 0 2px rgba(255, 107, 43, 0.1) !important;
        }

        .btn-group {
            display: flex;
            gap: 10px;
            margin-top: 25px;
            margin-bottom: 20px;
        }

        .btn {
            height: 44px;
            padding: 0 20px;
            border: none;
            border-radius: 20px;
            font-weight: bold;
            color: #ffffff;
            cursor: pointer;
            font-size: 13px;
            flex: 1;
            text-align: center;
            transition: opacity 0.2s;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .btn-insertar { background-color: #28a745; }
        .btn-actualizar { background-color: #ff6b2b; }
        .btn-eliminar { background-color: #dc3545; }
        .btn-limpiar { background-color: #e2e8f0; color: #333333; }
        .btn-buscar { background-color: #333333; border-radius: 8px; flex: none; width: 120px; height: 44px; }

        /* GridView Tabla */
        .custom-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 0;
            background-color: #ffffff;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        .custom-grid th {
            background-color: #f26522;
            color: #ffffff;
            padding: 12px 14px;
            font-weight: bold;
            text-align: left;
            border: none;
            font-size: 14px;
        }

        .custom-grid td {
            padding: 12px 14px;
            border-bottom: 1px solid #f0f0f0;
            vertical-align: middle;
            font-size: 14px;
        }

        .img-thumb {
            width: 45px;
            height: 45px;
            border-radius: 8px;
            object-fit: cover;
            display: block;
        }

        .btn-volver {
            background: none;
            border: none;
            color: #777777;
            font-weight: bold;
            cursor: pointer;
            margin-top: 15px;
            font-size: 14px;
        }

        .btn-volver:hover {
            color: #333333;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        

        <uc:Header ID="HeaderControl" runat="server" />

   
        <div class="main-content">
            <div class="container">
                
                <div class="card-form">
                    <div class="title-header">
                        <asp:Image ID="Image1" runat="server" Height="30px" ImageUrl="~/icon3.png" Width="30px" />
                        <span>REGISTRAR MASCOTA</span>
                    </div>

                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True" ShowSummary="False" />

                    <div class="form-row">
                        <div class="form-group">
                            <label>ID (solo para Actualizar/Eliminar)</label>
                            <asp:TextBox ID="txtID" runat="server" CssClass="form-control"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtID" ErrorMessage="no dejar en blanco" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtID" Display="Dynamic" ErrorMessage="El ID debe ser mayor de 0" Operator="GreaterThan" Type="Integer" ValueToCompare="0">*</asp:CompareValidator>
                        </div>
                        <div class="form-group">
                            <label>Nombre del perro</label>
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Placeholder="Ej: Bobby"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNombre" ErrorMessage="no dejar en blanco" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <label>Raza</label>
                            <asp:TextBox ID="txtRaza" runat="server" CssClass="form-control" Placeholder="Ej: Beagle"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtRaza" ErrorMessage="no dejar en blanco" Display="Dynamic">*</asp:RequiredFieldValidator>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group">
                            <label>Edad (Años)</label>
                            <asp:TextBox ID="txtEdad" runat="server" CssClass="form-control" Placeholder="Ej: 2"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtEdad" ErrorMessage="no dejar en blanco" Display="Dynamic">*</asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="txtEdad" ErrorMessage="La edad debe estar de un rango de 0-20" MaximumValue="20" MinimumValue="0" Type="Integer" Display="Dynamic">*</asp:RangeValidator>
                        </div>
                        <div class="form-group">
                            <label>Tamaño</label>
                            <asp:DropDownList ID="ddlTamaño" runat="server" CssClass="form-control">
                                <asp:ListItem>Pequeño</asp:ListItem>
                                <asp:ListItem>Mediano</asp:ListItem>
                                <asp:ListItem>Grande</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>

                    <div class="form-group" style="margin-bottom: 15px;">
                        <label>Nivel de Energía</label>
                        <asp:DropDownList ID="ddlNivel" runat="server" CssClass="form-control">
                            <asp:ListItem>Bajo (Tranquilo/Senior)</asp:ListItem>
                            <asp:ListItem>Medio (Activo normal)</asp:ListItem>
                            <asp:ListItem>Alto (Requiere mucho ejercicio)</asp:ListItem>
                        </asp:DropDownList>
                    </div>

                    <div class="form-group" style="margin-bottom: 15px;">
                        <label>Descripción / Historia</label>
                        <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Cuenta un poco sobre su personalidad..."></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtDescripcion" ErrorMessage="no dejar en blanco" Display="Dynamic">*</asp:RequiredFieldValidator>
                    </div>

                    <div class="form-group" style="margin-bottom: 15px;">
                        <label>URL de la Foto</label>
                        <asp:TextBox ID="txtURL" runat="server" CssClass="form-control" Placeholder="https://... o img/perros/archivo.jpg"></asp:TextBox>
                    </div>

                    <div class="btn-group">
                        <asp:Button ID="btnInsertar" runat="server" CssClass="btn btn-insertar" Text="INSERTAR" OnClick="btnInsertar_Click" />
                        <asp:Button ID="btnActualizar" runat="server" CssClass="btn btn-actualizar" Text="ACTUALIZAR" OnClick="btnActualizar_Click" CausesValidation="False" />
                        <asp:Button ID="btnEliminar" runat="server" CssClass="btn btn-eliminar" Text="ELIMINAR" OnClick="btnEliminar_Click" CausesValidation="False" />
                        <asp:Button ID="btnLimpiar" runat="server" CssClass="btn btn-limpiar" Text="LIMPIAR" OnClick="btnLimpiar_Click" CausesValidation="False" />
                    </div>

                    <div class="form-row" style="margin-top: 15px;">
                        <asp:TextBox ID="txtBusqueda" runat="server" CssClass="form-control" Placeholder="Buscar por ID o nombre..."></asp:TextBox>
                        <asp:Button ID="btnBuscar" runat="server" CssClass="btn btn-buscar" Text="BUSCAR" OnClick="btnBuscar_Click" CausesValidation="False" />
                    </div>

                    <div style="text-align: center;">
                        <asp:Button ID="btnAnterior" runat="server" CssClass="btn-volver" Text="← Volver al panel" OnClick="btnAnterior_Click" CausesValidation="False" />
                    </div>
                </div>

    
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="custom-grid" GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="ID" HeaderText="ID" />
                        <asp:TemplateField HeaderText="Foto">
                            <ItemTemplate>
                                <asp:Image ID="imgMascota" runat="server" CssClass="img-thumb" 
                                    ImageUrl='<%# string.IsNullOrEmpty(Eval("FotoUrl") as string) ? "~/icon1.PNG" : Eval("FotoUrl") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                        <asp:BoundField DataField="Raza" HeaderText="Raza" />
                        <asp:BoundField DataField="Edad" HeaderText="Edad" />
                        <asp:BoundField DataField="Tamaño" HeaderText="Tamaño" />
                        <asp:BoundField DataField="Energia" HeaderText="Energía" />
                        <asp:BoundField DataField="Estado" HeaderText="Estado" />
                    </Columns>
                </asp:GridView>

            </div>
        </div>

        <uc:Footer ID="FooterControl" runat="server" />

    </form>
</body>
</html>