<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

    
    
 <jsp:include page="/assets/html/header.jsp"></jsp:include>
 
 
 	<!-- Inicio Main -->
	<main>
		<!-- Seccion Form -->
			<section >
				<br/>
				<div class="container ">
					<div class="col-12">
						<a class="btn btn-primary" role="button" id="btnAgregarR">Agregar Registro
							<i class="bi bi-file-earmark-plus"></i>
						</a>
					</div>
						
					<div id="seccionForm" >
						<form class="row g-3" id="form1" method="post" action="${pageContext.request.contextPath}/ProveedoresDetails"  >
							<h2>Formulario de Registro de Proveedores</h2>
							<hr/>
						
						
							<input type="hidden" id="id" name="id" value= "">
							
							<div class="col-md-3">
								<label for="inputRut" class="form-label">Rut :</label> <input
									type="text" class="form-control" id="rut" name="rut" required>
							</div>
							<div class="col-md-4">
								<label for="inputid" class="form-label">Nombre Proveedor:</label> 
								<input type="text" class="form-control" id="nombre" name="nombre" required>
							</div>
							<div class="col-5">
								<label for="inputAddress" class="form-label">Dirección :</label> <input
									type="text" class="form-control" id="direccion" name="direccion" required>
							</div>
							<div class="col-3">
								<label for="inputEmail" class="form-label">Correo :</label> <input
									type="email" class="form-control" id="correo" name="correo" required>
							</div>
							<div class="col-md-3">
								<label for="inputTelefono" class="form-label">Telefono :</label> <input
									type="tel" class="form-control" id="telefono" name="telefono" pattern="[0-9]{9}" placeholder="Ej 999999999" required>
							</div>
							
							<div class="col-md-3">
								<label for="inputContacto" class="form-label">Nombre de contacto :</label> <input
									type="text" class="form-control" id="contacto" name="contacto" required>
							</div>
							<div class="col-md-3">
								<label for="inputTelefono2" class="form-label">Telefono de Contacto :</label> <input
									type="tel" class="form-control" id="telContacto" name="telContacto" pattern="[0-9]{9}" placeholder="Ej 999999999" required>
							</div>
								
							<hr/>		
								<div class="col-12">
									<button type="submit" class="btn btn-primary">Agregar Registro</button>
									<button type="button" class="btn btn-danger" id="btnCancela"   >Cancelar</button>
								</div>
							<hr/>
						</form>
					</div>
					
				</div>
			</section>	
			<!-- Fin Seccion Form -->
			<!-- Seccion DataTable -->
			<section id="seccionTabla">
				<div class="container">
					<div>
					<br/>
						<table class="table" id="tblProveedores">
							<thead>
						    	<tr>
						      		<th  >Id</th>
						      		<th  >Nombre Proveedor</th>
						      		<th  >Rut</th>
						      		<th  >Direccion</th>
						      		<th  >Correo</th>
						      		<th  >Telefono</th>
						      		<th  >Nombre de Contacto</th>
						      		<th  >Telefono de Contacto</th>
						      	</tr>
							</thead>
							<tbody>
								<c:forEach var="a" items="${proveedores}">
									<tr>
										<td >
											<c:out value="${a.getId()}"></c:out>
										</td>
										<td >
											<c:out value="${a.getNombre()}"></c:out>
										</td>
										<td >
											<c:out value="${a.getRut()}"></c:out>
										</td>
										<td >
											<c:out value="${a.getDireccion()}"></c:out>
										</td>
										<td >
											<c:out value="${a.getCorreo()}"></c:out>
										</td>
										<td >
											<c:out value="${a.getTelefono()}"></c:out>
										</td>
										<td >
											<c:out value="${a.getContacto()}"></c:out>
										</td>
										<td >
											<c:out value="${a.getTelefonoContacto()}"></c:out>
										</td>
										 
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<!-- Fin DataTable -->
	</main>
	<!-- Fin Main -->
 
 
  
 <jsp:include page="/assets/html/footer.jsp"></jsp:include>
 
<script>
  
  //Funcion para ejecutar datatable
	$(document).ready( function () {
		$('#tblProveedores').DataTable();
	} );
 //funcion para ocultar formulario de registro data table segun opciones de ingresar  	
	$(function (){
		let form = $('#seccionForm');
		let btnAgr = $('#btnAgregarR')
		let tabla = $('#seccionTabla')
		form.hide();
		let ocultar = true;
		
		$(btnAgr).click(function(){
			if (ocultar){
				tabla.hide();
				form.show();
				btnAgr.hide();
				ocultar = false;
			}else {
				form.hide();
				ocultar = true;
			}
		});
		
		$(btnCancela).click(function(){
			document.getElementById("form1").reset();
			if (ocultar){
				//form.hide();	
				ocultar = false;
			}else {
				tabla.show();
				btnAgr.show();
				form.hide();
				ocultar = true;
			}
		});
	});		
</script>
 
 
 