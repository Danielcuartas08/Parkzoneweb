<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ParkZone · Registro</title>
        <script src="https://unpkg.com/lucide@latest"></script>
        <link rel="stylesheet" href="../css/styles.css" />
    </head>
    <body>

        <header class="topbar">
            <div class="topbar__inner">
                <a class="brand" href="../index.jsp">
                    <img src="../img/logo.png" alt="Logo ParkZone">
                    <div class="name">
                        <strong>PARKZONE</strong>
                    </div>
                </a>

                <nav class="nav">
                    <a href="../index.jsp">Inicio</a>
                    <a href="scanner.jsp">Scanner</a>
                    <a class="active" href="register.jsp">Registro</a>
                    <a href="history.jsp">Historial</a>
                </nav>
            </div>
        </header>

        <main class="wrapper">

            <%-- BLOQUE DE MENSAJE POST-REGISTRO --%>
            <%
                String status = request.getParameter("status");
                if (status != null) {
                    if (status.equals("success")) {
            %>
            <div class="callout badge--ok" style="padding: 20px; text-align: center; margin-bottom: 25px; border: 2px solid var(--ok);">
                <h2 style="margin:0; color: var(--ok);">¡Registro Exitoso!</h2>
                <p style="margin: 5px 0 0;">Persona y Vehículo guardados en MySQL. Volviendo al inicio...</p>
            </div>
            <script>
                setTimeout(function () {
                    window.location.href = "../index.jsp";
                }, 3000);
            </script>
            <%
            } else if (status.equals("error")) {
            %>
            <div class="callout badge--bad" style="padding: 20px; text-align: center; margin-bottom: 25px; border: 2px solid var(--bad);">
                <h2 style="margin:0; color: var(--bad);">Error de Registro</h2>
                <p style="margin: 5px 0 0;">No se pudo guardar. Verifica que la placa no esté repetida.</p>
            </div>
            <%
                    }
                }
            %>

            <section class="panel">
                <div class="panel__header">
                    <div>
                        <h2>Registrar Nuevo Vehículo</h2>
                        <p style="font-size: 0.9em; color: #666;">Ingresa los datos del dueño y del vehículo</p>
                    </div>
                    <span class="badge" id="regBadge">Nuevo Registro</span>
                </div>

                <div class="panel__body">
                    <form action="../VehiculoServlet" method="POST" id="regForm">

                        <!-- SECCIÓN: DATOS DEL DUEÑO -->
                        <h3 style="margin-bottom: 15px; color: var(--primary);">1. Datos del Propietario</h3>
                        <div class="row-triple" style="margin-bottom: 25px;">
                            <div class="field">
                                <label for="txtIdPersona">Cédula / ID</label>
                                <input name="txtIdPersona" id="txtIdPersona" type="number" placeholder="Ej: 000000..." required />
                            </div>
                            <div class="field">
                                <label for="txtNombrePersona">Nombre Completo</label>
                                <input name="txtNombrePersona" id="txtNombrePersona" type="text" placeholder="Ej: Nombre Apellido" required />
                            </div>
                            <div class="field">
                                <label for="txtTelefonoPersona">Teléfono</label>
                                <input name="txtTelefonoPersona" id="txtTelefonoPersona" type="text" placeholder="Ej: 0000000" required />
                            </div>
                        </div>

                        <div class="hr" style="margin: 20px 0;"></div>

                        <!-- SECCIÓN: DATOS DEL VEHÍCULO -->
                        <h3 style="margin-bottom: 15px; color: var(--primary);">2. Datos del Vehículo</h3>
                        <div class="row-double">
                            <div class="field">
                                <label for="txtPlaca">Placa</label>
                                <input name="txtPlaca" id="txtPlaca" type="text" placeholder="Ej: ABC123" required maxlength="8" style="text-transform: uppercase;" />
                            </div>

                            <div class="field">
                                <label for="txtTipo">Tipo de vehículo</label>
                                <select name="txtTipo" id="txtTipo" required>
                                    <option value="">Seleccione...</option>
                                    <option value="Carro">Carro</option>
                                    <option value="Moto">Moto</option>
                                    <option value="Camioneta">Camioneta</option>
                                </select>
                            </div>
                        </div>

                        <div class="actions" style="margin-top: 30px;">
                            <button type="submit" class="btn btn--primary" style="width: 100%; padding: 15px;">
                                <i data-lucide="save"></i> Finalizar Registro Completo
                            </button>
                        </div>
                    </form>
                </div>
            </section>
        </main>

        <footer class="footer">ParkZone · Gestión de Parqueadero</footer>

        <script src="../js/app.js"></script>
        <script>
                    lucide.createIcons();

                    // Auto-mayúsculas para la placa
                    document.getElementById('txtPlaca').addEventListener('input', function (e) {
                        e.target.value = e.target.value.toUpperCase();
                    });
        </script>
    </body>
</html>