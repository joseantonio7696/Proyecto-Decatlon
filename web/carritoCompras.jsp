<%-- 
    Document   : carritoCompras
    Created on : 30-dic-2021, 17:37:27
    Author     : josea
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
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
        ArrayList<Producto> listaArticulos = (ArrayList<Producto>) session.getAttribute("listaArticulos");
        String contadorArticulos = String.valueOf(listaArticulos.size());
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
        
        
    </head>
    <body>
        <!-- Responsive navbar-->
        <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #0198f1 ">
            <div class="container-fluid">
                <a class="navbar-brand" href="paginaInicioCliente.jsp">
                    <img src="imagenes/Decathlon_Logo.png" alt="" width="150" height="50">
                </a>                
                <div class="dropdown">
                    <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown">
                        CATEGORIAS
                    </button>
                    <ul class="dropdown-menu">
                        <li><a href="accesorios.jsp" class="list-group-item list-group-item-action">Accesorios para el entreno</a></li>
                        <li><a href="materiales.jsp" class="list-group-item list-group-item-action">Materiales deportivos</a></li>
                        <li><a href="entrenamiento.jsp" class="list-group-item list-group-item-action">Entrenamiento Funcional</a></li>
                        <li><a href="protecciones.jsp" class="list-group-item list-group-item-action">Protecciones deportivas</a></li>
                        <li><a href="singular.jsp" class="list-group-item list-group-item-action ">Singular Wod</a></li>
                    </ul>
                </div>
                <!--<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>-->
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                        <form class="d-flex" action="carritoCompras.jsp">
                            <button class="btn btn-outline-dark" type="submit">
                                <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-cart2" viewBox="0 0 16 16">
                                <path d="M0 2.5A.5.5 0 0 1 .5 2H2a.5.5 0 0 1 .485.379L2.89 4H14.5a.5.5 0 0 1 .485.621l-1.5 6A.5.5 0 0 1 13 11H4a.5.5 0 0 1-.485-.379L1.61 3H.5a.5.5 0 0 1-.5-.5zM3.14 5l1.25 5h8.22l1.25-5H3.14zM5 13a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0zm9-1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm-2 1a2 2 0 1 1 4 0 2 2 0 0 1-4 0z"/>
                                </svg>
                                <span class="badge bg-dark text-white ms-1 rounded-pill"><%= contadorArticulos%></span>
                            </button>
                        </form>
                        <!--                        <li class="nav-item"><a class="nav-link fw-bold " aria-current="page" href="paginaInicioCliente.html">Carrito</a></li>-->
                        <li class="nav-item"><a class="nav-link fw-bold"  href="cerrarSesion">Cerrar Sesion</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <div class="container">
            <div class="text-center mt-5">
                <%
                    if (contadorArticulos.equals("0")) {
                %>
                <h4>Añade articulos a tu carrito en nuestra tienda online</h4>
                <%                    } else {
                %>
                <%
                if (contadorArticulos.equals("1")) {                                           
                %>
                <h4 class="mb-sm-4 mb-3">Tu carrito de la compra contiene <%= contadorArticulos%> producto</h4>
                <%
                } else {
                    %>
                   <h4 class="mb-sm-4 mb-3">Tu carrito de la compra contiene <%= contadorArticulos%> productos</h4> 
                    <%}%>
                <div class="table-responsive">
                    <table class="table text-center">
                        <thead>
                            <tr>
                                <th></th>
                                <th>Producto</th>
                                <th>Precio</th>
                                
                                <th>Cambiar Cantidad</th>
                                <th>Precio Total</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                double costeTotalPedido = 0;
                                for (Producto producto : listaArticulos) {
                                    double precioTotalProducto = producto.getProducto_precio_venta() * producto.getCantidad();
                                    costeTotalPedido += precioTotalProducto;
                            %>
                            <tr >
                                <td ><img src="imagenes/<%= producto.getProducto_foto()%>" width="65px" height="65px"/></td>
                                <td ><%= producto.getProducto_nombre()%></td>
                                <td><%= Math.round(producto.getProducto_precio_venta()*100.0)/100.0%> €</td>
                                
                        <form name="formCantidad" action="cambiarCantidades" method="POST">
                            <input type="text" name="producto" value="<%=producto.getProducto_id()%>"  hidden/>
                           <td><input type="number" min="1" name="cantidadNueva"  size="3" value="<%= producto.getCantidad()%>"/> <button class="btn btn-outline-primary" style="margin-left: 5px" type="submit">Modificar Cantidad <%= producto.getProducto_nombre()%></button></td>
                        </form>
                        <td ><%= Math.round(precioTotalProducto*100.0)/100.0 %> €</td>
                        <td><a class="btn btn-danger" href="eliminarProducto?idProducto=<%=producto.getProducto_id()%>">Eliminar</a></td>
                        </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
                <% if (listaArticulos.size() != 0) {
                %>   
                <p>Su pedido tiene un conste total de <%= Math.round(costeTotalPedido*100.0)/100.0%>€</p>
                <h2>DATOS DEL ENVIO DEL PEDIDO</h2>
                <p>Nombre: <%=usuario.getNombreUsuario()%></p>
                <p>Apellidos: <%=usuario.getApellidoUsuario()%></p>
                <p>Telefono: <%=usuario.getTelefono()%></p>
                <p>Direccion: <%=usuario.getDireccion()%></p>
                <a class="btn btn-success" href="tramitarPedido?costeTotalPedido=<%=costeTotalPedido%>">Tramitar Pedido</a>
                <%} %>                            
            </div>
            <%}%>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
            
    </body>
</html>
<%}%>
