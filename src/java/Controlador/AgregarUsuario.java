/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author josea
 */
public class AgregarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        ServletContext contex=getServletContext();
        RequestDispatcher rd;
        
        String nombre=request.getParameter("nombre");
        String apellidos=request.getParameter("apellidos");
        String direccion=request.getParameter("direccion");
        int telefono=Integer.parseInt(request.getParameter("telefono"));
        String email=request.getParameter("email");
        String pass=request.getParameter("pass");
        
        Usuario usuario=DAO.DbConnection.consultarUsuario(email);
        
        if (usuario==null) {
            
            usuario=new Usuario(nombre, apellidos, email, pass, direccion, telefono);
            
            boolean agregado=DAO.DbConnection.insertarUsuario(usuario);
            
            if (agregado) {
                String mensaje="El usuario se creo correctamente";
            contex.setAttribute("mensaje", mensaje);
            rd=request.getRequestDispatcher("altaUsuario.jsp");
            rd.forward(request, response);
            } else {
                String error="El usuario no se pudo agregar correctamente";
            contex.setAttribute("error", error);
            rd=request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
                
            }
  
        } else {
            
            String error="El usuario ya existe en la base de datos, elije otro correo por favor";
            contex.setAttribute("error", error);
            rd=request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);
        }
        
        
        
        
        
        
      
    }


}
