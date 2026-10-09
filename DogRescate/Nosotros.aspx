<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Nosotros.aspx.cs" Inherits="DogRescate.Nosotros" MaintainScrollPositionOnPostBack="true" ResponseEncoding="utf-8" %>
<%@ Register TagPrefix="uc" TagName="Header" Src="~/modelo/Header.ascx" %>
<%@ Register TagPrefix="uc" TagName="Footer" Src="~/modelo/Footer.ascx" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Nosotros</title>
    <link rel="stylesheet" href="estilos/styles.css" />

    <style>
        /* ===== asp:Wizard de testimonios ===== */
        .testimonios-wizard-ctrl {
            max-width: 700px;
            margin: 0 auto;
        }
        /* El control Wizard renderiza una <table> por dentro; quitamos su
           borde/padding por defecto para que solo se vea la tarjeta .why-card */
        .testimonios-wizard-ctrl table {
            border: none !important;
            width: 100% !important;
        }
        .testimonio-step {
            padding: 0 !important;
            border: none !important;
        }
        /* Fila de navegación (Anterior / Siguiente) que genera el Wizard */
        .testimonios-wizard-ctrl .wizard-btn {
            background: #ff7a00;
            color: #fff;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            font-size: 18px;
            cursor: pointer;
            margin: 16px 6px 0;
        }
        .testimonios-wizard-ctrl .wizard-btn:hover {
            background: #e56b00;
        }

        /* ===== AdRotator como imagen principal del hero ===== */
        .hero__image img {
            border-radius: 20px;
            width: 100%;
            height: 900px;
            object-fit: cover;
        }

        /* ===== Accordion (ajaxToolkit) de valores ===== */
        .accordion-valores {
            display: block;
            width: 100%;
        }
        .accordion-valores .accordionHeader {
            display: block;
            background: #fff;
            border-radius: 12px;
            padding: 16px 20px;
            margin-top: 10px;
            cursor: pointer;
            font-weight: 600;
            font-size: 1rem;
            font-family: 'Poppins', 'Segoe UI', Arial, sans-serif;
            color: #1c1c1e;
            box-shadow: 0 2px 8px rgba(0,0,0,.05);
        }
        .accordion-valores .accordionHeader:after {
            content: '+';
            float: right;
            font-weight: 700;
            color: #fd6f21;
        }
        .accordion-valores .accordionHeaderSelected {
            background: #fd6f21;
            color: #fff;
            border-radius: 12px 12px 0 0;
        }
        .accordion-valores .accordionHeaderSelected:after {
            content: '−';
            color: #fff;
        }
        .accordion-valores .accordionContent {
            display: block;
            background: #fff;
            border-radius: 0 0 12px 12px;
            padding: 14px 20px 18px;
            color: #666;
            font-size: .9rem;
            font-family: 'Poppins', 'Segoe UI', Arial, sans-serif;
            line-height: 1.6;
            box-shadow: 0 2px 8px rgba(0,0,0,.05);
        }
        .accordion-valores .accordionContent p {
            margin: 0;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

    <uc:Header runat="server" ID="Header1" />

    <ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server" />

    <main>

    <section class="hero hero--nosotros">

    <div class="hero__content">

        <span class="hero__badge">CONÓCENOS</span>

        <h1 class="hero__title">
            Más que un albergue,<br>
            construimos <span>hogares</span><br>
            para toda la vida.
        </h1>

        <p class="hero__desc">
            En Dog Rescate trabajamos para brindar una segunda oportunidad a perros en situación de abandono.
            A través de nuestra plataforma digital facilitamos la adopción responsable,
            conectando mascotas rescatadas con familias comprometidas mediante un proceso seguro,
            transparente y organizado.
        </p>

    </div>

    <div class="hero__image">
        <asp:AdRotator
            ID="AdRotatorNosotros"
            runat="server"
            AdvertisementFile="~/datos/AnunciosNosotros.xml" />
    </div>

</section>

<section class="section section--light">

    <div class="sobre-grid">

        <div class="sobre-texto">

    <div class="section__label">
        CONOCE MÁS SOBRE NOSOTROS
    </div>

    <h2 class="section__title">
        Transformando vidas,<br>
        una adopción a la vez.
    </h2>

    <p class="section__desc">
        Dog Rescate conecta perros rescatados con familias responsables mediante un proceso seguro,
        transparente e innovador. Nuestro compromiso es brindar una segunda oportunidad a mascotas
        en situación de abandono, promoviendo el bienestar animal y la adopción responsable.
        Además, incorporamos tecnología de validación facial para ofrecer mayor seguridad y confianza
        durante todo el proceso de adopción.
    </p>

    <img
        src="img/nosotros-equipo.jpg"
        alt="Perros rescatados"
        class="sobre-imagen-principal" />
</div>
        <div class="sobre-info">

            <div class="why-card about-card">

    <img src="img/mision.jpg" alt="Misión" />

    <div class="about-card-content">
        <h3>🎯 Misión</h3>

         <p>
            Brindar una segunda oportunidad a perros en situación de abandono mediante su rescate,
            cuidado y adopción responsable. Trabajamos para conectar cada mascota con familias
            comprometidas, promoviendo el bienestar animal y una convivencia responsable.
        </p>
    </div>

</div>

<div class="why-card about-card">

    <img src="img/vision.jpg" alt="Visión" />

    <div class="about-card-content">
        <h3>👁️ Visión</h3>

         <p>
            Ser la plataforma líder en adopción responsable de mascotas en el Perú, reconocida por
            integrar tecnología innovadora y procesos seguros que faciliten la adopción y ayuden a
            reducir el abandono animal.
        </p>
    </div>

</div>

<div class="why-card about-card">

    <img src="img/impacto.jpg" alt="Impacto" />

    <div class="about-card-content">

        <h3>🐾 Nuestro Impacto</h3>

        <p>
            Cada adopción representa una nueva oportunidad para un perro y una experiencia
            transformadora para una familia. Gracias al apoyo de nuestra comunidad, seguimos
            generando cambios positivos en la vida de cientos de mascotas.
        </p>

        <div class="impacto-stats">

            <div class="impacto-item">
                <strong>100+</strong>
                <span>Rescates</span>
            </div>

            <div class="impacto-item">
                <strong>80+</strong>
                <span>Adopciones</span>
            </div>

            <div class="impacto-item">
                <strong>200+</strong>
                <span>Usuarios</span>
            </div>

        </div>

    </div>

</div>

        </div>

    </div>

</section>


<section class="section adoptantes">

    <span class="section__label">
        HISTORIAS REALES
    </span>

    <h2 class="section__title">
        Familias que cambiaron una vida para siempre
    </h2>

    <p class="section__intro">
        Cada adopción es una nueva oportunidad para un perro que esperaba una familia.
        Estas son algunas historias de personas que decidieron abrir su corazón y hoy no imaginan su vida sin su mejor amigo.
    </p>

    <asp:UpdatePanel ID="UpdatePanelTestimonios" runat="server">
    <ContentTemplate>
    <asp:Wizard
        ID="WizardTestimonios"
        runat="server"
        CssClass="testimonios-wizard-ctrl"
        DisplaySideBar="false"
        HeaderText=""
        DisplayCancelButton="false"
        NavigationButtonStyle-CssClass="wizard-btn"
        StartNextButtonText="&#10095;"
        StepPreviousButtonText="&#10094;"
        StepNextButtonText="&#10095;"
        FinishPreviousButtonText="&#10094;"
        FinishCompleteButtonText="&#10095;"
        StepStyle-CssClass="testimonio-step">

        <WizardSteps>

            <asp:WizardStep runat="server" Title="María y Toby">
                <div class="why-card">
                    <img src="img/adoptante1.jpg" alt="María y Toby" class="nosotros-img" />
                    <h3>María y Toby</h3>
                    <p>
                        Toby llegó a nuestra vida cuando buscábamos un compañero de aventuras.
                        Desde el primer día llenó cada rincón de nuestro hogar con energía, cariño y momentos inolvidables.
                        Hoy no imaginamos nuestras caminatas, viajes y tardes en familia sin él.
                        Adoptarlo fue una decisión que transformó nuestra vida para siempre.
                    </p>
                </div>
            </asp:WizardStep>

            <asp:WizardStep runat="server" Title="Familia Mendoza y Max">
                <div class="why-card">
                    <img src="img/adoptante2.jpg" alt="Familia Mendoza y Max" class="nosotros-img" />
                    <h3>Familia Mendoza y Max</h3>
                    <p>
                        Max pasó de vivir en las calles a convertirse en un miembro querido de nuestra familia.
                        Al principio necesitó tiempo para confiar, pero poco a poco descubrió que tenía un hogar donde siempre sería amado.
                        Su alegría, ternura y ganas de jugar nos recuerdan cada día el poder de una segunda oportunidad.
                    </p>
                </div>
            </asp:WizardStep>

            <asp:WizardStep runat="server" Title="Javier y Rocky">
                <div class="why-card">
                    <img src="img/adoptante3.jpg" alt="Javier y Rocky" class="nosotros-img" />
                    <h3>Javier y Rocky</h3>
                    <p>
                        Rocky llegó a nuestra vida cuando más lo necesitábamos.
                        Al principio era tímido y desconfiado, pero con paciencia y cariño se convirtió en el compañero más alegre de la familia.
                        Hoy cada paseo, cada juego y cada momento a su lado nos recuerda que adoptar fue una de las mejores decisiones que hemos tomado.
                    </p>
                </div>
            </asp:WizardStep>

            <asp:WizardStep runat="server" Title="Familia Gómez y Thor">
                <div class="why-card">
                    <img src="img/adoptante4.jpg" alt="Familia Gómez y Thor" class="nosotros-img" />
                    <h3>Familia Gómez y Thor</h3>
                    <p>
                        Thor encontró un hogar lleno de amor y nosotros encontramos un amigo incondicional.
                        Su nobleza y entusiasmo conquistaron a toda la familia desde el primer momento.
                        Cada día nos recibe con la misma felicidad y nos demuestra que adoptar cambia vidas, tanto para ellos como para nosotros.
                    </p>
                </div>
            </asp:WizardStep>

            <asp:WizardStep runat="server" Title="Andrea y Luna">
                <div class="why-card">
                    <img src="img/adoptante5.jpg" alt="Andrea y Luna" class="nosotros-img" />
                    <h3>Andrea y Luna</h3>
                    <p>
                        Luna llegó a nuestra familia en un momento muy especial y rápidamente se ganó el corazón de todos.
                        Con su dulzura y personalidad juguetona se convirtió en la compañera inseparable de nuestros hijos.
                        Hoy es parte de cada celebración, paseo y recuerdo importante que compartimos juntos.
                    </p>
                </div>
            </asp:WizardStep>

            <asp:WizardStep runat="server" Title="José y Bruno">
                <div class="why-card">
                    <img src="img/adoptante6.jpg" alt="José y Bruno" class="nosotros-img" />
                    <h3>José y Bruno</h3>
                    <p>
                        Bruno nos enseñó el verdadero significado de la lealtad y el amor incondicional.
                        Lo que comenzó como una oportunidad para darle un hogar terminó convirtiéndose en una experiencia que cambió nuestras vidas.
                        Su compañía constante y su cariño nos recuerdan cada día lo valioso que es adoptar.
                    </p>
                </div>
            </asp:WizardStep>

        </WizardSteps>

    </asp:Wizard>
    </ContentTemplate>
    </asp:UpdatePanel>

</section>


<section class="valores-proceso">

    <div class="columna-valores">

        <span class="section__label">
            Nuestros valores
        </span>

        <h2 class="section__title">
            Lo que nos inspira cada día
        </h2>

        <ajaxToolkit:Accordion
            ID="AccordionValores"
            runat="server"
            CssClass="accordion-valores"
            HeaderCssClass="accordionHeader"
            HeaderSelectedCssClass="accordionHeaderSelected"
            ContentCssClass="accordionContent"
            SelectedIndex="0"
            TransitionDuration="150"
            FramesPerSecond="30"
            RequireOpenedPane="false"
            AutoSize="None">
            <Panes>
                <ajaxToolkit:AccordionPane runat="server" ID="PaneCompromiso">
                    <Header>❤️ Compromiso</Header>
                    <Content>
                        <p>
                            Trabajamos para garantizar el bienestar
                            de cada mascota antes, durante y después
                            de la adopción.
                        </p>
                    </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane runat="server" ID="PaneResponsabilidad">
                    <Header>🤝 Responsabilidad</Header>
                    <Content>
                        <p>
                            Promovemos adopciones conscientes para
                            asegurar hogares seguros y permanentes.
                        </p>
                    </Content>
                </ajaxToolkit:AccordionPane>
                <ajaxToolkit:AccordionPane runat="server" ID="PaneInnovacion">
                    <Header>💡 Innovación</Header>
                    <Content>
                        <p>
                            Utilizamos tecnología inteligente para
                            mejorar la experiencia de adopción.
                        </p>
                    </Content>
                </ajaxToolkit:AccordionPane>
            </Panes>
        </ajaxToolkit:Accordion>

    </div>

    <div class="columna-proceso">

        <span class="section__label">
            ¿Qué nos hace diferentes?
        </span>

        <h2 class="section__title">
            Adopción inteligente y segura
        </h2>

        <div class="timeline">

    <div class="timeline-item">
        <div class="timeline-circle">1</div>
        <h4>Registro seguro</h4>
        <p>Los usuarios crean una cuenta validada.</p>
        <img src="img/registro.jpg" />
    </div>

    <div class="timeline-item">
        <div class="timeline-circle">2</div>
        <h4>Reconocimiento facial</h4>
        <p>Validamos identidad para mayor seguridad.</p>
        <img src="img/facial.jpg" />
    </div>

    <div class="timeline-item">
        <div class="timeline-circle">3</div>
        <h4>Solicitud inteligente</h4>
        <p>Analizamos compatibilidad con la mascota.</p>
        <img src="img/solicitud.jpg" />
    </div>

    <div class="timeline-item">
        <div class="timeline-circle">4</div>
        <h4>Seguimiento</h4>
        <p>Monitoreamos el bienestar tras la adopción.</p>
        <img src="img/seguimiento.jpg" />
    </div>

        </div>

    </div>

</section>


<section class="cta-banner">
    <h2>Juntos podemos cambiar una vida</h2>

    <p>
        Cada adopción representa una nueva oportunidad para una mascota
        y una experiencia inolvidable para una familia.
    </p>

    <a href="Perros.aspx" class="btn btn--primary btn--lg">
        Ver mascotas en adopción
    </a>
</section>
        

    </main>

    <uc:Footer runat="server" ID="Footer1" />

    </form>
</body>
</html>
