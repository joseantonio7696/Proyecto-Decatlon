/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Modelo.PedidoFecha;
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
public class comprobarUsuario extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        RequestDispatcher rd;
        ServletContext contex = getServletContext();

        String email = request.getParameter("email");
        String pass = request.getParameter("pass");

        Usuario usuario = DAO.DbConnection.consultarUsuario(email);

        if (usuario != null) {

            if (usuario.getPass().equals(pass)) {

                HttpSession sesion = request.getSession();

                if (usuario.getTipoUsuario().equals("Cliente")) {
                    
                    ArrayList<Producto> listaArticulos= new ArrayList<Producto>();
                    
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("listaArticulos", listaArticulos);
                    rd = request.getRequestDispatcher("paginaInicioCliente.jsp");
                    rd.forward(request, response);
                } else {
                    
                    ArrayList<PedidoFecha> listado= new ArrayList<>();
                    
                    
                    
                    sesion.setAttribute("usuario", usuario);
                    sesion.setAttribute("listado", listado);
                    rd = request.getRequestDispatcher("paginaInicioAdmin.jsp");
                    rd.forward(request, response);

                }

            } else {
                String mensaje = "Contraseña Incorrecta, intentalo de nuevo";
                contex.setAttribute("error", mensaje);
                rd = request.getRequestDispatcher("error.jsp");
                rd.forward(request, response);

            }

        } else {

            String mensaje = "Correo Incorrecto, intentalo de nuevo";
            contex.setAttribute("error", mensaje);
            rd = request.getRequestDispatcher("error.jsp");
            rd.forward(request, response);

        }

    }

}
