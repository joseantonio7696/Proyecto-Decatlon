/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.PedidoFecha;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author josea
 */
public class listadoPedidos extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String opcion= request.getParameter("opcion");
        RequestDispatcher rd;
        
        ServletContext contex= request.getServletContext();
        
        
        ArrayList<PedidoFecha> listado= new ArrayList<>();
        
        String sql="";
        
        
        
       switch (opcion){
           
           case "fechas":
               
               
               String fechaOrigen=request.getParameter("fechaInicial");
               String fechaFinal=request.getParameter("fechaFinal");
               
               sql="SELECT DISTINCT pedido.pedido_id, pedido.pedido_fecha, usuario.usuario_nombre, usuario.usuario_apellidos, pedido.pedido_total FROM pedido, detallepedido, usuario, producto WHERE ( pedido.pedido_fecha >= '"+fechaOrigen+"' AND pedido.pedido_fecha <= '"+fechaFinal+"' ) AND pedido.pedido_id = detallepedido.pedido_id AND pedido.usuario_id = usuario.usuario_id AND producto.producto_id = detallepedido.producto_id ORDER BY pedido.pedido_id";
               
               listado=DAO.DbConnection.listados(sql);
               
               contex.setAttribute("listado", listado);
               
               
               
                   break;
                   
           case "cliente":
               
               String clienteId=request.getParameter("idCliente");
               
               sql="SELECT DISTINCT pedido.pedido_id, pedido.pedido_fecha, usuario.usuario_nombre, usuario.usuario_apellidos, pedido.pedido_total FROM pedido, detallepedido, usuario, producto WHERE usuario.usuario_id='"+clienteId+"' AND pedido.pedido_id = detallepedido.pedido_id AND pedido.usuario_id = usuario.usuario_id AND producto.producto_id = detallepedido.producto_id ORDER BY pedido.pedido_id";
               
               listado=DAO.DbConnection.listados(sql);
               
               contex.setAttribute("listado", listado);
               
               break;
           
               
           case "producto":
               
               String productoId=request.getParameter("idProducto");
               
               sql="SELECT DISTINCT pedido.pedido_id, pedido.pedido_fecha, usuario.usuario_nombre, usuario.usuario_apellidos, pedido.pedido_total FROM pedido, detallepedido, usuario, producto WHERE producto.producto_id='"+productoId+"' AND pedido.pedido_id = detallepedido.pedido_id AND pedido.usuario_id = usuario.usuario_id AND producto.producto_id = detallepedido.producto_id ORDER BY pedido.pedido_id";
               
               listado=DAO.DbConnection.listados(sql);
               
               contex.setAttribute("listado", listado);
               
               
               break;
           
           
           
           
       }
       
       
       rd=request.getRequestDispatcher("mostrarListados.jsp");
       rd.forward(request, response);
        
        
    }


}
