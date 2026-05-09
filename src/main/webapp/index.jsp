<%@page import="java.util.List"%>
<%@page import="model.Vehiculo"%>
<%@page import="dao.VehiculoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ParkZone · Inicio</title>
  <%-- Corregido: Sin ../ porque el index está en la raíz --%>
  <link rel="stylesheet" href="css/styles.css" />
</head>
<body>

  <header class="topbar">
    <div class="topbar__inner">
      <a class="brand" href="index.jsp">
        <%-- Corregido: Ruta directa a la imagen --%>
        <img src="img/logo.png" alt="Logo ParkZone">
        <div class="name">
          <strong>PARKZONE</strong>
        </div>
      </a>

      <nav class="nav">
        <a class="active" href="index.jsp">Inicio</a>
        <%-- Corregido: Apuntando a la carpeta pages --%>
        <a href="pages/scanner.jsp">Scanner</a>
        <a href="pages/register.jsp">Registro</a>
        <a href="pages/history.jsp">Historial</a>
      </nav>
    </div>
  </header>

  <main class="wrapper">
    <%-- Tu sección HERO original --%>
    <section class="hero">
      <div class="hero__content">
        <p class="eyebrow">Bienvenido</p>
        <h1>Gestión de Parqueadero</h1>
        <p class="subtitle">Control de acceso y registro de vehículos en tiempo real conectado a MySQL.</p>
      </div>
    </section>

    <div class="grid">
      <%-- Tarjeta de Acceso Rápido --%>
      <div class="card">
        <div class="card__body">
          <h2>Lectura de Placas</h2>
          <p>Valida ingresos y salidas rápidamente.</p>
          <div class="actions">
            <a href="pages/scanner.jsp" class="btn btn--primary">Abrir Escáner</a>
          </div>
        </div>
      </div>

      <%-- Tarjeta de Registro --%>
      <div class="card">
        <div class="card__body">
          <h2>Nuevo Registro</h2>
          <p>Agrega vehículos que no están en la base de datos.</p>
          <div class="actions">
            <a href="pages/register.jsp" class="btn">Ir a Registro</a>
          </div>
        </div>
      </div>
    </div>

    <%-- Tabla de últimos movimientos (Tu tabla original) --%>
    <section class="panel">
      <div class="panel__header">
        <h2>Últimos Vehículos en DB</h2>
        <button class="btn" onclick="location.reload()">Refrescar</button>
      </div>
      <div class="panel__body">
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
            <%
                try {
                    VehiculoDAO dao = new VehiculoDAO();
                    List<Vehiculo> lista = dao.listar();
                    if (lista == null || lista.isEmpty()) {
            %>
                <tr><td colspan="4" style="text-align:center;">No hay datos disponibles.</td></tr>
            <%
                    } else {
                        for (Vehiculo v : lista) {
            %>
                <tr>
                    <td><%= v.getidvehiculo() %></td>
                    <td><strong><%= v.getplaca() %></strong></td>
                    <td><%= v.gettipo() %></td>
                    <td><%= v.getidpersona() %></td>
                </tr>
            <%
                        }
                    }
                } catch (Exception e) {
            %>
                <tr><td colspan="4" style="color:red;">Error de conexión con MySQL.</td></tr>
            <% } %>
          </tbody>
        </table>
      </div>
    </section>
  </main>

  <footer class="footer">ParkZone · Gestión Digital</footer>

  <script src="js/app.js"></script>
</body>
</html>