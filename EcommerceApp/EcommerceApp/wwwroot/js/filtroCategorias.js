document.addEventListener("DOMContentLoaded", function () {
    const categoriaSelect = document.getElementById("categoriaSelect");
    const productos = document.querySelectorAll(".producto-item");

    categoriaSelect.addEventListener("change", function () {
        const categoriaSeleccionada = this.value;

        productos.forEach(function (producto) {
            const categoria = producto.getAttribute("data-categoria");

            if (categoriaSeleccionada === "Todas" || categoria === categoriaSeleccionada) {
                producto.style.display = "block";
            } else {
                producto.style.display = "none";
            }
        });
    });
});
