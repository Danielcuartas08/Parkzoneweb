package dao;

import config.ConexionDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Vehiculo;

public class VehiculoDAO {

    private Connection con;
    private PreparedStatement ps;
    private ResultSet rs;

    public boolean insertar(Vehiculo v) {
        // Asegúrate que el nombre de la columna sea idpersona o documento según tu tabla
        String sql = "INSERT INTO mydb.vehiculo (placa, tipo, idpersona) VALUES (?, ?, ?)";
        try {
            con = ConexionDB.conectar();
            if (con == null) {
                System.err.println("VehiculoDAO: Error de conexión (con es null)");
                return false;
            }

            ps = con.prepareStatement(sql);
            ps.setString(1, v.getplaca());
            ps.setString(2, v.gettipo());
            ps.setLong(3, v.getidpersona()); // Ajustado a setLong

            int resultado = ps.executeUpdate();
            return resultado > 0;

        } catch (SQLException e) {
            System.err.println("Error SQL al insertar vehículo: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos();
        }
    }

    public List<Vehiculo> listar() {
        List<Vehiculo> lista = new ArrayList<>();
        String sql = "SELECT * FROM vehiculo";
        try {
            con = ConexionDB.conectar();
            if (con == null) {
                return lista;
            }

            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Vehiculo v = new Vehiculo();
                v.setidvehiculo(rs.getInt("idvehiculo"));
                v.setplaca(rs.getString("placa"));
                v.settipo(rs.getString("tipo"));
                v.setidpersona((int) rs.getLong("idpersona"));
                lista.add(v);
            }
        } catch (SQLException e) {
            System.err.println("VehiculoDAO [Listar] Error: " + e.getMessage());
        } finally {
            cerrarRecursos();
        }
        return lista;
    }

    public boolean actualizar(Vehiculo v) {
        String sql = "UPDATE vehiculo SET placa=?, tipo=?, idpersona=? WHERE idvehiculo=?";
        try {
            con = ConexionDB.conectar();
            if (con == null) {
                return false;
            }

            ps = con.prepareStatement(sql);
            ps.setString(1, v.getplaca());
            ps.setString(2, v.gettipo());
            ps.setLong(3, v.getidpersona()); // Ajustado a setLong
            ps.setInt(4, v.getidvehiculo());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("VehiculoDAO [Actualizar] Error: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos();
        }
    }

    public boolean eliminar(int id) {
        String sql = "DELETE FROM vehiculo WHERE idvehiculo = ?";
        try {
            con = ConexionDB.conectar();
            if (con == null) {
                return false;
            }

            ps = con.prepareStatement(sql);
            ps.setInt(1, id);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("VehiculoDAO [Eliminar] Error: " + e.getMessage());
            return false;
        } finally {
            cerrarRecursos();
        }
    }

    private void cerrarRecursos() {
        try {
            if (rs != null && !rs.isClosed()) {
                rs.close();
            }
            if (ps != null && !ps.isClosed()) {
                ps.close();
            }
            if (con != null && !con.isClosed()) {
                con.close();
            }
        } catch (SQLException e) {
            System.err.println("Error al cerrar recursos: " + e.getMessage());
        }
    }
}
