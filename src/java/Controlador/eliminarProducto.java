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
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author josea
 */
public class eliminarProducto extends HttpServlet {

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        RequestDispatcher rd;
        
        
        String idProducto=request.getParameter("idProducto");
        
        
        HttpSession sesion=request.getSession();
        
        
        ArrayList<Producto> listaArticulos= (ArrayList<Producto>) sesion.getAttribute("listaArticulos");
        
        
        Producto producto=DAO.DbConnection.consultarProducto(idProducto);

        listaArticulos.remove(producto);
        
        rd=request.getRequestDispatcher("carritoCompras.jsp");
        rd.forward(request, response);
        
        
        
        
    }


}
