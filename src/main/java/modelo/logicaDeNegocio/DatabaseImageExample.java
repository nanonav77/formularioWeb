package modelo.logicaDeNegocio;

import java.io.*;
import java.sql.*;
 
public class DatabaseImageExample {
    public static void fotino(){
        try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/micitt","root","pepe1196");
            
            File file=new File("resources/images/image1.jpg");
            FileOutputStream fos=new FileOutputStream(file);
            byte b[];
            Blob blob;
            
            PreparedStatement ps=con.prepareStatement("select foto from micitt.cientifico where cedula=304900948"); 
            ResultSet rs=ps.executeQuery();
            
            while(rs.next()){
                blob=rs.getBlob("foto");
                b=blob.getBytes(1,(int)blob.length());
                fos.write(b);
            }
            
            ps.close();
            fos.close();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
