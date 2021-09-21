<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 <!DOCTYPE html>
 <html>

 <head>
     <meta charset="ISO-8859-1">
     <title>TIENDA VIRTUAL</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
 </head>

 <body>
     <div class="container">
         <div class="card col-md-4">
             <div class="card-header">
                 <h2>Iniciar Sesión - <a href="/registrar">Registrar</a></h2>
             </div>
             <div class="card-body">
                 <div class='text-danger'>
                     <c:out value="${ error }"></c:out>
                 </div>
                 <form action="/ingreso" method="post" class="form-group">

                     <h4>Ingrese Datos de Usuario</h4>
                     <label for="email"><b>Email:</b></label>
                     <input type="email" placeholder="Ingrese email" name="email" required class="form-control">
                     <br>

                     <label for="password"><b>Contraseña:</b></label>
                     <input type="password" placeholder="Ingrese contraseña" name="password" required class="form-control"> <br />
                     <br>
                     <input type="submit" class="btn btn-success" value="Iniciar Sesión">

                 </form>
             </div>
         </div>
     </div>
 </body>

 </html>