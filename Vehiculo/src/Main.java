import alquilervehiculos.*;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner scr = new Scanner(System.in);
        Moto moto1 = new Moto("Kawasaki","Ninja",2008,500);
        Moto moto2 = new Moto("Yamaha","CXR",2018,450);
        Coche coche1 = new Coche("Renault","Scenic",2004,5);
        Coche coche2 = new Coche("Citröen","C4 Cactus",2016,5);
        Bicicleta bicicleta1 = new Bicicleta("hola","adios",1);
        Bicicleta bicicleta2 = new Bicicleta("Orbea","Rc-S500",2021);
        CocheAltaGama cocheGama1 = new CocheAltaGama("Ferrari","Enzo",1998,3);
        CocheAltaGama cocheGama2 = new CocheAltaGama("Nissan", "GTR",1997,3);

int opcion,dias;

        do{
            opcion = scr.nextInt();
            menu();
            switch (opcion){
                case 1:
                    break;
                case 2:
                    break;
                case 3:
                    break;
                case 4:
                    System.out.println("Cuántos dias:");
                    dias = scr.nextInt();
                    System.out.println(bicicleta1.calcularAlquiler(dias));;
                    System.out.println("¿Desea alquilarla?" +
                            "[1] Sí" + "[0] No");
                    int i = scr.nextInt();
                    if (i==1) Vehiculo.setIngresoAlguiler(bicicleta1.calcularAlquiler(dias));

                    break;
                case 5:
                    System.out.println(Vehiculo.getIngresoAlguiler());
                    break;



            }

        }while (opcion!=0);










    }






    public static void menu(){
        System.out.println("MENU ______________________________________________");
        System.out.println("[1] Alquilar Coche");
        System.out.println("[2] Alquilar Coche Alta Gama");
        System.out.println("[3] Alquilar Moto");
        System.out.println("[4] Alquilar Bicicleta");
        System.out.println("[5] Calcular Ingreso total alquiler para la empresa");
        System.out.println("[0] Salir");
        System.out.println("___________________________________________________");
    }
}
