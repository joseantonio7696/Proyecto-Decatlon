<%-- 
    Document   : paginaInicioAdmin
    Created on : 05-ene-2022, 15:53:58
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

                <h2>Bienvenido Señor <%=usuario.getNombreUsuario()%>, aqui podra ver los listado de pedidos con las diferentes formas que le ofrecemos.</h2>

                <div class="accordion accordion-flush mt-5" id="accordionFlushExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingOne">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne" aria-expanded="false" aria-controls="flush-collapseOne">
                                Listado de Pedidos entre dos fechas
                            </button>
                        </h2>
                        <div id="flush-collapseOne" class="accordion-collapse collapse" aria-labelledby="flush-headingOne" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">
                                <form action="listadoPedidos" method="POST">
                                    <div class="mb-3">
                                        <label for="fechaInicial" class="form-label">Fecha Inicial</label>
                                        <input type="date" class="form-control" name="fechaInicial">
                                    </div>
                                    <div class="mb-3">
                                        <label for="fechaFinal" class="form-label">Fecha Final</label>
                                        <input type="date" class="form-control" name="fechaFinal">
                                    </div>
                                    <input type="text" name="opcion" value="fechas" hidden/>
                                    <button type="submit" class="btn btn-primary">Mostrar Listado</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseTwo" aria-expanded="false" aria-controls="flush-collapseTwo">
                                Listado de Pedidos de un Cliente
                            </button>
                        </h2>
                        <div id="flush-collapseTwo" class="accordion-collapse collapse" aria-labelledby="flush-headingTwo" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">

                                <% ArrayList<Usuario> listaUsuarios = DAO.DbConnection.consultarUsuario(); %>

                                <form action="listadoPedidos" method="POST">
                                    <div class="mb-3">
                                        <label for="cliente" class="form-label">Seleccione el Cliente</label>
                                        <select class="form-select" name="idCliente" aria-label="Default select example">
                                            <%
                                                for (Usuario cliente : listaUsuarios) {
                                            %>
                                            <option value="<%= cliente.getIdUsuario()%>"><%= cliente.getNombreUsuario()%> <%= cliente.getApellidoUsuario()%></option> 
                                            <%}%>
                                        </select>
                                    </div>
                                    <input type="text" name="opcion" value="cliente" hidden/>
                                    <button type="submit" class="btn btn-primary">Mostrar Listado</button>
                                </form>

                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="flush-headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseThree" aria-expanded="false" aria-controls="flush-collapseThree">
                                Listado de Pedidos de un Producto
                            </button>
                        </h2>
                        <div id="flush-collapseThree" class="accordion-collapse collapse" aria-labelledby="flush-headingThree" data-bs-parent="#accordionFlushExample">
                            <div class="accordion-body">


                                <%

                                    ArrayList<Producto> listaProductos = DAO.DbConnection.consultarProductos();

                                %>

                                <form action="listadoPedidos" method="POST">
                                    <div class="mb-3">
                                        <label for="cliente" class="form-label">Seleccione el Producto</label>
                                        <select class="form-select" name="idProducto" aria-label="Default select example">
                                            <%                                                for (Producto producto : listaProductos) {
                                            %>
                                            <option value="<%= producto.getProducto_id()%>"><%= producto.getProducto_nombre()%></option> 
                                            <%}%>
                                        </select>
                                    </div>
                                    <input type="text" name="opcion" value="producto" hidden/>
                                    <button type="submit" class="btn btn-primary">Mostrar Listado</button>
                                </form>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
    </body>
</html>
<%}%>