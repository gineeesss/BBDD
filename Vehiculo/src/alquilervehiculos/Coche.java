package alquilervehiculos;

public class Coche extends Vehiculo{
    //PROPIEDADES
    private int numeroPuertas;
    //METODOS

    public Coche(String marca, String modelo, int anioFabricacion, int numeroPuertas) {
        super(marca,modelo,anioFabricacion);
        this.numeroPuertas = numeroPuertas;
    }
    public float calcularAlquiler(int dias){
        float alquiler = 0;
        return alquiler;
    }

    @Override
    public String toString() {
        return "Coche{" + super.toString() +
                "numeroPuertas=" + numeroPuertas +
                "} " ;
    }
    public int getNumeroPuertas() {
        return numeroPuertas;
    }
}
