<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Inicio.aspx.cs" Inherits="DogRescate.Inicio" %>

<%@ Register Src="~/modelo/Header.ascx" TagName="Header" TagPrefix="uc" %>
<%@ Register Src="~/modelo/Footer.ascx" TagName="Footer" TagPrefix="uc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <title>Dog Rescate</title>

    <link href="estilos/styles.css" rel="stylesheet" type="text/css" />
    <script src="js/adopciones.js"></script>

    

</head>

<body>

    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <uc:Header ID="Header1" runat="server" />

        <section id="inicio">

            <div class="hero">

                <div class="hero__content">

                    <span class="hero__badge">Albergue · Desde 2014</span>

                    <h1 class="hero__title">
                        Cada huella<br />merece un <em>hogar.</em>
                    </h1>

                    <p class="hero__desc">
                        En Dog Rescate creemos que adoptar no es solo salvar una vida,
                        es transformar la tuya. Conoce a los perros que esperan
                        formar parte de tu familia.
                    </p>

                    <div class="hero__actions">

                        <a href="perros.aspx" class="btn btn--primary btn--lg">
                            Quiero adoptar

                            <svg width="16" height="16"
                                 viewBox="0 0 16 16"
                                 fill="none"
                                 stroke="currentColor"
                                 stroke-width="2">

                                <path d="M3 8h10M9 4l4 4-4 4" />

                            </svg>

                        </a>

                        <a href="contacto.aspx"
                           class="btn btn--outline btn--lg">
                            Visítanos
                        </a>

                    </div>


                    <div class="hero__stats">

                        <div class="hero__stat">
                            <strong>320+</strong>
                            <small>Adopciones</small>
                        </div>

                        <div class="hero__stat">
                            <strong>11</strong>
                            <small>Años rescatando</small>
                        </div>

                        <div class="hero__stat">
                            <strong>48</strong>
                            <small>En el albergue</small>
                        </div>

                    </div>

                </div>


                <div class="hero__image">

                    <asp:AdRotator
                        ID="AdRotator1"
                        runat="server"
                        AdvertisementFile="~/datos/Anuncios.xml"
                        CssClass="hero__adrotator" />

                </div>


            </div>

            <!-- INFORMACIÓN -->

            <div class="info-banner" role="list">

                <div class="info-banner__item" role="listitem">

                    <div class="info-banner__icon">💉</div>

                    <div class="info-banner__text">

                        <strong>Vacunados y esterilizados</strong>

                        <span>
                            Todos listos para su nuevo hogar
                        </span>

                    </div>

                </div>


                <div class="info-banner__item" role="listitem">

                    <div class="info-banner__icon">🏥</div>

                    <div class="info-banner__text">

                        <strong>Atención veterinaria 24/7</strong>

                        <span>
                            Equipo médico siempre disponible
                        </span>

                    </div>

                </div>


                <div class="info-banner__item" role="listitem">

                    <div class="info-banner__icon">📋</div>

                    <div class="info-banner__text">

                        <strong>Adopción responsable</strong>

                        <span>
                            Proceso guiado paso a paso
                        </span>

                    </div>

                </div>


                <div class="info-banner__item" role="listitem">

                    <div class="info-banner__icon">🔄</div>

                    <div class="info-banner__text">

                        <strong>Seguimiento post-adopción</strong>

                        <span>
                            Acompañamiento durante 4 meses
                        </span>

                    </div>

                </div>

            </div>


            <!-- POR QUÉ ADOPTAR -->

            <section class="section section--light">

                <div class="section__label">
                    ¿Por qué adoptar?
                </div>

                <h2 class="section__title">
                    Adoptar es un acto de amor<br />
                    con impacto real.
                </h2>


                <div class="why-grid">

                    <div class="why-card">

                        <div class="why-card__icon">🐕</div>

                        <h3>Salvas dos vidas</h3>

                        <p>
                            La del perro que adoptas y la del que podrá ocupar
                            su lugar. Cada adopción libera espacio para nuevos rescates.
                        </p>

                    </div>


                    <div class="why-card">

                        <div class="why-card__icon">✅</div>

                        <h3>Llegan listos</h3>

                        <p>
                            Todos nuestros perros están esterilizados, vacunados,
                            desparasitados y con chequeo veterinario completo.
                        </p>

                    </div>


                    <div class="why-card">

                        <div class="why-card__icon">❤️</div>

                        <h3>Compañía sin igual</h3>

                        <p>
                            Los perros rescatados saben lo que es la lealtad.
                            Te devolverán cada día en forma de amor puro.
                        </p>

                    </div>

                </div>

            </section>


            <!-- ALBERGUE -->

            <div class="shelter-grid">

                <div class="shelter-grid__content">

                    <div class="section__label">
                        Nuestro albergue
                    </div>

                    <h2 class="section__title">
                        Un refugio que se<br />
                        siente como casa.
                    </h2>

                    <p>
                        Somos un albergue ubicado en Lima, Perú,
                        dedicado al cuidado, rescate y rehabilitación
                        de perros en situación de abandono desde 2014.
                    </p>

                </div>


                <div class="shelter-grid__image">

                    <img src="img/voluntaria.jpeg"
                         alt="Voluntaria"
                         loading="lazy" />

                </div>

            </div>


            <!-- PROCESO DE ADOPCIÓN -->
            <section class="section section--light adoption-process" style="text-align:center">
                <div class="section__label">Proceso de adopción</div>
                <h2 class="section__title">Simple, responsable y seguro.</h2>
                <ajaxToolkit:Accordion ID="AccordionAdopcion" runat="server" CssClass="accordion-adopcion"
                    HeaderCssClass="accordion-adopcion__header" HeaderSelectedCssClass="accordion-adopcion__header--selected"
                    ContentCssClass="accordion-adopcion__content" FadeTransitions="true" TransitionDuration="250"
                    AutoSize="None" RequireOpenedPane="true">
                    <Panes>
                        <ajaxToolkit:AccordionPane ID="PaneElegir" runat="server"><Header>🐶 1. Elige tu compañero</Header><Content>Completa la ficha de adopción con tus datos reales desde la sección Perros. Conoce a cada uno y elige al compañero que mejor se adapte a tu familia.</Content></ajaxToolkit:AccordionPane>
                        <ajaxToolkit:AccordionPane ID="PaneEntrevista" runat="server"><Header>📋 2. Entrevista</Header><Content>Nuestro equipo te contactará en 48 horas para una breve entrevista y resolverá tus dudas sobre el proceso.</Content></ajaxToolkit:AccordionPane>
                        <ajaxToolkit:AccordionPane ID="PaneVisita" runat="server"><Header>🏠 3. Visita al albergue</Header><Content>Ven a conocer en persona a tu futuro compañero y comprueba que existe una conexión antes de continuar.</Content></ajaxToolkit:AccordionPane>
                        <ajaxToolkit:AccordionPane ID="PaneCasa" runat="server"><Header>❤️ 4. ¡A casa!</Header><Content>Firmamos el contrato de adopción responsable y comienza una nueva historia llena de cariño y compromiso.</Content></ajaxToolkit:AccordionPane>
                    </Panes>
                </ajaxToolkit:Accordion>
            </section>

        </section>


        <!-- CTA FINAL -->

        <section class="cta-banner">

            <h2>
                ¿Listo para cambiar una vida hoy?
            </h2>

            <p>
                Da el primer paso. Tu esfuerzo y nuestro apoyo están esperando.
            </p>

            <a href="perros.aspx"
               class="btn btn--primary btn--lg">

                Ver perros en adopción

            </a>

        </section>
        <uc:Footer ID="Footer1" runat="server" />

        <!-- MODAL DE INFORMACIÓN DE PERROS ADOPTADOS -->
        <div id="dogModal" class="dog-modal-overlay" aria-hidden="true">
            <div class="dog-modal" role="dialog" aria-modal="true" aria-labelledby="dogModalNombre">

                <button type="button" class="dog-modal__close" id="dogModalCerrar" aria-label="Cerrar">
                    &times;
                </button>

                <img id="dogModalImagen" class="dog-modal__imagen" src="img/perro-golden.jpg" alt="Perro adoptado" />

                <div class="dog-modal__body">
                    <div class="dog-modal__label">Historia de adopción</div>
                    <h2 id="dogModalNombre"></h2>

                    <div class="dog-modal__datos">
                        <p><strong>Fecha de adopción:</strong> <span id="dogModalFecha"></span></p>
                        <p><strong>Sexo:</strong> <span id="dogModalSexo"></span></p>
                    </div>

                    <p id="dogModalComentario" class="dog-modal__comentario"></p>
                </div>
            </div>
        </div>

    </form>

</body>

</html>
