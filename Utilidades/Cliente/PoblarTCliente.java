import java.io.File;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.sql.Date;
import java.util.Random;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class PoblarTCliente{

    public static void main(String[] args) throws Exception {

        String[] nombres = Files.lines(new File("./fuentes/nombres.txt").toPath()).toArray(String[]::new);
        String[] apellidos = Files.lines(new File("./fuentes/apellidos.txt").toPath()).toArray(String[]::new);
        Thread[] hilos = new Thread[8];
        Proceso[] procesos = new Proceso[8];
        String body = "";

        for(int i = 0; i < 8; i++){
            procesos[i] = new Proceso(nombres.clone(), apellidos.clone(), i);
            hilos[i] = Thread.ofVirtual().start(procesos[i]);
        }

        for(Thread hilo : hilos){
            hilo.join();
        }

        body = IntStream.range(0, 8).mapToObj(i -> procesos[i].getResult()).collect(Collectors.joining("\n"));

        try (PrintWriter out = new PrintWriter("filename.txt")) {
             out.println(body);
        }
    }

   
}

class Proceso implements Runnable{

    private String[] nombres;
    private String[] apellidos;

    private int pID;
    private String result;
    private Random rn;

    public Proceso(String[] nombres, String[] apellidos, int pID){
        this.nombres = nombres;
        this.apellidos = apellidos;
        this.pID = pID;
    }

    @Override
    public void run() {
       rn = new Random(); 
       result = IntStream.range(0, 125000).mapToObj(i -> generarQueryCliente(i)).collect(Collectors.joining("\n")); 
    }

    public String getResult(){
        return result;
    }

    private String generarQueryCliente(int i){
        int nL = nombres.length;
        int aL = apellidos.length;
        Cliente c = new Cliente(nombres[rn.nextInt(nL)], apellidos[rn.nextInt(aL)] + " " + apellidos[rn.nextInt(nombres.length)], pID*125000 + i+1);
        String query = c.toString();
        c = null;
        //System.gc();
        return query;
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

        public Cliente(String nombre, String apellido, int dID){
            this.rn = new Random();
            
            this.nombre = nombre;
            this.apellido = apellido;
            this.fechaDeNacimiento = new Date(rn.nextLong(-1577838006000L, 1136158691000L));
            this.rfc = generarRFC();
            this.telefono = rn.nextLong(1000000000, 9999999999L);

            this.usuario = generarUsuario();
            this.contraseña = generarContraseña();
            this.correo = generarCorreo();

            this.direccion_ID = dID;
        }

        private String generarRFC(){
            String[] dateCUM = fechaDeNacimiento.toString().split("-");
            String nuevoRFC = apellido.substring(0, 2) + apellido.charAt(apellido.indexOf(" ") + 1) + nombre.charAt(0);
            nuevoRFC+= IntStream.range(0, 3).mapToObj(i ->  i == 0 ? dateCUM[i].substring(2)  : dateCUM[i]).collect(Collectors.joining());
            return nuevoRFC.toUpperCase(); 
        }

        private String generarCorreo(){
            String[] extensiones = {"@outlook.com","@gmail.com","@icloud.com","@yandex.com"};
            return rfc  + extensiones[rn.nextInt(extensiones.length)];
        }

        private String generarContraseña(){
            String caracteres = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*()_+";
            int cL = caracteres.length();
            return IntStream.range(0, 9).mapToObj(i -> caracteres.charAt(rn.nextInt(cL)) + "").collect(Collectors.joining(""));
        }

        private String generarUsuario(){
           return nombre.substring(0, 3) + apellido.substring(0, 3) + rn.nextInt(1000,9999);
        }

        public String toStringLegacy(){
            return "INSERT INTO CLIENTE (RFC, nombre, apellido, numeroDeTelefono, correo, fechadeNacimiento, direccion_ID, usuario, contraseña)"
            + " VALUES('" + rfc + "', '" + nombre + "', '" + apellido + "', " + telefono + ", '" + correo + "', '" + fechaDeNacimiento
            + "', " + direccion_ID + ", '" + usuario + "', '" + contraseña + "');";
        }

        @Override
        public String toString(){
            return rfc + ", " + nombre + ", " + apellido + ", " + telefono + ", " + correo + ", " + fechaDeNacimiento
            + ", " + direccion_ID + "," + usuario + ", " + contraseña;
        }

}