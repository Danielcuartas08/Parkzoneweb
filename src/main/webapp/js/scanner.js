document.addEventListener("DOMContentLoaded", () => {
  const plateInput = document.getElementById("plateInput");
  const btnValidate = document.getElementById("btnValidate");
  const btnFillDemo = document.getElementById("btnFillDemo");

  const statusBadge = document.getElementById("statusBadge");
  const resultBox = document.getElementById("resultBox");
  const actionBox = document.getElementById("actionBox");

  const btnEntry = document.getElementById("btnEntry");
  const btnExit = document.getElementById("btnExit");
  const btnGoRegister = document.getElementById("btnGoRegister");

  function showResult(html, kind, badgeText) {
    resultBox.style.display = "block";
    actionBox.style.display = "flex";
    resultBox.innerHTML = html;
    setBadge(statusBadge, kind, badgeText);
  }

  function hideActions() {
    actionBox.style.display = "none";
  }

  function validate() {
    const plate = normalizePlate(plateInput.value);

    if (!plate) {
      setBadge(statusBadge, "warn", "Escribe una placa");
      resultBox.style.display = "none";
      hideActions();
      return;
    }

    const record = findPlate(plate);

    // default: hide all action buttons then show what applies
    btnEntry.style.display = "none";
    btnExit.style.display = "none";
    btnGoRegister.style.display = "none";

    if (!record) {
      showResult(
        `<strong>Placa no encontrada:</strong> <span>${plate}</span><br>
         Puedes iniciar el registro para autorizar este vehículo.`,
        "warn",
        "No encontrada"
      );
      btnGoRegister.style.display = "inline-flex";
      // prefill plate to register page
      btnGoRegister.href = `register.html?plate=${encodeURIComponent(plate)}`;
      return;
    }

    if (record.status === "BLOCKED") {
      showResult(
        `<strong>Acceso denegado:</strong> <span>${plate}</span><br>
         Estado: <strong>Bloqueado</strong>.`,
        "bad",
        "Denegado"
      );
      return;
    }

    // ACTIVE
    showResult(
      `<strong>Placa autorizada:</strong> <span>${plate}</span><br>
       Propietario: ${record.owner}<br>
       Vehículo: ${record.type}`,
      "ok",
      "Autorizado"
    );

    btnEntry.style.display = "inline-flex";
    btnExit.style.display = "inline-flex";

    // attach actions
    btnEntry.onclick = () => registerMovement(plate, "INGRESO", "PERMITIDO");
    btnExit.onclick = () => registerMovement(plate, "SALIDA", "PERMITIDO");
  }

  function registerMovement(plate, type, result) {
    const now = new Date();
    const date = now.toLocaleDateString("es-CO");
    const time = now.toLocaleTimeString("es-CO", { hour: "2-digit", minute: "2-digit" });

    addMovement({ date, time, plate, type, result });
    alert(`${type} registrado para ${plate}`);
  }

  btnValidate.addEventListener("click", validate);
  plateInput.addEventListener("keydown", (e) => {
    if (e.key === "Enter") validate();
  });

  btnFillDemo.addEventListener("click", () => {
    const demo = ["ABC123", "XYZ987", "BAD666", "NEW111"];
    plateInput.value = demo[Math.floor(Math.random() * demo.length)];
    validate();
  });
});