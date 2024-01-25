package alquilervehiculos;

public class Bicicleta  extends Vehiculo{
    //PROPIEDADES
    //METODOS

    public Bicicleta(String marca, String modelo, int anioFabricacion) {
        super(marca,modelo,anioFabricacion);
    }
    public float calcularAlquiler(int dias){
        if(dias >3){
            return ((3*15)+((dias-3)*10));
        } else return (dias*15);
    }
}
