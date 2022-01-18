/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Producto;
import Modelo.Usuario;
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
public class tramitarPedido extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd;
        ServletContext contex=getServletContext();
        HttpSession sesion=request.getSession();
        
        ArrayList<Producto> listaArticulos= (ArrayList<Producto>) sesion.getAttribute("listaArticulos");
        
        
        
        
        Usuario usuario= (Usuario) sesion.getAttribute("usuario");
        
        double costeTotalPedido=Double.parseDouble(request.getParameter("costeTotalPedido"));
        
        
        boolean confirmado=DAO.DbConnection.tramitarPedido(costeTotalPedido, usuario, listaArticulos);
        
        
        if (confirmado) {
            
            listaArticulos.clear();
            String mensaje="Su pedido se realizo correctamente, gracias por comprar en nuestra tienda.";
            contex.setAttribute("mensaje", mensaje);
            rd=request.getRequestDispatcher("paginaTramitePedido.jsp");
            rd.forward(request, response);
            
            
            
        } else {
            String mensaje="Su pedido no se ha podido realizar correctamente, intentalo mas tarde, perdona las molestias..";
            contex.setAttribute("mensaje", mensaje);
            rd=request.getRequestDispatcher("paginaTramitePedido.jsp");
            rd.forward(request, response);
            
        }
        
        
    }



}
