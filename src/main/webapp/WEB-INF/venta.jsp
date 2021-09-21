<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
      <html>

      <head>

          <meta charset="ISO-8859-1">
          <title>Panel de Ventas</title>
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
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card">
                    <div class="card-header">
                        <h2>Ventas</h2>
                        <div class="text-danger">
                            <c:out value="${error}"></c:out>
                        </div>
                    </div>
                    <div class="card-body">
                        <form:form action="/venta/crear" method="post" modelAttribute="venta" class="form-group">

                            <label for="usuarios">Seleccione el Cliente:</label>

                            <select name="usuario" class="form-control">
<c:forEach var="usuario" items="${lista_usuarios}" >
<option value="<c:out value="${usuario.id}" />"> <c:out value="${usuario.nombre}" /> <c:out value="${usuario.apellido}" /></option>
</c:forEach>
</select>

                               <form:label path="direccion_envio">Dirección Envío:</form:label>
                            <form:input type="text" path="direccion_envio" class="form-control" /><br>
                            <label for="productos">Seleccione Los Productos:</label>
                            <br>
                            <select name="productos" multiple class="form-control">
<c:forEach var="producto" items="${lista_productos}">
<option value="<c:out value="${producto.id}" />"> <c:out value="${producto.nombre}" /> $<c:out value="${producto.precio}" /></option>
</c:forEach>
</select>
                               <br>
                               <input type="submit" value="Generar Venta" class="btn btn-success">
                           </form:form>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <h2>Listado de ventas globales</h2>
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Nombre Cliente</th>
                            <th>Dirección envío</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="venta" items="${lista_ventas}">
                            <tr>
                                <td>
                                    <c:out value="${venta.id}" />
                                </td>
                                <td>
                                    <c:out value="${venta.usuario.nombre}  ${venta.usuario.apellido}" />
                                </td>
                                <td>
                                    <c:out value="${venta.direccion_envio}" />
                                </td>
                                <td>
                                    <form action="/venta/eliminar/${venta.id}" method="POST">
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
</body>

</html>