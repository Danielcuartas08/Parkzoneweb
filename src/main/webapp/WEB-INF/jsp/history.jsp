<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ParkZone · Historial de Vehículos</title>
        <%-- Ruta absoluta: funciona desde cualquier carpeta --%>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
    </head>
    <body>

        <%-- CABECERA PRINCIPAL: Sistema de navegación global con efecto Glassmorphism --%>
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
                    <a href="${pageContext.request.contextPath}/registro">Registro</a>
                    <%-- Activación visual de la pestaña actual mediante la clase pill activa --%>
                    <a href="${pageContext.request.contextPath}/historial" class="active">Historial</a>
                </nav>
            </div>
        </header>

        <%-- CONTENEDOR PRINCIPAL --%>
        <main class="wrapper">
            <section class="panel">
                <div class="panel__header">
                    <h2>Vehículos Registrados (MySQL)</h2>
                    <div class="actions" style="margin:0;">
                        <%-- Corrección de clase: Se añade btn--primary para heredar Amarillo Tránsito --%>
                        <button class="btn btn--primary" onclick="location.reload()">Actualizar</button>
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
                                <c:choose>
                                    <%-- Renderizado condicional en caso de que la tabla esté vacía --%>
                                    <c:when test="${empty listaVehiculos}">
                                        <tr>
                                            <td colspan="4" style="text-align:center;">No hay vehículos registrados.</td>
                                        </tr>
                                    </c:when>
                                    <%-- Iteración de la colección completa enviada por el Controller --%>
                                    <c:otherwise>
                                        <c:forEach var="v" items="${listaVehiculos}" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td> 
                                                <td><strong>${v.placa}</strong></td>
                                                <td>${v.tipo}</td>
                                                <%-- Navegación relacional JPA del grafo de objetos (Vehiculo -> Persona) --%>
                                                <td>${v.propietario.documento}</td> 
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>

                    <p class="note" style="margin-top:16px; color: var(--muted); font-size: 0.875rem;">
                        Mostrando registros reales sincronizados desde MySQL.
                    </p>
                </div>
            </section>
        </main>

        <%-- PIE DE PÁGINA --%>
        <footer class="footer">ParkZone · Historial</footer>

        <%-- Scripts de comportamiento global --%>
        <script src="${pageContext.request.contextPath}/js/app.js"></script>
    </body>
</html>