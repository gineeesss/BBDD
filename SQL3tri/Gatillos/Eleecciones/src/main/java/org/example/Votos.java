package org.example;

import java.util.ArrayList;
import java.util.List;

public class Votos {
    private  int votosAFavor,votosEnContra,votosAbstencion;
    private  List<String> nombresAFavor = new ArrayList<>();
    private  List<String> nombresAbstencion = new ArrayList<>();
    private  List<String> nombresEnContra = new ArrayList<>();

    public String clasificarVotos(String nombre,String voto, int numVotos){
        if (voto.equals("A FAVOR")){
            nombresAFavor.add(nombre);
            votosAFavor += numVotos;
            return "A FAVOR";
        }else if (voto.equals("EN CONTRA")){
            nombresEnContra.add(nombre);
            votosEnContra += numVotos;
            return "EN CONTRA";
        } else if (voto.equals("ABSTENCIÓN")) {
            nombresAbstencion.add(nombre);
            votosAbstencion += numVotos;
            return "ABSTENCIÓN";
        }
        return null;
    }
    public String calcularResultado(){
        if (votosAFavor>votosEnContra) {
            return "La propuesta ha sido aceptada";
        }else return"La propuesta ha sido rechazada";
    }
    public  void mostrarLista(){
        System.out.println("\nVotos a favor: "+ votosAFavor);
        //System.out.println(nombresAFavor);
        for(String a:nombresAFavor){
            if (nombresAFavor.indexOf(a)!=nombresAFavor.size()-1) System.out.print(a+",");
            else System.out.print(a);
        }
        System.out.println("\nVotos a favor: "+ votosEnContra);
        //System.out.println(nombresEnContra);
        for(String a:nombresEnContra){
            if (nombresEnContra.indexOf(a)!=nombresEnContra.size()-1) System.out.print(a+",");
            else System.out.print(a);
        }
        System.out.println("\nVotos a favor: "+ votosAbstencion);
        //System.out.println(nombresAbstencion);
        for(String a:nombresAbstencion){
            if (nombresAbstencion.indexOf(a)!=nombresAbstencion.size()-1) System.out.print(a+",");
            else System.out.print(a);
        }
        System.out.println("\n---");
        System.out.println(calcularResultado());
    }

    public int getVotosAFavor() {
        return votosAFavor;
    }
    public int getVotosEnContra() {
        return votosEnContra;
    }

    public int getVotosAbstencion() {
        return votosAbstencion;
    }

    public String getNombresAFavor() {
        return nombresAFavor.toString();
    }

    public String getNombresAbstencion() {
        return nombresAbstencion.toString();
    }

    public String getNombresEnContra() {
        return nombresEnContra.toString();
    }
}
