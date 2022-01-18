<%-- 
    Document   : altaUsuario
    Created on : 27-dic-2021, 18:10:16
    Author     : josea
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    </head>
    <body>
        
        <% String mensaje= (String)getServletContext().getAttribute("mensaje"); %>
        
        <div class="container">
            
            <div class="position-absolute top-50 start-50 translate-middle">
               <h1><%=mensaje%></h1>
        
                <a href="index.html" class="btn btn-success">Volver al Inicio</a> 
                
            </div>
        
        </div>
        
    </body>
</html>
