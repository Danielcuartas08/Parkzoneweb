package config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConexionDB {

    private static final String URL = "jdbc:mysql://localhost:3306/mydb?useSSL=false&serverTimezone=UTC&allowPublicKeyRetrieval=true";
    private static final String USER = "root";
    private static final String PASS = "0000";

    public static Connection conectar() {
        try {
            // 2. CRÍTICO: Cargar el driver manualmente para evitar el NullPointerException
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            return DriverManager.getConnection(URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            System.out.println("Error: No se encontró el Driver de MySQL (Falta el JAR).");
            return null;
        } catch (SQLException e) {
            System.out.println("Error de SQL: " + e.getMessage());
            return null;
        }
    }
}