<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>ParkZone ·Registro</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css" />
  
  <script src="https://unpkg.com/react@18/umd/react.development.js" crossorigin></script>
  <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js" crossorigin></script>
  <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>
</head>
<body>

  <header class="topbar">
    <div class="topbar__inner">
      <a class="brand" href="${pageContext.request.contextPath}/index">
        <img src="${pageContext.request.contextPath}/img/logo.png" alt="Logo ParkZone">
        <div class="name">
          <strong>PARKZONE</strong>
        </div>
      </a>

      <nav class="nav">
        <a href="${pageContext.request.contextPath}/index">Inicio</a>
        <a href="${pageContext.request.contextPath}/scanner">Lectura</a>
        <a class="active" href="${pageContext.request.contextPath}/registro">Registro</a>
        <a href="${pageContext.request.contextPath}/historial">Historial</a>
      </nav>
    </div>
  </header>

  <div id="react-form-container"></div>

  <footer class="footer">ParkZone  Gestion Digital</footer>

  <script type="text/babel">
    function ReactRegisterModule() {
      // --- CONTROL DE ESTADOS DE REACT (Hooks) ---
      const [placa, setPlaca] = React.useState('');
      const [tipo, setTipo] = React.useState('');
      const [documento, setDocumento] = React.useState('');
      const [nombre, setNombre] = React.useState('');
      const [telefono, setTelefono] = React.useState('');

      // Formateador interactivo en tiempo real para mantener el estándar de placas
      const handlePlacaChange = (e) => {
        setPlaca(e.target.value.toUpperCase());
      };

      return (
        <main className="wrapper">
          <section className="panel">
            <div className="panel__header">
              <h2>Registrar nueva placa</h2>
            </div>

            <div className="panel__body">
              {/* Formulario conectado directamente al PostMapping de tu VehiculoController */}
              <form action="${pageContext.request.contextPath}/guardarVehiculo" method="POST" id="regForm">
                
                {/* FILA 1: Placa y Tipo (Fiel a tu código original) */}
                <div className="row">
                  <div className="field">
                    <label htmlFor="regPlate">Placa</label>
                    <input 
                      id="regPlate" 
                      name="placa"
                      type="text" 
                      placeholder="Ej: ABC123" 
                      maxlength="8" 
                      value={placa}
                      onChange={handlePlacaChange}
                      required 
                    />
                  </div>

                  <div className="field">
                    <label htmlFor="regType">Tipo de vehículo</label>
                    <select id="regType" name="tipo" value={tipo} onChange={(e) => setTipo(e.target.value)} required>
                      <option value="">Seleccione…</option>
                      <option value="Carro">Carro</option>
                      <option value="Moto">Moto</option>
                      <option value="Camioneta">Camioneta</option>
                      <option value="Otro">Otro</option>
                    </select>
                  </div>
                </div>

                {/* FILA 2: Propietario (Nombre) y Documento (Alineado con el mapeo del controlador) */}
                <div className="row" style={{marginTop: "12px"}}>
                  <div className="field">
                    <label htmlFor="regOwner">Propietario (Nombre completo)</label>
                    <input 
                      id="regOwner" 
                      name="nombre"
                      type="text" 
                      placeholder="Nombre del propietario" 
                      value={nombre}
                      onChange={(e) => setNombre(e.target.value)}
                      required 
                    />
                  </div>

                  <div className="field">
                    <label htmlFor="regDoc">Documento de Identidad</label>
                    <input 
                      id="regDoc" 
                      name="documento"
                      type="number" 
                      placeholder="Cédula de ciudadanía" 
                      value={documento}
                      onChange={(e) => setDocumento(e.target.value)}
                      required 
                    />
                  </div>
                </div>

                {/* FILA 3: Teléfono y Estado */}
                <div className="row" style={{marginTop: "12px"}}>
                  <div className="field">
                    <label htmlFor="regTel">Teléfono de Contacto</label>
                    <input 
                      id="regTel" 
                      name="telefono"
                      type="number" 
                      placeholder="Ej: 315..." 
                      value={telefono}
                      onChange={(e) => setTelefono(e.target.value)}
                      required 
                    />
                  </div>

                  <div className="field">
                    <label htmlFor="regStatus">Estado</label>
                    <select id="regStatus" required>
                      <option value="ACTIVE">Activo</option>
                      <option value="BLOCKED">Bloqueado</option>
                    </select>
                  </div>
                </div>

                {/* Bloque de Acciones con tus clases nativas de estilo */}
                <div className="actions">
                 <button className="btn btn--primary" type="submit"style={{ marginRight: "12px" }}>Guardar</button>
                  <a className="btn" href="${pageContext.request.contextPath}/scanner">Volver a lectura</a>
                </div>

                {/* Mensajes dinámicos en base a las respuestas de Spring Boot */}
                <% if (request.getAttribute("mensajeExito") != null) { %>
                  <div className="callout" style={{marginTop: "12px", borderColor: "#28a745", color: "#28a745"}}>
                    <%= request.getAttribute("mensajeExito") %>
                  </div>
                <% } %>
                <% if (request.getAttribute("mensajeError") != null) { %>
                  <div className="callout" style={{marginTop: "12px", borderColor: "#dc3545", color: "#dc3545"}}>
                    <%= request.getAttribute("mensajeError") %>
                  </div>
                <% } %>

              </form>
            </div>
          </section>
        </main>
      );
    }

    // Renderización controlada por React montada sobre tu Grid estructural
    const root = ReactDOM.createRoot(document.getElementById('react-form-container'));
    root.render(<ReactRegisterModule />);
  </script>
</body>
</html>