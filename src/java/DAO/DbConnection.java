/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import Modelo.Pedido;
import Modelo.PedidoFecha;
import Modelo.Producto;
import Modelo.Usuario;
import Modelo.detalleFactura;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author josea
 */
public class DbConnection {
    
    private static String usuario = "root";
    private static String password = "";
    private static String servidor = "localhost:3306";
    private static String bd = "decatlon";
    
    public static Connection CrearConexion() {

        Connection cn = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://" + servidor + "/" + bd;
            cn = (Connection) DriverManager.getConnection(url, usuario, password);
        } catch (ClassNotFoundException ex) {
            System.out.println("Controlador JDBC no encontrado" + ex.toString());
        } catch (SQLException ex) {
            System.out.println("Otra excepcion" + ex.toString());
        }

        return cn;
    }
    
    public static boolean insertarUsuario(Usuario usuarios) {
        
        Connection cn;
        
        cn=CrearConexion();
        
        String sql="INSERT INTO usuario(usuario_id, usuario_nombre, usuario_apellidos, usuario_tipo, usuario_email, usuario_password, usuario_direccion, usuario_telefono) "
                + "VALUES (?,?,?,?,?,?,?,?)";
        
       try {
           PreparedStatement pst= (PreparedStatement) cn.prepareStatement(sql);
           
           pst.setInt(1, 0);
           pst.setString(2, usuarios.getNombreUsuario());
           pst.setString(3, usuarios.getApellidoUsuario());
           pst.setString(4, usuarios.getTipoUsuario());
           pst.setString(5, usuarios.getEmail());
           pst.setString(6, usuarios.getPass());
           pst.setString(7, usuarios.getDireccion());
           pst.setInt(8, usuarios.getTelefono());
           
           pst.executeUpdate();
           
           return true;
           
       } catch (SQLException ex) {
           return false;
       }
 
    }
    
    public static Usuario consultarUsuario(String email) {
        
        Connection cn;
        
        cn=CrearConexion();
        
        Usuario usuario=null;
        
        String sql="SELECT * FROM usuario WHERE usuario_email='"+email+"'";
        
       try {
           PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
           ResultSet rs=(ResultSet) pst.executeQuery();
           
           rs.next();
           
           usuario=new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
           
           return usuario;
           
       } catch (SQLException ex) {
           return usuario;
       }
        
    }
    
    public static ArrayList<Usuario> consultarUsuario() {
        
        Connection cn;
        
        cn=CrearConexion();
        
        Usuario usuario=null;
        
        ArrayList<Usuario> listadoUsuarios= new ArrayList<>();
        
        String sql="SELECT * FROM usuario where usuario_tipo='Cliente'";
        
       try {
           PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
           ResultSet rs=(ResultSet) pst.executeQuery();
           
           while (rs.next()) {  
               
               usuario=new Usuario(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getInt(8));
               listadoUsuarios.add(usuario);
           }
          
           return listadoUsuarios;
           
       } catch (SQLException ex) {
           return listadoUsuarios;
       }
        
    }
    
    public static ArrayList<Producto> consultarProductos(String categoria) {
        
        Connection cn;
        
        cn=CrearConexion();
        
        ArrayList<Producto> listado= new ArrayList<Producto>();
        
        Producto producto=null;
        
        String sql="SELECT * , (producto_precio-(producto_precio*producto_descuento)) FROM producto WHERE categoria_id='"+categoria+"'";
        
       try {
           PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
           ResultSet rs=(ResultSet) pst.executeQuery();
           
           while (rs.next()) {               
               
           
           
           producto=new Producto(rs.getInt(1),rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7),rs.getDouble(8));
           
           listado.add(producto);
           
           }
           return listado;
           
       } catch (SQLException ex) {
           return listado;
       }
        
    }
    
    public static ArrayList<Producto> consultarProductos() {
        
        Connection cn;
        
        cn=CrearConexion();
        
        ArrayList<Producto> listado= new ArrayList<Producto>();
        
        Producto producto=null;
        
        String sql="SELECT * , (producto_precio-(producto_precio*producto_descuento)) FROM producto ORDER BY producto.producto_nombre ";
        
       try {
           PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
           ResultSet rs=(ResultSet) pst.executeQuery();
           
           while (rs.next()) {               
               
           
           
           producto=new Producto(rs.getInt(1),rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7),rs.getDouble(8));
           
           listado.add(producto);
           
           }
           return listado;
           
       } catch (SQLException ex) {
           return listado;
       }
        
    }
    public static Producto consultarProducto(String idProducto) {
        
        Connection cn;
        
        cn=CrearConexion();
        
        
        
        Producto producto=null;
        
        String sql="SELECT * , (producto_precio-(producto_precio*producto_descuento)) FROM producto WHERE producto_id='"+idProducto+"'";
        
       try {
           PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
           ResultSet rs=(ResultSet) pst.executeQuery();
           
           rs.next();               

           producto=new Producto(rs.getInt(1),rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7),rs.getDouble(8));
           
           
           return producto;
           
       } catch (SQLException ex) {
           return producto;
       }
        
    }

    public static Producto agregarProducto(String producto_id, int cantidad) {
        
        String sql="SELECT *,(producto_precio-(producto_precio*producto_descuento)) FROM producto WHERE producto_id='"+producto_id+"'";
        
        
        
        
         Connection cn;
        
        cn=CrearConexion();
        
        Producto producto=null;
        
         try {
           PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
           ResultSet rs=(ResultSet) pst.executeQuery();
           
           rs.next();               

           producto=new Producto(rs.getInt(1),rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDouble(5), rs.getDouble(6), rs.getString(7), rs.getDouble(8));
           
           producto.setCantidad(cantidad);
           
           
           
           return producto;
           
       } catch (SQLException ex) {
           return producto;
       }
  
    }
    
    
    public static Pedido consultarPedido(int usuarioId){
        
        Pedido pedido=null;
        
        Connection cn;
        
        cn=CrearConexion();
        
        String sql="SELECT * FROM pedido WHERE usuario_id='"+usuarioId+"' ORDER BY pedido_id DESC LIMIT 1";
        
         //sql="Select * from pedido where usuario_id='"+usuarioId+"'";
        
        try {
            PreparedStatement pst= (PreparedStatement) cn.prepareStatement(sql);
            
            ResultSet rs=(ResultSet) pst.executeQuery();
            
            rs.next();
            
            pedido=new Pedido(rs.getInt(1), rs.getDate(2), rs.getInt(3), rs.getInt(4));
            
            
            return pedido;
            
            
            
            
        } catch (SQLException ex) {
            
            return pedido;
            
        }
        
       
       
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    public static boolean tramitarPedido(double costeTotalPedido, Usuario usuario, ArrayList<Producto> listaArticulos){
        
        
        Connection cn;
        
        cn=CrearConexion();
        
        String sql="INSERT INTO pedido(usuario_id, pedido_total) VALUES (?,?)";
        
        
        try {
           PreparedStatement pst= (PreparedStatement) cn.prepareStatement(sql);         
           pst.setInt(1, usuario.getIdUsuario());
           pst.setDouble(2, costeTotalPedido);
          pst.executeUpdate();
           Pedido pedido=consultarPedido(usuario.getIdUsuario());                  
            for (Producto producto : listaArticulos) {
                
                sql="INSERT INTO detallepedido(pedido_id, producto_id, detalle_cantidad) VALUES (?,?,?)";                
           pst= (PreparedStatement) cn.prepareStatement(sql);           
           pst.setInt(1, pedido.getIdPedido());
           pst.setInt(2, producto.getProducto_id());
           pst.setInt(3, producto.getCantidad());                      
           pst.executeUpdate();                               
            }                     
           return true;
           
       } catch (SQLException ex) {
           
           return false;
           
       }      
    }
    
    public static ArrayList<PedidoFecha> listados(String sql){
        
        ArrayList<PedidoFecha> listado = new ArrayList<>();
        
        PedidoFecha pedidos=null;
   
        Connection cn;
        
        cn=CrearConexion();
        
        try {
            PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
            
            ResultSet rs=(ResultSet) pst.executeQuery();
            
            while (rs.next()) {                
                
                pedidos=new PedidoFecha(rs.getInt(1), rs.getDate(2), rs.getString(3), rs.getString(4), rs.getDouble(5));
                
                listado.add(pedidos);
            }
            
            return listado;
            
        } catch (SQLException ex) {
            return listado;
        }
        
        
        
        
    }
    
    public static ArrayList<detalleFactura> listadoFactura(String sql){
        
        ArrayList<detalleFactura> listado = new ArrayList<>();
        
        detalleFactura pedidos=null;
   
        Connection cn;
        
        cn=CrearConexion();
        
        try {
            PreparedStatement pst=(PreparedStatement) cn.prepareStatement(sql);
            
            ResultSet rs=(ResultSet) pst.executeQuery();
            
            while (rs.next()) {                
                
                pedidos=new detalleFactura(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getString(4), rs.getDouble(5), rs.getString(6));
                
                listado.add(pedidos);
            }
            
            return listado;
            
        } catch (SQLException ex) {
            return listado;
        }
        
        
        
        
    }
    
    
}
