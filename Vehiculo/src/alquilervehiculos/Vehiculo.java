package alquilervehiculos;

public class Vehiculo {
    //PROPIEDADES
    private String marca;
    private String modelo;
    private int anioFabricacion;
    static private float ingresoAlguiler;
    //METHODS

    public Vehiculo(String marca, String modelo, int anioFabricacion) {
        this.marca = marca;
        this.modelo = modelo;
        this.anioFabricacion = anioFabricacion;
    }
    public void acelarar(){
        System.out.println("acelerar");
    }
    @Override
    public String toString() {
        return "Vehiculo{" +
                "marca='" + marca + '\'' +
                ", modelo='" + modelo + '\'' +
                ", anioFabricacion=" + anioFabricacion +
                '}';
    }
    public static float getIngresoAlguiler(){
        return ingresoAlguiler;
    }
    public static void setIngresoAlguiler(float ingresoAlguiler) {
        Vehiculo.ingresoAlguiler += ingresoAlguiler;
    }
}
