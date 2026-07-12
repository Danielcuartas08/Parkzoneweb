package com.parkzone.sistema.repository;

import com.parkzone.sistema.model.Vehiculo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Interface que define el repositorio para la entidad Vehiculo.
 * Gestiona de forma automatizada las consultas y persistencia de vehículos en MySQL.
 * * @author Daniel Cuartas
 * @version 1.0
 */
@Repository
public interface VehiculoRepository extends JpaRepository<Vehiculo, String> {
    // Al heredar de JpaRepository<Vehiculo, String>, Spring sabe que la entidad es 'Vehiculo'
    // y que su llave primaria (placa) es de tipo 'String'.
}