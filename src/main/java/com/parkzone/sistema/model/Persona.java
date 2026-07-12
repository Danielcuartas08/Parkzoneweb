package com.parkzone.sistema.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

/**
 * Clase Entidad que representa la tabla 'persona' en la base de datos.
 * Cumple con el estándar de persistencia JPA para el mapeo de datos.
 * * @author Daniel Cuartas
 * @version 1.0
 */
@Entity
@Table(name = "persona")
public class Persona {

    // El documento actúa como Llave Primaria. 
    // Usamos Long para soportar la longitud de las cédulas colombianas (BIGINT en MySQL).
    @Id
    @Column(name = "documento")
    private Long documento;

    @Column(name = "nombre", nullable = false, length = 100)
    private String nombre;

    @Column(name = "telefono", length = 20)
    private String telefono;

    /**
     * Constructor vacío requerido por el estándar JPA.
     */
    public Persona() {
    }

    /**
     * Constructor con parámetros para inicializar el objeto Persona.
     * * @param documento Número de identificación del propietario
     * @param nombre Nombre completo del propietario
     * @param telefono Teléfono de contacto
     */
    public Persona(Long documento, String nombre, String telefono) {
        this.documento = documento;
        this.nombre = nombre;
        this.telefono = telefono;
    }

    // =========================================================================
    // MÉTODOS GETTERS Y SETTERS (Estándar de Encapsulamiento)
    // =========================================================================

    public Long getDocumento() {
        return documento;
    }

    public void setDocumento(Long documento) {
        this.documento = documento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}