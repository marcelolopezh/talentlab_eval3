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
                 <h2>Registrarme <a href="/ingresar">Ingresar</a></h2>
             </div>
             <div class="card-body">
                 <div class='text-danger'>
                     <c:out value="${ error }"></c:out>
                 </div>

                 <form:form action="/usuario/crear" method="post" modelAttribute="usuario" class="form-control">
                     <h4>Ingrese Datos de Usuario</h4>

                     <form:label path="nombre">Nombre:</form:label>
                     <form:input type="text" path="nombre" class="form-control" />
                     <br>

                     <form:label path="apellido">Apellido:</form:label>
                     <form:input type="text" path="apellido" class="form-control" />
                     <br>

                     <form:label path="email">Email:</form:label>
                     <form:input type="text" path="email" class="form-control" />
                     <br>

                     <form:label path="password">Password:</form:label>
                     <form:input type="password" path="password" class="form-control" />
                     <br>

                     <input type="submit" value="Crear Usuario" class="btn btn-success">

                 </form:form>
             </div>
         </div>

     </div>
 </body>

 </html>