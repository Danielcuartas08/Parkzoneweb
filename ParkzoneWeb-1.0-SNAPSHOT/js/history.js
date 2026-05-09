<%@page import="java.util.List"%>
<%@page import="model.Vehiculo"%>
<%@page import="dao.VehiculoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <title>ParkZone · Historial</title>
        <link rel="stylesheet" href="../css/styles.css" />
    </head>
    <body>
        <header class="topbar">
            <div class="topbar__inner">
                <a class="brand" href="../index.jsp">
                    <strong>PARKZONE</strong>
                </a>
                <nav class="nav">
                    <a href="../index.jsp">Inicio</a>
                    <a href="scanner.jsp">Lectura</a>
                    <a href="register.jsp">Registro</a>
                    <a class="active" href="history.jsp">Historial</a>
                </nav>
            </div>
        </header>

        <main class="wrapper">
            <section class="panel">
                <div class="panel__header">
                    <h2>Historial de Vehículos</h2>
                    <button class="btn" onclick="location.reload()">Actualizar</button>
                </div>
                <div class="panel__body">
                    <table>
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Placa</th>
                                <th>Tipo</th>
                                <th>ID Propietario</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            // Aquí llamamos al DAO directamente para probar
                            VehiculoDAO dao = new VehiculoDAO();
                            List<Vehiculo> lista = dao.listar();
                            if(lista.isEmpty()) {
        % >
        <tr><td colspan="4">No hay vehículos registrados.</td></tr>
        <%
                            } else {
        for (Vehiculo v : lista) {
% >
        <tr>
                                <td><%= v.getidvehiculo() %></td>
                                <td><strong><%= v.getplaca() %></strong></td>
                                <td><%= v.gettipo() %></td>
                                <td><%= v.getidpersona() %></td>
                            </tr>
                            <%
                            }
                            }
                            %>
                            </tbody>
                    </table>
                </div>
            </section>
        </main>
        </body>
        </html>