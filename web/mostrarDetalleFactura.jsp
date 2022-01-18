<%-- 
    Document   : mostrarDetalleFactura
    Created on : 12 ene. 2022, 11:11:29
    Author     : Jose Antonio
--%>

<%@page import="Modelo.detalleFactura"%>
<%@page import="Modelo.PedidoFecha"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");

    if (usuario == null) {

        RequestDispatcher rd;
        ServletContext contex = getServletContext();

        rd = contex.getRequestDispatcher("/index.html");
        rd.forward(request, response);

    } else {
        
        
        int idPedido=Integer.parseInt(request.getParameter("idPedido"));
        
        String sql="select DISTINCT producto.producto_id, producto.producto_nombre, detallepedido.detalle_cantidad, categoria.categoria_nombre, (producto.producto_precio-(producto.producto_precio*producto.producto_descuento)), producto.producto_foto FROM pedido, categoria, detallepedido, producto, usuario WHERE pedido.pedido_id='"+idPedido+"' AND pedido.pedido_id=detallepedido.pedido_id AND producto.producto_id=detallepedido.producto_id AND producto.categoria_id=categoria.categoria_id ORDER BY producto.producto_id ";
        
    ArrayList<detalleFactura> listado= DAO.DbConnection.listadoFactura(sql);

%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>INICIO-DECATLON</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="estilos/estilosInicio.css" rel="stylesheet" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #0198f1 ">
            <div class="container-fluid">
                <a class="navbar-brand" href="paginaInicioAdmin.jsp">

                    <img src="imagenes/Decathlon_Logo.png" alt="" width="150" height="50">

                </a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">

                        <li class="nav-item"><a class="nav-link fw-bold"  href="cerrarSesion">Cerrar Sesion</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container">
            <div class="text-center mt-5">

                <table class="table">
                    <thead>
                        <tr>
                            <th scope="col">Identificador Producto</th>
                            <th scope="col">Nombre Producto</th>
                            <th scope="col">Cantidad Producto</th>
                            <th scope="col">Categoria Producto</th>
                            <th scope="col">Precio del Producto</th>
                            <th scope="col">Foto del Producto</th>
                            

                        </tr>
                    </thead>
                    <tbody>
                        
                        <% 

                        for (detalleFactura dato : listado) {
                 
                        %>
                        <tr>
                            <td><%= dato.getProductoId() %></td>
                            <td><%= dato.getNombreProducto() %></td>
                            <td><%= dato.getCantidadProducto()%></td>
                            <td><%= dato.getNombreCategoria() %></td>        
                            <td><%= dato.getPrecio() %> €</td>
                            <td><img src="imagenes/<%= dato.getFotografia()%>" width="70px" height="70px" /></td>

                        </tr>
                        <%}%>
                    </tbody>
                </table>


            </div>
    </body>
</html>
<%}%>
