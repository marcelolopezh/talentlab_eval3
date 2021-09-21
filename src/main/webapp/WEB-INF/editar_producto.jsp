<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
      <html>

      <head>
          <meta charset="ISO-8859-1">
          <title>Editar Producto</title>
          <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">

      </head>

      <body>
          <nav class="navbar navbar-expand-lg navbar-light bg-light">
              <div class="container-fluid">
                  <a class="navbar-brand" href="#">Bienvenidos</a>
                  <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
 </button>
                  <div class="collapse navbar-collapse" id="navbarSupportedContent">
                      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                          <li class="nav-item">
                              <a class="nav-link" href="/producto">Productos</a>
                          </li>
                          <li class="nav-item">
                              <a class="nav-link" href="/venta">Ventas</a>
                          </li>
                      </ul>
                      <form class="d-flex" action="/logout">
                    <button class="btn btn-outline-success" type="submit">Salir</button>
                </form>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="card">
            <div class="card-header">
                <h2>Editar Producto</h2>
                <div class="text-danger">
                    <c:out value="${error}"></c:out>
                </div>
            </div>
            <div class="card-body">

            </div>
        </div>


        <form:form action="/producto/modificar" method="post" modelAttribute="producto" class="form-group">
            <input type="hidden" name="_method" value="put">
            <form:hidden path="id" />

            <form:label path="nombre">Nombre:</form:label>
            <form:input type="text" path="nombre" class="form-control" />

            <form:label path="precio">Precio:</form:label>
            <form:input type="text" path="precio" class="form-control" />

            <form:label path="caracteristica">Caracteristica:</form:label>
            <form:input type="text" path="caracteristica" class="form-control" />

            <form:label path="stock">Stock:</form:label>
            <form:input type="text" path="stock" class="form-control" />


            <input type="submit" value="Modificar" class="btn btn-info" />
        </form:form>

    </div>
</body>

</html>