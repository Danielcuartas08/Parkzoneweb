<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ParkZone · Scanner de Control</title>
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
                    <a class="active" href="scanner.jsp">Scanner</a>
                    <a href="register.jsp">Registro</a>
                    <a href="history.jsp">Historial</a>
                </nav>
            </div>
        </header>

        <main class="wrapper">
            <section class="panel">
                <div class="panel__header">
                    <h2>Scanner de Placa</h2>
                    <p class="subtitle">Busca el vehículo para registrar su ingreso o salida del parqueadero</p>
                </div>

                <div class="panel__body">
                    <!-- Buscador con el estilo de tus campos -->
                    <div class="form-grid">
                        <div class="field" style="grid-column: 1 / -1;">
                            <label for="txtBusquedaPlaca">Número de Placa</label>
                            <div style="display: flex; gap: 10px;">
                                <input name="txtBusquedaPlaca" id="txtBusquedaPlaca" type="text" 
                                       placeholder="EJ: DBI2026" 
                                       style="text-transform: uppercase; font-size: 1.5rem; font-weight: bold; flex: 1;" />
                                <button type="button" class="btn btn--primary" onclick="consultarPlaca()">Consultar</button>
                            </div>
                        </div>
                    </div>

                    <!-- Espacio para mostrar el resultado (Invisible al inicio) -->
                    <div id="resultadoControl" style="display: none; margin-top: 30px; border-top: 2px solid #eee; padding-top: 20px;">
                        <div class="field">
                            <h3 id="displayPlaca" style="font-size: 2rem; color: #333; margin-bottom: 5px;">---</h3>
                            <p id="displayInfo" style="color: #666; margin-bottom: 20px;">Cargando información del propietario...</p>
                        </div>

                        <div class="actions">
                            <!-- Estos botones se activarán dinámicamente -->
                            <button id="btnIngreso" class="btn btn--primary" style="background-color: #28a745; display: none;">Registrar ENTRADA</button>
                            <button id="btnSalida" class="btn btn--primary" style="background-color: #dc3545; display: none;">Registrar SALIDA</button>
                        </div>
                    </div>
                </div>
            </section>
        </main>

        <footer class="footer">ParkZone · Desarrollado por Daniel Cuartas</footer>

        <script>
            function consultarPlaca() {
                const placa = document.getElementById('txtBusquedaPlaca').value.toUpperCase();

                if (placa.trim() === "") {
                    alert("Por favor ingresa una placa");
                    return;
                }

                // Simulamos la lógica que luego haremos con el Servlet
                document.getElementById('resultadoControl').style.display = 'block';
                document.getElementById('displayPlaca').innerText = placa;
                document.getElementById('displayInfo').innerText = "Vehículo identificado en el sistema. Propietario: Daniel Cuartas";

                // Lógica de visualización:
                // Si el vehículo está fuera, mostrar btnIngreso
                // Si el vehículo ya está dentro, mostrar btnSalida
                document.getElementById('btnIngreso').style.display = 'inline-block';
            }
        </script>
    </body>
</html>