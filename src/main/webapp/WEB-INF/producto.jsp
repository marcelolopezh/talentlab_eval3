<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
      <html>

      <head>

          <meta charset="ISO-8859-1">
          <title>Panel de Productos</title>
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
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h2>Agregar Productos</h2>
                        <div class="text-danger">
                            <c:out value="${error}"></c:out>
                        </div>
                    </div>
                    <div class="card-body">

                        <form:form action="/producto/crear" method="post" modelAttribute="producto" class="form-group">
                            <form:label path="nombre">Nombre:</form:label>
                            <form:input type="text" path="nombre" class="form-control" /><br>

                            <form:label path="precio">Precio:</form:label>
                            <form:input type="text" path="precio" class="form-control" /><br>

                            <form:label path="caracteristica">Caracteristica:</form:label>
                            <form:input type="text" path="caracteristica" class="form-control" /><br>

                            <form:label path="stock">Stock:</form:label>
                            <form:input type="text" path="stock" class="form-control" /><br>


                            <input type="submit" value="Crear Producto" class="btn btn-success">
                        </form:form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header">
                        <h2>Lista de Productos</h2>
                    </div>
                    <div class="card-body">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Nombre</th>
                                    <th>Precio</th>
                                    <th>Caracteristica</th>
                                    <th>Stock</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="producto" items="${lista_productos}">

                                    <tr>
                                        <td>
                                            <c:out value="${producto.id}" />
                                        </td>
                                        <td>
                                            <c:out value="${producto.nombre}" />
                                        </td>
                                        <td>
                                            <c:out value="${producto.precio}" />
                                        </td>
                                        <td>
                                            <c:out value="${producto.caracteristica}" />
                                        </td>
                                        <td>
                                            <c:out value="${producto.stock}" />
                                        </td>


                                        <td> <a href="/producto/actualizar/${producto.id}"><button class="btn btn-info">Editar</button></a>
                                            <form action="/producto/eliminar/${producto.id}" method="POST">
                                                <input type="hidden" name="_method" value="delete">
                                                <input type="submit" value="Eliminar" class="btn btn-danger">
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </div>






</body>

</html>