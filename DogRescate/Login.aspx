<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="perros.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="estilos/login.css"  rel="stylesheet" type="text/css"/> 
</head>
    
<body>
    <form id="form1" runat="server">
        <div>
            <header class="navbar">
            <a href="Inicio.aspx" class="marca">
                <span class="marca-logo">🐾</span>

                <span class="marca-texto">
                    <strong>Dog Rescate</strong>
                    <small>ALBERGUE · ADOPCIÓN</small>
                </span>
            </a>

            <nav class="menu" aria-label="Navegación principal">
                <a href="Inicio.aspx">Inicio</a>
                <a href="Mascotas.aspx">Perros</a>
                <a href="Nosotros.aspx">Nosotros</a>
                <a href="Contacto.aspx">Contacto</a>
            </nav>

            <a href="Login.aspx"
               class="boton-login"
               aria-current="page">
                LOGIN
            </a>
        </header>

        <main class="pagina-login">

           
            <div class="zona-imagen">
                <asp:Image
                    ID="imgIlustracion"
                    runat="server"
                    ImageUrl="img/bg.svg"
                    AlternateText="Equipo de cuidado y adopción de mascotas"
                    CssClass="ilustracion-login" />
            </div>

            
            <section class="zona-formulario"
                     aria-labelledby="tituloLogin">

                <div class="formulario-login">
                    <asp:Image
                        ID="imgAvatar"
                        runat="server"
                        ImageUrl="img/avatarnaranja.svg"
                        AlternateText=""
                        CssClass="avatar-login" />

                    <h1 id="tituloLogin">BIENVENIDO</h1>

                    <div class="campo-login">
                       
                        <svg class="icono-campo"
                             viewBox="0 0 24 24"
                             aria-hidden="true">
                            <path d="M12 12a5 5 0 1 0 0-10
                                     5 5 0 0 0 0 10z
                                     M3 22v-3a7 7 0 0 1 7-7h4
                                     a7 7 0 0 1 7 7v3z" />
                        </svg>

                        <asp:TextBox
                            ID="txtUsuario"
                            runat="server"
                            CssClass="entrada-login"
                            placeholder="Usuario"
                            autocomplete="username"
                            aria-label="Usuario" />
                    </div>

                    <div class="campo-login">
                       
                        <svg class="icono-campo"
                             viewBox="0 0 24 24"
                             aria-hidden="true">
                            <path d="M6 10V7a6 6 0 0 1 12 0v3h1
                                     a2 2 0 0 1 2 2v8
                                     a2 2 0 0 1-2 2H5
                                     a2 2 0 0 1-2-2v-8
                                     a2 2 0 0 1 2-2h1z
                                     M9 10h6V7a3 3 0 0 0-6 0v3z" />
                        </svg>

                        <asp:TextBox
                            ID="txtContrasena"
                            runat="server"
                            TextMode="Password"
                            CssClass="entrada-login"
                            placeholder="Contraseña"
                            autocomplete="current-password"
                            aria-label="Contraseña" />
                    </div>

                    <asp:HyperLink
                        ID="lnkRegistro"
                        runat="server"
                        NavigateUrl="~/Registro.aspx"
                        CssClass="enlace-registro">
                        Registrarse
                    </asp:HyperLink>

                    
                    <button id="btnIniciarSesion" runat="server" class="btn-iniciar" onserverclick="btnIniciarSesion_Click">
                        INICIAR SESIÓN
                    </button>
                </div>
            </section>
        </main>
        </div>
    </form>
</body>
</html>
