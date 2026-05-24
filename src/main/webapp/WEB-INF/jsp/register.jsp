<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ParkZone · Registro</title>
        <script src="https://unpkg.com/lucide@latest"></script>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>
    <body>

        <%-- CABECERA PRINCIPAL --%>
        <header class="topbar">
            <div class="topbar__inner">
                <a class="brand" href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo ParkZone">
                    <div class="name">
                        <strong>PARKZONE</strong>
                    </div>
                </a>

                <nav class="nav">
                    <a href="${pageContext.request.contextPath}/">Inicio</a>
                    <a href="${pageContext.request.contextPath}/scanner">Scanner</a>
                    <a href="${pageContext.request.contextPath}/registro" class="active">Registro</a>
                    <a href="${pageContext.request.contextPath}/historial">Historial</a>
                </nav>
            </div>
        </header>

        <%-- CONTENEDOR PRINCIPAL --%>
        <main class="wrapper">

            <%-- BLOQUE DE MENSAJES DE RESPUESTA --%>
            <c:if test="${not empty mensajeExito}">
                <div class="callout badge--ok" style="padding: 20px; text-align: center; margin-bottom: 25px; border: 1px solid var(--ok); background: var(--brandSoft); border-radius: var(--radius);">
                    <h2 style="margin:0; color: var(--ok); font-weight: 700;">¡Registro Exitoso!</h2>
                    <p style="margin: 5px 0 0; color: var(--text);">${mensajeExito}</p>
                </div>
            </c:if>

            <c:if test="${not empty mensajeError}">
                <div class="callout badge--bad" style="padding: 20px; text-align: center; margin-bottom: 25px; border: 1px solid var(--bad); background: #fff5f5; border-radius: var(--radius);">
                    <h2 style="margin:0; color: var(--bad); font-weight: 700;">Error de Registro</h2>
                    <p style="margin: 5px 0 0; color: var(--text);">${mensajeError}</p>
                </div>
            </c:if>

            <section class="panel">
                <div class="panel__header">
                    <div>
                        <h2>Registrar Nuevo Vehículo</h2>
                        <p style="font-size: 0.9em; color: var(--muted); margin: 4px 0 0 0;">Ingresa los datos del dueño y del vehículo</p>
                    </div>
                </div>

                <div class="panel__body">
                    <form action="${pageContext.request.contextPath}/guardarVehiculo" method="POST" id="regForm">

                        <%-- 1. SECCIÓN PROPIETARIO --%>
                        <h3 style="margin-bottom: 15px; color: var(--text); font-weight: 700;">1. Datos del Propietario</h3>
                        <div class="row-triple" style="margin-bottom: 25px;">
                            <div class="field">
                                <label for="documento">Cédula / ID</label>
                                <input name="documento" id="documento" type="number" placeholder="Ej: 100685..." required />
                            </div>
                            <div class="field">
                                <label for="nombre">Nombre Completo</label>
                                <input name="nombre" id="nombre" type="text" placeholder="Ej: Daniel Cuartas" required />
                            </div>
                            <div class="field">
                                <label for="telefono">Teléfono</label>
                                <input name="telefono" id="telefono" type="text" placeholder="Ej: 315..." required />
                            </div>
                        </div>

                        <div class="hr" style="margin: 24px 0; border-top: 1px solid var(--border);"></div>

                        <%-- 2. SECCIÓN VEHÍCULO --%>
                        <h3 style="margin-bottom: 15px; color: var(--text); font-weight: 700;">2. Datos del Vehículo</h3>
                        <%-- Usamos row-triple aquí también para que herede tus estilos perfectos de 3 columnas --%>
                        <div class="row-triple" style="margin-bottom: 25px;">
                            <div class="field">
                                <label for="placa">Placa</label>
                                <input name="placa" id="placa" type="text" placeholder="Ej: ABC230" required maxlength="8" style="text-transform: uppercase; font-weight: 700; letter-spacing: 1px;" />
                            </div>

                            <div class="field">
                                <label for="tipo">Tipo de vehículo</label>
                                <select name="tipo" id="tipo" required>
                                    <option value="">Seleccione...</option>
                                    <option value="Carro">Carro</option>
                                    <option value="Moto">Moto</option>
                                    <option value="Camioneta">Camioneta</option>
                                </select>
                            </div>

                            <%-- Dejamos la tercera columna vacía para mantener la simetría perfecta del row-triple --%>
                            <div class="field"></div>
                        </div>

                        <%-- BOTÓN DE ENVÍO --%>
                        <div class="actions" style="margin-top: 30px;">
                            <button type="submit" class="btn btn--primary" style="width: 100%; padding: 16px; border-radius: 8px; font-size: 1rem; box-shadow: var(--shadow-sm);">
                                <i data-lucide="save" style="width: 18px; height: 18px;"></i> Finalizar Registro Completo
                            </button>
                        </div>
                    </form>
                </div>
            </section>
        </main>

        <footer class="footer">ParkZone · Gestión de Parqueadero</footer>

        <script src="${pageContext.request.contextPath}/js/app.js"></script>
        <script>
            lucide.createIcons();

            // Transformación inmediata a mayúsculas
            document.getElementById('placa').addEventListener('input', function (e) {
                e.target.value = e.target.value.toUpperCase();
            });
        </script>
    </body>
</html>