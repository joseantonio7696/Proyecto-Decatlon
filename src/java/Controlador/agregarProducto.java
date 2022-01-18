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
public class agregarProducto extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession sesion = request.getSession();

        RequestDispatcher rd;

        ArrayList<Producto> listaArticulos = (ArrayList<Producto>) sesion.getAttribute("listaArticulos");

        Producto producto;

        String producto_id = request.getParameter("idProducto");

        int cantidad = Integer.parseInt(request.getParameter("cantidad"));

        producto = DAO.DbConnection.consultarProducto(producto_id);

        if (listaArticulos.contains(producto)) {

            for (Producto articulo : listaArticulos) {

                if (producto.equals(articulo)) {

                    int cantidadAntigua = articulo.getCantidad();

                    int cantidadNueva = cantidad + cantidadAntigua;

                    articulo.setCantidad(cantidadNueva);

                }

            }

        } else {
            producto = DAO.DbConnection.agregarProducto(producto_id, cantidad);
            listaArticulos.add(producto);
        }


        rd = request.getRequestDispatcher("descripcionProducto.jsp");
        rd.forward(request, response);

    }
    

}
