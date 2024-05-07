import org.example.Main;
import org.example.Votos;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Tag;
import org.junit.jupiter.api.Test;

import static org.junit.Assert.*;
import static org.junit.jupiter.api.Assertions.assertAll;
import static org.junit.jupiter.api.Assertions.assertEquals;

public class TestEleccion {
    private Votos votos;
    @BeforeEach
    void setUp() {
         votos = new Votos();
    }
    @Test
    @DisplayName("Comprueba si al realizar una votación, entra en el apartado adecuado")
    @Tag("unitarias")
    public void testClasificanEnSuLugar() {
        //Votos votos = new Votos();
        assertAll(
                () -> assertEquals("A FAVOR",votos.clasificarVotos("nombre","A FAVOR",3)),
                ()-> assertEquals("EN CONTRA",votos.clasificarVotos("nombre","EN CONTRA",3)),
                ()-> assertEquals("ABSTENCIÓN",votos.clasificarVotos("nombre","ABSTENCIÓN",3))
        );
    }
    @Test
    @DisplayName("Test que comprueba si los votos de la clase se guardan en las variables estáticas")
    @Tag("unitarias")
    public void testContarVotos(){
        //Votos votos = new Votos();
        votos.clasificarVotos("5 Personas","A FAVOR",5);
        votos.clasificarVotos("3 Personas","EN CONTRA",3);
        votos.clasificarVotos("2 Personas","ABSTENCIÓN",2);

        assertAll(
                () -> assertEquals(5,votos.getVotosAFavor()),
                ()-> assertEquals(3,votos.getVotosEnContra()),
                ()-> assertEquals(2,votos.getVotosAbstencion())
        );
    }
    @Test
    @DisplayName("Test que que comprueba si los nombres de las votaciones se guardan correctamente")
    @Tag("unitarias")
    public void testComprobarNomrbes(){
        //Votos votos = new Votos();
        votos.clasificarVotos("Mampos","A FAVOR",5);
        votos.clasificarVotos("SEFUTBOL","A FAVOR",8);
        votos.clasificarVotos("Familia Picapiedras","EN CONTRA",5);
        votos.clasificarVotos("Rasca y Pica","ABSTENCIÓN",2);
        votos.clasificarVotos("Hola y Hola","ABSTENCIÓN",2);
        votos.clasificarVotos("Elvis","ABSTENCIÓN",2);

        assertAll(
                () -> assertEquals("[Mampos, SEFUTBOL]",votos.getNombresAFavor()),
                ()-> assertEquals("[Familia Picapiedras]",votos.getNombresEnContra()),
                ()-> assertEquals("[Rasca y Pica, Hola y Hola, Elvis]",votos.getNombresAbstencion())
        );
    }
    @Test
    @DisplayName("Se introducen más votos a favor que en contra entonces la propuesta debería de ser aprobada")
    @Tag("integracion")
    public void testResultadoAceptado(){
        //Votos votos = new Votos();
        votos.clasificarVotos("Paquitos","A FAVOR",55);
        votos.clasificarVotos("Rubiales & CO","A FAVOR",8);
        votos.clasificarVotos("Ramiro y Dos Más","EN CONTRA",3);

        assertEquals("La propuesta ha sido aceptada",votos.calcularResultado());
    }
    @Test
    @DisplayName("Se introducen más votos a favor que en contra entonces la propuesta debería de ser rechazada")
    @Tag("integracion")
    public void testResultadoRechazado(){
        //Votos votos = new Votos();
        votos.clasificarVotos("Paco y Sus Amigos","A FAVOR",5);
        votos.clasificarVotos("Mezquita Unida","EN CONTRA",2);
        votos.clasificarVotos("Ramiros","EN CONTRA",3);

        assertEquals("La propuesta ha sido rechazada",votos.calcularResultado());
    }
}
