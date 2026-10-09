<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="DogRescate.modelo.Header" %>

<nav class="navbar" role="navigation" aria-label="Menú principal">

    <a href="Inicio.aspx" class="navbar__logo">
        <div class="navbar__logo-icon" style="color:#fff;"><span>&#128062;</span></div>

        <div>
            <span class="navbar__logo-name">Dog Rescate</span>
            <span class="navbar__logo-sub">Albergue &middot; Adopci&oacute;n</span>
        </div>
    </a>

    <ul class="navbar__links">
        <li><a href="Inicio.aspx">Inicio</a></li>
        <li><a href="Mascotas.aspx">Perros</a></li>
        <li><a href="Nosotros.aspx">Nosotros</a></li>
        <li><a href="contacto.aspx">Contacto</a></li>
    </ul>

    <div class="navbar__actions">

        <!-- SIN SESIÓN -->
        <asp:PlaceHolder ID="phInvitado" runat="server">
            <a href="login.aspx" class="btn btn--primary">Login</a>
        </asp:PlaceHolder>

        <!-- CON SESIÓN (admin o usuario) -->
        <asp:PlaceHolder ID="phAdmin" runat="server" Visible="false">
            <a href="<%= UrlPerfil %>" style="color: #f26522; font-weight: bold; text-decoration: none; margin-right: 8px;">Mi Perfil</a>
            <span style="color: #ffffff;">| <%= NombreUsuario %></span>
            <asp:LinkButton ID="btnSalir" runat="server" OnClick="btnSalir_Click" Style="color: #ff4d4d; margin-left: 10px; text-decoration: none;">(Salir)</asp:LinkButton>
        </asp:PlaceHolder>

    </div>

</nav>