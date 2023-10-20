import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.Date;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class PoblarTCliente{

    private static String[] nombres;
    private static String[] apellidos;
    private static Random rn;

    public static void main(String[] args) throws Exception {
        
        rn = new Random();
        nombres = Files.lines(new File("./fuentes/nombres.txt").toPath()).toArray(String[]::new);
        apellidos = Files.lines(new File("./fuentes/apellidos.txt").toPath()).toArray(String[]::new);

        String res = IntStream.range(0, 5).mapToObj(PoblarTCliente::generarQueryCliente).collect(Collectors.joining("\n"));

        try (PrintWriter out = new PrintWriter("filename.txt")) {
             out.println(res);
        }

    }

    private static String generarQueryCliente(int i){
        return new Cliente(nombres[rn.nextInt(nombres.length)], apellidos[rn.nextInt(nombres.length)] + " " + apellidos[rn.nextInt(nombres.length)]).toString();
    }
}

class Cliente{

        private String rfc;
        private String nombre;
        private String apellido;
        private long telefono;
        private String correo;
        private Date fechaDeNacimiento;
        private int direccion_ID;
        private String usuario;
        private String contraseña;

        private Random rn;

        //Solo para pruebas
        public Cliente(){
            rfc = "AQC030324";
            nombre = "Alejandro";
            apellido = "Quiroz Carmona";
            telefono = 9999999999L ;
            correo = "andresmanuel@horsefucker.org";
            fechaDeNacimiento = new Date(-1577838006000L);
            direccion_ID = 1;
            usuario = "aquirozc";
            contraseña = "cruzazul";
        }

        public Cliente(String nombre, String apellido){
            this.rn = new Random();
            
            this.nombre = nombre;
            this.apellido = apellido;
            this.fechaDeNacimiento = new Date(rn.nextLong(-1577838006000L, 1136158691000L));
            this.rfc = generarRFC();
            this.telefono = rn.nextLong(1000000000, 9999999999L);

            this.usuario = "admin";
            this.contraseña = "pass";
            this.correo = generarCorreo();

            this.direccion_ID = 1;
        }

        private String generarRFC(){
            String[] dateCUM = fechaDeNacimiento.toString().split("-");
            String rfc = apellido.substring(0, 2) + apellido.charAt(apellido.indexOf(" ") + 1) + nombre.charAt(0);
            rfc += IntStream.range(0, 3).mapToObj(i ->  i == 0 ? dateCUM[i].substring(2)  : dateCUM[i]).collect(Collectors.joining());
            return rfc.toUpperCase(); 
        }

        private String generarCorreo(){
            return rfc + "@" + ProvedoresDeCorreo.values()[rn.nextInt(ProvedoresDeCorreo.values().length)].ext;
        }


        @Override
        public String toString(){
            return "INSERT INTO Persona (RFC, nombre, apellido, numeroDeTelefono, correo, fechadeNacimiento, direccion_ID, usuario, contraseña)"
            + " VALUES('" + rfc + "', '" + nombre + "', '" + apellido + "', " + telefono + ", '" + correo + "', '" + fechaDeNacimiento
            + "', " + direccion_ID + ", '" + usuario + "', '" + contraseña + "');";
        }

        private enum ProvedoresDeCorreo{

            PERSONAL_EXCHANGE("outlook.com"),
            GMS("gmail.com"),
            YAHOO("yahoo.com"),
            APPLE("icloud.com");
            
            final String ext;
            ProvedoresDeCorreo(String ext){
                this.ext = ext;
            }
        }

}