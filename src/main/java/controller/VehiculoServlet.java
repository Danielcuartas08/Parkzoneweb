package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.Vehiculo;
import model.Persona;
import dao.VehiculoDAO;
import dao.PersonaDAO;

@WebServlet(name = "VehiculoServlet", urlPatterns = {"/VehiculoServlet"})
public class VehiculoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Recoger datos del formulario (Persona + Vehículo)
            String idPersonaStr = request.getParameter("txtIdPersona");
            String nombrePersona = request.getParameter("txtNombrePersona"); // NUEVO
            String telefonoPersona = request.getParameter("txtTelefonoPersona"); // NUEVO

            String placa = request.getParameter("txtPlaca");
            String tipo = request.getParameter("txtTipo");

            // Validación de nulidad
            if (idPersonaStr == null || placa == null) {
                response.sendRedirect(request.getContextPath() + "/pages/register.jsp?status=error");
                return;
            }

            // CAMBIO CLAVE: Usar Long para soportar números de cédula largos
            long idPersona = Long.parseLong(idPersonaStr);

            // 2. Proceso de Registro Doble
            PersonaDAO pDao = new PersonaDAO();
            VehiculoDAO vDao = new VehiculoDAO();

            // A. Primero creamos/registramos a la Persona
            Persona p = new Persona();
            p.setIdpersona(idPersona);
            p.setNombre(nombrePersona);
            p.setTelefono(telefonoPersona);

            // Intentamos insertar la persona. 
            // Si ya existe, el DAO devolverá false, pero seguiremos con el vehículo.
            pDao.insertar(p);

            // B. Luego creamos y registramos el Vehículo vinculado a ese ID
            Vehiculo v = new Vehiculo();
            v.setplaca(placa);
            v.settipo(tipo);
            v.setidpersona(idPersona);

            boolean exitoVehiculo = vDao.insertar(v);

            // 3. REDIRECCIÓN
            if (exitoVehiculo) {
                response.sendRedirect(request.getContextPath() + "/pages/register.jsp?status=success");
            } else {
                response.sendRedirect(request.getContextPath() + "/pages/register.jsp?status=error");
            }

        } catch (NumberFormatException e) {
            System.err.println("Error de formato (Cédula demasiado larga o inválida): " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/pages/register.jsp?status=error");
        } catch (Exception e) {
            // Esto imprimirá en la consola la línea exacta donde está el "Not supported yet"
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/pages/register.jsp?status=error");
        }

    }
}
