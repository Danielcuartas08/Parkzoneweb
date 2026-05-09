package dao;

import config.ConexionDB;
import java.sql.*;
import model.Persona;

public class PersonaDAO {

    private Connection con;
    private PreparedStatement ps;

    public boolean insertar(Persona p) {
        // CAMBIO: Usamos 'documento' que es el nombre real en tu tabla MySQL
        String sql = "INSERT INTO persona (documento, nombre, telefono) VALUES (?, ?, ?)";
        try {
            con = ConexionDB.conectar();
            if (con == null) {
                return false;
            }

            ps = con.prepareStatement(sql);
            ps.setLong(1, p.getIdpersona());
            ps.setString(2, p.getNombre());
            ps.setString(3, p.getTelefono());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("PersonaDAO [Insertar] Error: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos();
        }
    }

    private void cerrarRecursos() {
        try {
            if (ps != null) {
                ps.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            System.err.println("Error cerrando recursos: " + e.getMessage());
        }
    }
}
