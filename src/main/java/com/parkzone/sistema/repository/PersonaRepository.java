package com.parkzone.sistema.repository;

import com.parkzone.sistema.model.Persona;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

/**
 * Interface que define el repositorio para la entidad Persona.
 * Proporciona de forma automática operaciones CRUD (Guardar, Buscar, Eliminar)
 * gracias a la herencia de JpaRepository.
 * * @author Daniel Cuartas
 * @version 1.0
 */
@Repository
public interface PersonaRepository extends JpaRepository<Persona, Long> {
    // Al heredar de JpaRepository<Persona, Long>, Spring sabe que la entidad es 'Persona'
    // y que su llave primaria (documento) es de tipo 'Long' (BIGINT).
}