<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ParkZone · Scanner de Control</title>
        <%-- Inclusión de estilos globales mediante ruta absoluta de contexto --%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>
    <body>

        <%-- CABECERA PRINCIPAL: Sistema de navegación global con efecto Glassmorphism --%>
        <header class="topbar">
            <div class="topbar__inner">
                <%-- Corrección de enlace: Se reemplaza la ruta estática por la raíz dinámica del contexto --%>
                <a class="brand" href="${pageContext.request.contextPath}/">
                    <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo ParkZone">
                    <div class="name">
                        <strong>PARKZONE</strong>
                    </div>
                </a>

                <nav class="nav">
                    <a href="${pageContext.request.contextPath}/">Inicio</a>
                    <%-- Activación visual de la pestaña actual mediante la clase pill activa --%>
                    <a href="${pageContext.request.contextPath}/scanner" class="active">Scanner</a>
                    <a href="${pageContext.request.contextPath}/registro">Registro</a>
                    <a href="${pageContext.request.contextPath}/historial">Historial</a>
                </nav>
            </div>
        </header>

        <%-- CONTENEDOR PRINCIPAL --%>
        <main class="wrapper">
            <section class="panel">
                <div class="panel__header" style="flex-direction: column; align-items: flex-start; gap: 4px;">
                    <h2>Scanner de Placa</h2>
                    <p class="subtitle" style="color: var(--muted); margin: 0;">Busca el vehículo para registrar su ingreso o salida del parqueadero</p>
                </div>

                <div class="panel__body" style="margin-top: 1.5rem;">
                    <%-- Buscador con el estándar del sistema --%>
                    <div class="form-grid">
                        <div class="field" style="grid-column: 1 / -1;">
                            <label for="txtBusquedaPlaca">Número de Placa</label>
                            <div style="display: flex; gap: 12px;">
                                <input name="txtBusquedaPlaca" id="txtBusquedaPlaca" type="text" 
                                       placeholder="EJ: DBI2026" 
                                       style="text-transform: uppercase; font-size: 1.5rem; font-weight: bold; flex: 1;" />
                                <%-- Uso de tu clase de identidad corporativa (Amarillo Tránsito) --%>
                                <button type="button" class="btn btn--primary" onclick="consultarPlaca()">Consultar</button>
                            </div>
                        </div>
                    </div>

                    <%-- Espacio para mostrar el resultado (Sincronizado con tus variables de color) --%>
                    <div id="resultadoControl" style="display: none; margin-top: 30px; border-top: 1px solid var(--border); padding-top: 20px;">
                        <div class="field">
                            <h3 id="displayPlaca" style="font-size: 2rem; color: var(--text); margin: 0 0 5px 0;">---</h3>
                            <p id="displayInfo" style="color: var(--muted); margin: 0 0 20px 0;">Cargando información del propietario...</p>
                        </div>

                        <div class="actions" style="display: flex; gap: 12px;">
                            <%-- Inyección dinámica de tus variables de estado de éxito y alerta --%>
                            <button id="btnIngreso" class="btn" style="background-color: var(--ok); color: white; border: none; display: none;">Registrar ENTRADA</button>
                            <button id="btnSalida" class="btn" style="background-color: var(--bad); color: white; border: none; display: none;">Registrar SALIDA</button>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <%-- PIE DE PÁGINA --%>
        <footer class="footer">ParkZone · Gestión Digital</footer>

        <%-- LÓGICA DE CONTROL LOGÍSTICO --%>
        <script>
            function consultarPlaca() {
                const placa = document.getElementById('txtBusquedaPlaca').value.toUpperCase();

                if (placa.trim() === "") {
                    alert("Por favor ingresa una placa");
                    return;
                }

                // Simulación intermedia antes del consumo de la API REST / Servlet
                document.getElementById('resultadoControl').style.display = 'block';
                document.getElementById('displayPlaca').innerText = placa;
                document.getElementById('displayInfo').innerText = "Vehículo identificado en el sistema";

                // Renderizado condicional de acciones logísticas
                document.getElementById('btnIngreso').style.display = 'inline-flex';
            }
        </script>
    </body>
</html>