document.addEventListener("DOMContentLoaded", () => {
    const regForm = document.getElementById("regForm");
    const regPlate = document.getElementById("txtPlaca");
    const regType = document.getElementById("txtTipo");
    const regOwner = document.getElementById("txtIdPersona"); // Cédula
    const regName = document.getElementById("txtNombrePersona"); // NUEVO
    const regPhone = document.getElementById("txtTelefonoPersona"); // NUEVO
    const regMsg = document.getElementById("regMsg");

    regForm.addEventListener("submit", (e) => {
        e.preventDefault();

        // 1. Validación de Placa
        if (regPlate.value.trim().length < 5) {
            mostrarMensaje("La placa parece muy corta.", "badge--bad");
            return;
        }

        // 2. Validación de Cédula (Evitar que sea demasiado corta)
        if (regOwner.value.trim().length < 4) {
            mostrarMensaje("El ID de propietario/Cédula no es válido.", "badge--bad");
            return;
        }

        // 3. Validación de Nombre
        if (regName.value.trim().length < 3) {
            mostrarMensaje("Por favor, ingresa el nombre completo del propietario.", "badge--bad");
            return;
        }

        // Si todo está OK, iniciamos el envío
        mostrarMensaje("Registrando propietario y vehículo en MySQL...", "badge--ok");

        // Pequeña pausa para que el usuario vea el mensaje de "Sincronizando"
        setTimeout(() => {
            regForm.submit();
        }, 800);
    });

    // Función auxiliar para no repetir código de mensajes
    function mostrarMensaje(texto, clase) {
        regMsg.style.display = "block";
        regMsg.textContent = texto;
        regMsg.className = "callout " + clase;
    }
});