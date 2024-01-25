package alquilervehiculos;

public class Moto  extends Vehiculo{
    //PROPIEDADES
    private int cilindrada;
    //METODOS

    public Moto(String marca, String modelo, int anioFabricacion,int cilindrada) {
        super(marca,modelo,anioFabricacion);
        this.cilindrada = cilindrada;
    }
    public void miau(){
        System.out.println("miau");
    }
    public float calcularAlquiler(int dias){
        float alquiler = 1;
        return alquiler;
    }

    @Override
    public String toString() {
        return "Moto{" + super.toString() +
                "cilindrada=" + cilindrada +
                '}';
    }
}
