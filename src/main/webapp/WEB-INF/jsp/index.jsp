<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>ParkZone · Inicio</title>
        <%-- Inclusión de estilos globales mediante ruta absoluta de contexto --%>
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
                    <a href="${pageContext.request.contextPath}/" class="active">Inicio</a>
                    <a href="${pageContext.request.contextPath}/scanner">Scanner</a>
                    <a href="${pageContext.request.contextPath}/registro">Registro</a>
                    <a href="${pageContext.request.contextPath}/historial">Historial</a>
                </nav>
            </div>
        </header>

        <%-- CONTENEDOR PRINCIPAL DEL COMPONENTE --%>
        <main class="wrapper">

            <%-- SECCIÓN HERO: Presentación del módulo de bienvenida --%>
            <section class="hero">
                <div class="hero__content">
                    <p class="eyebrow">Bienvenido</p>
                    <h1>Gestión de Parqueadero</h1>
                    <p class="subtitle">Control de acceso y registro de vehículos en tiempo real.</p>
                </div>
            </section>

            <%-- CONTENEDOR GRID: Acceso rápido en columnas (exclusivo para Tarjetas) --%>
            <div class="grid">

                <%-- Tarjeta de Acceso Rápido: Módulo Scanner --%>
                <div class="card">
                    <div class="card__body">
                        <h2>Lectura de Placas</h2>
                        <p>Valida ingresos y salidas rápidamente.</p>
                        <div class="actions">
                            <%-- Corrección de clase: Se añade btn--primary para heredar Amarillo Tránsito --%>
                            <a href="${pageContext.request.contextPath}/scanner" class="btn btn--primary">Scanner</a>
                        </div>
                    </div>
                </div>

                <%-- Tarjeta de Acceso Rápido: Módulo Registro --%>
                <div class="card">
                    <div class="card__body">
                        <h2>Nuevo Registro</h2>
                        <p>Agrega vehículos que no están en la base de datos.</p>
                        <div class="actions">
                            <%-- Corrección de clase: Se añade btn--primary para heredar Amarillo Tránsito --%>
                            <a href="${pageContext.request.contextPath}/registro" class="btn btn--primary">Ir a Registro</a>
                        </div>
                    </div>
                </div>

            </div> <%-- Fin del .grid --%>

            <%-- SECCIÓN PANEL: Historial resumido (Fuera del grid para ancho completo del contenedor) --%>
            <section class="panel" style="margin-top: 24px;">
                <div class="panel__header">
                    <h2>Últimos Vehículos en DB</h2>
                    <%-- Corrección de clase: Se añade btn--primary para mantener simetría cromática corporativa --%>
                    <button class="btn btn--primary" onclick="location.reload()">Refrescar</button>
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
                            <tbody>
                                <c:choose>
                                    <%-- Renderizado condicional en caso de base de datos vacía --%>
                                    <c:when test="${empty lista}">
                                        <tr>
                                            <td colspan="4" style="text-align:center;">No hay vehículos registrados.</td>
                                        </tr>
                                    </c:when>
                                    <%-- Iteración de la colección enviada por el controlador Spring MVC --%>
                                    <c:otherwise>
                                        <c:forEach var="v" items="${lista}" varStatus="status">
                                            <tr>
                                                <td>${status.count}</td>
                                                <td><strong>${v.placa}</strong></td>
                                                <td>${v.tipo}</td>
                                                <%-- Navegación del grafo de objetos mediante JPA (Vehiculo -> Persona) --%>
                                                <td>${v.propietario.documento}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>
                </div>
            </section>

        </main>

        <%-- PIE DE PÁGINA --%>
        <footer class="footer">ParkZone · Gestión Digital</footer>

        <%-- Scripts de comportamiento global --%>
        <script src="${pageContext.request.contextPath}/