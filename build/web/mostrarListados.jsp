<%-- 
    Document   : mostrarListados
    Created on : 05-ene-2022, 17:34:27
    Author     : josea
--%>

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
        
    ArrayList<PedidoFecha> listado= (ArrayList<PedidoFecha>) getServletContext().getAttribute("listado");

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

                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Identificador Pedido</th>
                            <th scope="col">Fecha del Pedido</th>
                            <th scope="col">Nombre Cliente</th>
                            <th scope="col">Apellidos Cliente</th>
                            <th scope="col">Total Factura</th>
                            <th scope="col"></th>
                            
                        </tr>
                    </thead>
                    <tbody>
                        
                        <% 

                        for (PedidoFecha dato : listado) {
                 
                        %>
                        <tr>
                            <td><%= dato.getPedidoId() %></td>
                            <td><%= dato.getPedidoFecha() %></td>
                            <td><%= dato.getUsuarioNombre() %></td>
                            <td><%= dato.getUsuarioApellidos() %></td>
                            <td><%= Math.round(dato.getPedidoTotal()*100.0)/100.0 %> €</td>
                            <td><a class="btn btn-primary" href="mostrarDetalleFactura.jsp?idPedido=<%=dato.getPedidoId()%>">Ver Detalle Factura</a></td>
                            
                        </tr>
                        <%}%>
                    </tbody>
                </table>


            </div>
    </body>
</html>
<%}%>
