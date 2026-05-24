<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>ParkZone - Registro de Vehículo</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #f4f4f9; margin: 40px; }
        .container { max-width: 500px; background: white; padding: 20px; border-radius: 8px; box-shadow: 0px 0px 10px rgba(0,0,0,0.1); }
        .form-group { margin-bottom: 15px; }
        .form-group label { display: block; margin-bottom: 5px; font-weight: bold; }
        .form-group input, .form-group select { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn { background-color: #28a745; color: white; padding: 10px 15px; border: none; border-radius: 4px; cursor: pointer; width: 100%; font-size: 16px; }
        .btn:hover { background-color: #218838; }
        .alert-success { background-color: #d4edda; color: #155724; padding: 10px; border-radius: 4px; margin-bottom: 15px; }
        .alert-danger { background-color: #f8d7da; color: #721c24; padding: 10px; border-radius: 4px; margin-bottom: 15px; }
    </style>
</head>
<body>

<div class="container">
    <h2>ParkZone - Módulo de Registro</h2>
    <p>Codificación con Framework Spring Boot y JSP</p>

    <% if (request.getAttribute("mensajeExito") != null) { %>
        <div class="alert-success"><%= request.getAttribute("mensajeExito") %></div>
    <% } %>
    
    <% if (request.getAttribute("mensajeError") != null) { %>
        <div class="alert-danger"><%= request.getAttribute("mensajeError") %></div>
    <% } %>

    <form action="guardarVehiculo" method="POST">
        <h3>Datos del Propietario</h3>
        <div class="form-group">
            <label for="documento">Documento de Identidad:</label>
            <input type="number" id="documento" name="documento" required placeholder="Ej: 1006851025">
        </div>
        <div class="form-group">
            <label for="nombre">Nombre Completo:</label>
            <input type="text" id="nombre" name="nombre" required placeholder="Ej: Daniel Cuartas">
        </div>
        <div class="form-group">
            <label for="telefono">Teléfono:</label>
            <input type="text" id="telefono" name="telefono" placeholder="Ej: 3157894561">
        </div>

        <h3>Datos del Vehículo</h3>
        <div class="form-group">
            <label for="placa">Placa:</label>
            <input type="text" id="placa" name="placa" required placeholder="Ej: DBI2026" style="text-transform: uppercase;">
        </div>
        <div class="form-group">
            <label for="tipo">Tipo de Vehículo:</label>
            <select id="tipo" name="tipo">
                <option value="Moto">Moto</option>
                <option value="Carro">Carro / Automóvil</option>
                <option value="Otro">Otro</option>
            </select>
        </div>

        <button type="submit" class="btn">Guardar Registro en Sistema</button>
    </form>
</div>

</body>
</html>