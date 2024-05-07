package org.example;

import java.util.Scanner;

public class Main {
    public static Votos propuesta = new Votos();
    public static Scanner scr = new Scanner(System.in).useDelimiter("\\n");

    public static void main(String[] args) {
        String nombre,voto;
        int votaciones = scr.nextInt();
        for (int i= 0;i<votaciones;i++){
            nombre =scr.next();
            voto=scr.next();
            System.out.println("Nombre: " + nombre + ", Voto: " + voto + ", Num. Votos: " );
            System.out.println(propuesta.clasificarVotos(nombre,voto, scr.nextInt()));
        }
        propuesta.mostrarLista();
    }
}