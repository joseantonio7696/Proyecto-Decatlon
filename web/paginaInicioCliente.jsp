<%-- 
    Document   : paginaInicioCliente
    Created on : 29-dic-2021, 16:30:49
    Author     : josea
--%>

<%@page import="Modelo.Producto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>

<%

    Usuario usuario = (Usuario) session.getAttribute("usuario");
//    Usuario usuario = (Usuario) getServletContext().getAttribute("usuario");

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

        <!-- Header-->
        <header class="py-5" >
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white rounded-pill" style="background-color: #0198f1 ">
                    <h1 class="display-4 fw-bolder">PRODUCTOS MAS POPULARES</h1>
                    <p class="lead fw-normal text-white-50 mb-0">Aqui teneis el Top 10 de nuestros mejores articulos de la tienda online</p>
                </div>
            </div>
        </header>  

        <%

            ArrayList<Producto> listadoAleatorio = DAO.DbConnection.consultarProductos();


        %>

        <section class="py-5">
            <div class="container px-4 px-lg-5 mt-5">

                <div class="row gx-4 gx-lg-5 row-cols-md-3 row-cols-xl-4 justify-content-center">

                    <% ArrayList<Producto> listado = new ArrayList<Producto>();
                        int contador = 0;

                        do {

                            int numeroAleatorio = (int) ((Math.random() * 49) + 1);
                            Producto producto = listadoAleatorio.get(numeroAleatorio);

                            if (!listado.contains(producto)) {
                                listado.add(producto);
                                contador++;
                            }

                        } while (contador < 10);

                        for (int x = 0; x < 10; x++) {

                            Producto productoAleatorio = listado.get(x);
                            
                    %>
                    <div class="col mb-5">
                        <div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="imagenes/<%=productoAleatorio.getProducto_foto()%>" alt="..." />
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                    <!-- Product name-->
                                    <h5 class="fw-bolder"><%= productoAleatorio.getProducto_nombre()%></h5>
                                    <!-- Product price-->
                                    <%
                                        if (productoAleatorio.getProducto_precio()==productoAleatorio.getProducto_precio_venta()) {
                                     %>
                                     <div ><%= productoAleatorio.getProducto_precio()%> €</div>
                                     <%
                                            } else {
                                      %>    
                                      <div class="text-decoration-line-through"><%= productoAleatorio.getProducto_precio()%> €</div>
                                    <%= Math.round(productoAleatorio.getProducto_precio_venta()*100.0)/100.0 %> €
                                    <%
                                            }
                                    %>
                                    
                                </div>
                            </div>
                            <!-- Product actions-->
                            <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                                <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="descripcionProducto.jsp?idProducto=<%= productoAleatorio.getProducto_id()%>">Ver Descripcion</a></div>
                            </div>
                        </div>
                    </div>
                    <%}%>

                </div>
            </div>
        </div>
    </section>  

    <footer class="py-5" style="background-color: #0198f1; margin-top: 30px">
        <div class="container"><p class="m-0 text-center text-white">JOSE ANTONIO MARQUEZ GONZALEZ</p></div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<%}%>
