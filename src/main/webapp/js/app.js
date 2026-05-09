// ====== ParkZone - Utilidades Globales ======

/**
 * Normaliza la placa: quita espacios, símbolos y la pone en Mayúsculas.
 * Útil para validar antes de enviar al Servlet.
 */
function normalizePlate(value) {
  return (value || "")
    .toUpperCase()
    .replace(/\s+/g, "")
    .replace(/[^A-Z0-9]/g, "");
}

/**
 * Cambia el estilo de los Badges (etiquetas) de estado.
 */
function setBadge(el, kind, text) {
  if (!el) return;
  el.className = "badge";
  if (kind === "ok") el.classList.add("badge--ok");
  if (kind === "warn") el.classList.add("badge--warn");
  if (kind === "bad") el.classList.add("badge--bad");
  el.textContent = text;
}

// ====== Inicialización ======
document.addEventListener("DOMContentLoaded", () => {
  console.log("ParkZone Web: Utilidades cargadas correctamente.");
  
  // ====== ParkZone - Utilidades ======

function normalizePlate(value) {
  return (value || "")
    .toUpperCase()
    .trim()
    .replace(/[^A-Z0-9]/g, "");
}

function setBadge(el, kind, text) {
  if (!el) return;
  
  // Añadir una pequeña animación de "fade"
  el.style.opacity = "0";
  
  setTimeout(() => {
    el.className = "badge";
    if (kind === "ok") el.classList.add("badge--ok");
    if (kind === "warn") el.classList.add("badge--warn");
    if (kind === "bad") el.classList.add("badge--bad");
    
    el.textContent = text;
    el.style.opacity = "1";
    el.style.transition = "opacity 0.3s ease";
  }, 150);
}

// Interacción global: Sombras al hacer focus en inputs
document.addEventListener("DOMContentLoaded", () => {
  const inputs = document.querySelectorAll('input, select');
  inputs.forEach(input => {
    input.addEventListener('focus', () => {
      input.style.borderColor = 'var(--primary)';
      input.style.ring = '2px var(--primary)';
    });
    input.addEventListener('blur', () => {
      input.style.borderColor = '#e2e8f0';
    });
  });
});
});