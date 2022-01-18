<%-- 
    Document   : paginaTramitePedido
    Created on : 03-ene-2022, 18:49:47
    Author     : josea
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Modelo.Producto"%>
<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

                <% String mensaje = (String) getServletContext().getAttribute("mensaje");%>

                <h4 class="mb-sm-4 mb-3"><%=mensaje%></h4>

            </div>
        </div>

        <footer class="py-5 fixed-bottom" style="background-color: #0198f1 ">
            <div class="container"><p class="m-0 text-center text-white">JOSE ANTONIO MARQUEZ GONZALEZ</p></div>
        </footer>
    </body>
</html>
<%}%>

