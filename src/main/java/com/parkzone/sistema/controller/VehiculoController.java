package com.parkzone.sistema.controller;

import com.parkzone.sistema.model.Persona;
import com.parkzone.sistema.model.Vehiculo;
import com.parkzone.sistema.repository.PersonaRepository;
import com.parkzone.sistema.repository.VehiculoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * Clase Controlador que gestiona las peticiones web para el módulo de registro.
 * Reemplaza la funcionalidad de los antiguos Servlets tradicionales utilizando
 * Spring MVC.
 *
 * * @author Daniel Cuartas
 * @version 1.0
 */
@Controller
public class VehiculoController {

    // Inyección de dependencias: Spring Boot conecta automáticamente los repositorios
    @Autowired
    private PersonaRepository personaRepository;

    @Autowired
    private VehiculoRepository vehiculoRepository;

    /**
     * Método GET que atiende la ruta de la página de registro. Muestra el
     * formulario al usuario.
     *
     * * @return Nombre de la vista HTML/JSP de registro
     */
    @GetMapping("/registro")
    public String mostrarFormularioRegistro(Model model) {
        // "vehiculo" es el nombre con el que lo leerás en el JSP
        // new Vehiculo() es el objeto vacío para que el formulario no falle
        model.addAttribute("vehiculo", new Vehiculo());

        return "register";
    }

    /**
     * Método GET que atiende la ruta del historial. Consulta la base de datos y
     * envía la lista a la vista 'history.jsp'.
     */
    @GetMapping("/historial")
    public String listarHistorial(Model model) {
        // Enviar la lista de vehículos al JSP
        // Usamos "listaVehiculos" porque así lo llamamos en el ${listaVehiculos} del JSP
        model.addAttribute("listaVehiculos", vehiculoRepository.findAll());

        return "history"; // Carga /WEB-INF/jsp/history.jsp
    }

    @GetMapping({"/", "/index"})
    public String listarVehiculos(Model model) {
        // Obtenemos la lista usando el repositorio (sin DAOs)
        model.addAttribute("lista", vehiculoRepository.findAll());
        return "index"; // Esto carga el archivo index.jsp
    }

    /**
     * Método GET que atiende la ruta del módulo Scanner. Redirige al usuario a
     * la vista de escaneo de placas.
     */
    @GetMapping("/scanner")
    public String mostrarScanner() {
        return "scanner"; // Esto buscará el archivo /WEB-INF/jsp/scanner.jsp
    }

    /**
     * Método POST que procesa el envío de datos desde el formulario web.
     * Captura los parámetros, mapea los objetos y los guarda en MySQL sin usar
     * SQL nativo.
     *
     * * @param documento Cédula del propietario (capturada como Long para
     * BIGINT)
     * @param nombre Nombre completo del propietario
     * @param telefono Teléfono de contacto
     * @param placa Placa del vehículo
     * @param tipo Tipo de vehículo (Moto, Carro, etc.)
     * @param model Objeto de Spring para enviar mensajes de respuesta a la
     * vista
     * @return Nombre de la vista con el resultado de la operación
     */
    @PostMapping("/guardarVehiculo")
    public String registrarVehiculo(
            @RequestParam("documento") Long documento,
            @RequestParam("nombre") String nombre,
            @RequestParam("telefono") String telefono,
            @RequestParam("placa") String placa,
            @RequestParam("tipo") String tipo,
            Model model) {

        try {
            // 1. Crear y guardar primero el propietario en la tabla 'persona'
            Persona propietario = new Persona(documento, nombre, telefono);
            personaRepository.save(propietario); // .save() hace el INSERT automático

            // 2. Crear y guardar el vehículo amarrándolo al propietario (Llave Foránea)
            Vehiculo vehiculo = new Vehiculo(placa, tipo, propietario);
            vehiculoRepository.save(vehiculo);

            // Enviar mensaje de éxito a la interfaz web de ParkZone
            model.addAttribute("mensajeExito", "¡Vehículo " + placa + " registrado con éxito para " + nombre + "!");

        } catch (Exception e) {
            // Enviar mensaje de error en caso de fallas (ej. Placa duplicada)
            model.addAttribute("mensajeError", "Error al procesar el registro: " + e.getMessage());
        }

        return "register"; // Recarga la misma página mostrando el resultado
    }
}
