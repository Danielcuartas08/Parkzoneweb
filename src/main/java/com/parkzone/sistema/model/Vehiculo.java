package com.parkzone.sistema.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

/**
 * Clase Entidad que representa la tabla 'vehiculo' en la base de datos.
 * Maneja la relación de llave foránea con la entidad Persona usando JPA.
 * * @author Daniel Cuartas
 * @version 1.0
 */
@Entity
@Table(name = "vehiculo")
public class Vehiculo {

    // La placa actúa como la Llave Primaria (ID)
    @Id
    @Column(name = "placa", length = 10)
    private String placa;

    @Column(name = "tipo", nullable = false, length = 50)
    private String tipo;

    // Relación de Llave Foránea: Muchos vehículos pueden pertenecer a una misma persona.
    // 'idpersona' es el nombre de la columna en la tabla vehiculo dentro de MySQL.
    @ManyToOne
    @JoinColumn(name = "idpersona", nullable = false)
    private Persona propietario;

    /**
     * Constructor vacío requerido por el estándar JPA.
     */
    public Vehiculo() {
    }

    /**
     * Constructor con parámetros para inicializar el objeto Vehiculo.
     * * @param placa Placa única del vehículo
     * @param tipo Tipo de vehículo (Moto, Carro, etc.)
     * @param propietario Objeto Persona que es dueño del vehículo
     */
    public Vehiculo(String placa, String tipo, Persona propietario) {
        this.placa = placa;
        this.tipo = tipo;
        this.propietario = propietario;
    }

    // =========================================================================
    // MÉTODOS GETTERS Y SETTERS (Estándar de Encapsulamiento)
    // =========================================================================

    public String getPlaca() {
        return placa;
    }

    public void setPlaca(String placa) {
        this.placa = placa;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public Persona getPropietario() {
        return propietario;
    }

    public void setPropietario(Persona propietario) {
        this.propietario = propietario;
    }
}