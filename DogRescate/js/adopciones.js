document.addEventListener("DOMContentLoaded", function () {

    const contenedor = document.querySelector(".hero__image");
    const modal = document.getElementById("dogModal");
    const cerrar = document.getElementById("dogModalCerrar");

    if (!contenedor || !modal) return;

    const perros = {
        "perro golden.jpg": {
            nombre: "Max",
            fecha: "15 de marzo de 2025",
            sexo: "Macho",
            comentario: "Max encontró una familia que le dio una segunda oportunidad. Adoptar también puede cambiar tu vida y la de un perro que espera un hogar.",
            alt: "Max, perro Golden adoptado"
        },
        "perro peruano.png": {
            nombre: "Luna",
            fecha: "28 de abril de 2025",
            sexo: "Hembra",
            comentario: "Luna comenzó una nueva historia junto a una familia que decidió abrirle las puertas de su hogar. Tú también puedes ser parte de una historia de adopción.",
            alt: "Luna, perra peruana adoptada"
        },
        "perro policia.jpg": {
            nombre: "Rocky",
            fecha: "10 de mayo de 2025",
            sexo: "Macho",
            comentario: "Rocky encontró una familia responsable que le dio una nueva oportunidad. Cada adopción demuestra que siempre puede comenzar una nueva historia.",
            alt: "Rocky, perro adoptado"
        },
        "perroperu.png": {
            nombre: "Mía",
            fecha: "22 de junio de 2025",
            sexo: "Hembra",
            comentario: "Mía dejó el albergue para comenzar una nueva vida llena de cariño. Adoptar es darle a un perro la oportunidad de conocer el amor de una familia.",
            alt: "Mía, perra adoptada"
        },
        "perro gold.jpeg": {
            nombre: "Bruno",
            fecha: "5 de julio de 2025",
            sexo: "Macho",
            comentario: "Bruno encontró un hogar donde recibe todo el amor que merece. Muchos perros todavía esperan una oportunidad; tú puedes cambiar una vida.",
            alt: "Bruno, perro Golden adoptado"
        }
    };

    contenedor.addEventListener("click", function (e) {
        const imagen = e.target.closest("img");
        if (!imagen) return;

        e.preventDefault();

        const partes = imagen.src.split("/");
        const archivo = decodeURIComponent(partes[partes.length - 1]).toLowerCase();
        const perro = perros[archivo];

        if (!perro) return;

        document.getElementById("dogModalImagen").src = imagen.src;
        document.getElementById("dogModalImagen").alt = perro.alt;
        document.getElementById("dogModalNombre").textContent = perro.nombre;
        document.getElementById("dogModalFecha").textContent = perro.fecha;
        document.getElementById("dogModalSexo").textContent = perro.sexo;
        document.getElementById("dogModalComentario").textContent = perro.comentario;

        modal.classList.add("open");
        modal.setAttribute("aria-hidden", "false");
        document.body.style.overflow = "hidden";
    });

    function cerrarModal() {
        modal.classList.remove("open");
        modal.setAttribute("aria-hidden", "true");
        document.body.style.overflow = "";
    }

    cerrar.addEventListener("click", cerrarModal);

    modal.addEventListener("click", function (e) {
        if (e.target === modal) {
            cerrarModal();
        }
    });

    document.addEventListener("keydown", function (e) {
        if (e.key === "Escape" && modal.classList.contains("open")) {
            cerrarModal();
        }
    });
});
