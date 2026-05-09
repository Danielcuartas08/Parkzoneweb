package model;

public class Vehiculo {

    private int idVehiculo;
    private String placa;
    private String tipo;
    private long idPersona; // Correcto: ya es long

    // Constructor vacío
    public Vehiculo() {
    }

    // Constructor con parámetros - CORREGIDO: idPersona ahora es long
    public Vehiculo(int idVehiculo, String placa, String tipo, long idPersona) {
        this.idVehiculo = idVehiculo;
        this.placa = placa;
        this.tipo = tipo;
        this.idPersona = idPersona;
    }

    // --- MÉTODOS ESTÁNDAR (CamelCase) ---
    public int getIdVehiculo() {
        return idVehiculo;
    }

    public void setIdVehiculo(int idVehiculo) {
        this.idVehiculo = idVehiculo;
    }

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

    public long getIdPersona() {
        return idPersona;
    }

    // CORREGIDO: El parámetro debe ser long
    public void setIdPersona(long idPersona) {
        this.idPersona = idPersona;
    }

    // --- MÉTODOS COMPATIBLES (Los que usa tu DAO y Servlet) ---
    public int getidvehiculo() {
        return idVehiculo;
    }

    public void setidvehiculo(int idvehiculo) {
        this.idVehiculo = idvehiculo;
    }

    public String getplaca() {
        return placa;
    }

    public void setplaca(String placa) {
        this.placa = placa;
    }

    public String gettipo() {
        return tipo;
    }

    public void settipo(String tipo) {
        this.tipo = tipo;
    }

    public long getidpersona() {
        return idPersona;
    }

    // CORREGIDO: El parámetro debe ser long para que el DAO no de error
    public void setidpersona(long idpersona) {
        this.idPersona = idpersona;
    }

  
}
