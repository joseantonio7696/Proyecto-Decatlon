/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Producto;
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
 * @author Jose Antonio
 */
public class cambiarCantidades extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd;
        
        HttpSession sesion= request.getSession();
        
        ArrayList<Producto> listado= (ArrayList<Producto>) sesion.getAttribute("listaArticulos");
        
        int cantidadNueva=Integer.parseInt(request.getParameter("cantidadNueva"));
        
        int idProducto=Integer.parseInt(request.getParameter("producto"));
        
        for (Producto producto : listado) {
            
            if (producto.getProducto_id()==idProducto) {
                
                producto.setCantidad(cantidadNueva);
                
            } 
            
        }
        
        rd=request.getRequestDispatcher("carritoCompras.jsp");
        rd.forward(request, response);
        
        
        
    }

 
}
