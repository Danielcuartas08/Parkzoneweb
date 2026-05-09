<%@page import="java.util.List"%>
<%@page import="model.Vehiculo"%>
<%@page import="dao.VehiculoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ParkZone · Historial</title>
        <%-- Ruta corregida para subir un nivel al CSS --%>
        <link rel="stylesheet" href="../css/styles.css" />
    </head>
    <body>

        <header class="topbar">
            <div class="topbar__inner">
                <a class="brand" href="../index.jsp">
                    <img src="../img/logo.png" alt="Logo ParkZone">
                    <div class="name">
                        <strong>PARKZONE</strong>
                        <span>Historial</span>
                    </div>
                </a>

                <nav class="nav">
                    <a href="../index.jsp">Inicio</a>
                    <a href="scanner.jsp">Scanner</a>
                    <a href="register.jsp">Registro</a>
                    <a class="active" href="history.jsp">Historial</a>
                </nav>
            </div>
        </header>

        <main class="wrapper">
            <section class="panel">
                <div class="panel__header">
                    <h2>Vehículos Registrados (MySQL)</h2>
                    <div class="actions" style="margin:0;">
                        <%-- Botón para refrescar la página y consultar la DB de nuevo --%>
                        <button class="btn" onclick="location.reload()">Actualizar</button>
                    </div>
                </div>

                <div class="panel__body">
                    <div class="table-container">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Placa</th>
                                    <th>Tipo</th>
                                    <th>ID Propietario</th>
                                </tr>
                            </thead>
                            <tbody id="histBody">
                                <%
                                    // Llamamos al DAO para obtener la lista real de la base de datos
                                    VehiculoDAO dao = new VehiculoDAO();
                                    List<Vehiculo> lista = dao.listar();

                                    if (lista == null || lista.isEmpty()) {
                                %>
                                <tr>
                                    <td colspan="4" style="text-align:center; color:var(--muted);">
                                        No hay vehículos registrados en la base de datos.
                                    </td>
                                </tr>
                                <%
                                } else {
                                    for (Vehiculo v : lista) {
                                %>
                                <tr>
                                    <td><%= v.getidvehiculo()%></td>
                                    <td><strong><%= v.getplaca()%></strong></td>
                                    <td><%= v.gettipo()%></td>
                                    <td><%= v.getidpersona()%></td>
                                </tr>
                                <%
                                        }
                                    }
                                %>
                            </tbody>
                        </table>
                    </div>

                    <p class="note" style="margin-top:12px;">
                        Mostrando registros reales sincronizados desde MySQL.
                    </p>
                </div>
            </section>
        </main>

        <footer class="footer">ParkZone · Historial</footer>

        <script src="../js/app.js"></script>
    </body>
</html>