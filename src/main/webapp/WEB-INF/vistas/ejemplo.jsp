<jsp:include page="intranetValida.jsp" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jstl/fmt_rt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>
<title>Mantenimiento Usuario - Caleb luna </title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%">
<h3>Crud de Usuario</h3>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudUsuario">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudUsuario" class="simple_form" id="defaultForm2"  method="post">
					<div class="row">
						<div class="col-md-3">	
							<div class="form-group">
							  	<label class="control-label" for="id_nonbre_filtro">NOMBRE</label>
							  	<input class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
							</div>
						</div>
					</div>			
					<div class="row">
						<div class="col-md-3">
							<button type="submit" class="btn btn-primary" id="validateBtnw1" >FILTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-3">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" >REGISTRA</button><br>&nbsp;<br>
						</div>
						<div class="col-md-4">
							<c:if test="${sessionScope.MENSAJE != null }">
									<div class="alert alert-success" id="success-alert">
							 		   <button type="button" class="close" data-dismiss="alert">x</button>
										${sessionScope.MENSAJE}				
									</div>
							</c:if>
							<c:remove var="MENSAJE"/>
						</div>
					</div>
					<div class="row" > 
						<div class="col-md-12">
								<div class="content" >
						
									<table id="tableAlumno" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Apellido Paterno</th>
												<th>Apellido Materno</th>
												<th>Fecha Nac.</th>
												<th>Fecha Reg.</th>
												<th>Email</th>
												<th>Estado</th>
												<th>Celular</th>
												<th>Direccion</th>
												<th>Login</th>
												<th>Password</th>
												<th>Dni</th>
												<th>TipoUsuario</th>
												<th>Ubigeo</th>
												<th>Actualiza </th>
												<th>Elimina </th>
											</tr>
										</thead>
										<tbody>
												    
												<c:forEach items="${usuarios}" var="x">
													<tr>
														<td>${x.idUsuario}</td>
														<td>${x.nombres}</td>
														<td>${x.apaterno}</td>
														<td>${x.amaterno}</td>
														<td><fmt:formatDate value="${x.fechaNacimiento}" pattern="yyyy-MM-dd"/></td>
														<td>${x.fechaRegistro}</td>
														<td>${x.email}</td>
														<td>${x.estado}</td>
														<td>${x.celular}</td>
														<td>${x.direccion}</td>
														<td>${x.login}</td>
														<td>${x.password}</td>
														<td>${x.dni}</td>
														<td>${x.tipoUsuario.nombre}</td>
														<td>${x.ubigeo.departamento}</td>
														
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idUsuario}','${x.nombres}','${x.apaterno}','${x.amaterno}','<fmt:formatDate value="${x.fechaNacimiento}" pattern="yyyy-MM-dd"/>',
															                                 '${x.fechaRegistro}','${x.email}','${x.estado}','${x.celular}','${x.direccion}','${x.login}','${x.password}','${x.dni}','${x.tipoUsuario.idTipoUsuario}','${x.ubigeo.departamento}',
															                                  '${x.ubigeo.provincia}','${x.ubigeo.idUbigeo}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idUsuario}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='images/delete.gif' width='auto' height='auto' />
															</button>
														</td>
													</tr>
												</c:forEach>
										</tbody>
										</table>	
									
								</div>	
						</div>
					</div>
		 		</form>
		  </div>
  
  	 <div class="modal fade" id="idModalRegistra" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaCrudUsuario" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Usuario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombres" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_apaterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_apaterno" name="apaterno" placeholder="Ingrese el Apellido Paterno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_amaterno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_amaterno" name="amaterno" placeholder="Ingrese el Apellido Materno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_fecha">Fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_fecha" name="fechaNacimiento" placeholder="Ingrese la fecha de nacimiento" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_email">Email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_email" name="email" placeholder="Ingrese el email" type="text" maxlength="30"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_estado">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_estado" name="estado" placeholder="Ingrese el estado" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_celular">Celular</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_celular" name="celular" placeholder="Ingrese el celular" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_direccion">Direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_direccion" name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="100"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_login">Login</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_login" name="login" placeholder="Ingrese el login" type="text" maxlength="15"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_password">Password</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_password" name="password" placeholder="Ingrese el password" type="text" maxlength="15"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese el dni" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_tipo">Tipo Usuario</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_tipo" name="tipoUsuario.idTipoUsuario" class='form-control'>
													   <option value=" ">[Seleccione Tipo]</option>
													   
													</select>
		                                        </div>
		                                    </div>
		                                   
		                                     <div  class="form-group">
				                                 <label class="col-lg-3 control-label" for="id_departamento">Departamento</label>
				                                 <div class="col-lg-5">
				                                 <select id="id_departamento" name="ubigeo.departamento" class='form-control'>
					                               <option value=" ">[Seleccione Departamento]</option>    
				                                 </select>
				                                 </div>
		                                    </div>
		                              	    <div class="form-group">
				                                  <label class="col-lg-3 control-label" for="id_provincia">Provincia</label>
				                                  <div class="col-lg-5">
				                                  <select id="id_provincia" name="ubigeo.provincia" class='form-control'>
					                                <option value=" ">[Seleccione Provincia]</option>    
				                                  </select>
				                                  </div>
		                                     </div>
		                                     <div class="form-group">
				                                  <label class="col-lg-3 control-label" for="id_distrito">Distrito</label>
				                                  <div class="col-lg-5">
				                                  <select id="id_distrito" name="ubigeo.idUbigeo" class='form-control'>
					                                <option value=" ">[Seleccione Distrito]</option>    
				                                  </select>
				                                  </div>
		                                    </div>
		                                  
		                                    
		                                     
		                                    <div class="form-group">
		                                        <div class="col-lg-5 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
  
		 <div class="modal fade" id="idModalActualiza" >
			<div class="modal-dialog" style="width: 60%">
		
				<!-- Modal content-->
				<div class="modal-content">
				<div class="modal-header" style="padding: 35px 50px">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Usuario</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudAlumno" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Usuario</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idUsuario" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_apaterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_apaterno" name="apaterno" placeholder="Ingrese el Apellido Paterno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_amaterno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_amaterno" name="amaterno" placeholder="Ingrese el Apellido Materno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_fecha">Fecha Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_fecha" name="fechaNacimiento" placeholder="Ingrese la fecha de nacimiento" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_email">Email</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_email" name="email" placeholder="Ingrese el email" type="text" maxlength="30"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_estado">Estado</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_estado" name="estado" placeholder="Ingrese el estado" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_celular">Celular</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_celular" name="celular" placeholder="Ingrese el celular" type="text" maxlength="9"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_direccion">Direccion</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_direccion" name="direccion" placeholder="Ingrese la direccion" type="text" maxlength="30"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_login">Login</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_login" name="login" placeholder="Ingrese el login" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_password">Password</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_password" name="password" placeholder="Ingrese el password" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_dni">DNI</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_dni" name="dni" placeholder="Ingrese el dni" type="text" maxlength="10"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_tipo">Tipo Usuario</label>
		                                        <div class="col-lg-5">
													<select id="id_act_tipo" name="tipoUsuario.idTipoUsuario" class='form-control'>
													   <option value=" ">[Seleccione Tipo]</option>
													   
													</select>
		                                        </div>
		                                    </div>
		                                   
		                                     <div  class="form-group">
				                                 <label class="col-lg-3 control-label" for="id_act_departamento">Departamento</label>
				                                 <div class="col-lg-5">
				                                 <select id="id_act_departamento" name="ubigeo.departamento" class='form-control'>
					                               <option value=" ">[Seleccione Departamento]</option>    
				                                 </select>
				                                 </div>
		                                    </div>
		                              	    <div class="form-group">
				                                  <label class="col-lg-3 control-label" for="id_act_provincia">Provincia</label>
				                                  <div class="col-lg-5">
				                                  <select id="id_act_provincia" name="ubigeo.provincia" class='form-control'>
					                                <option value=" ">[Seleccione Provincia]</option>    
				                                  </select>
				                                  </div>
		                                     </div>
		                                     <div class="form-group">
				                                  <label class="col-lg-3 control-label" for="id_act_distrito">Distrito</label>
				                                  <div class="col-lg-5">
				                                  <select id="id_act_distrito" name="ubigeo.idUbigeo" class='form-control'>
					                                <option value=" ">[Seleccione Distrito]</option>    
				                                  </select>
				                                  </div>
		                                    </div>
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">ACTUALIZA</button>
		                                        </div>
		                                    </div>
		                                </div>
		                            </div>
		                        </div>
		                        
		                    </div>
		                </form>   
				
				</div>
			</div>
		</div>
			
		</div>
		
		<div class="modal fade" id="idModalElimina" >
					<div class="modal-dialog" style="width: 60%">
				 	
				 	<!-- Modal content-->
					<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar Usuario</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>

</div>

<script type="text/javascript">

$("#idBtnElimina").click(function(){
	$("#idFormElimina").submit();
});

function eliminar(id){	
	$('input[id=id_elimina]').val(id);
	$('#idFormElimina').submit();
}

function registrar(){	
	$('#idModalRegistra').modal("show");
}

function editar(id,nombre,apaterno,amaterno,fechaNacimiento,fechaRegistro,email,estado,celular,direccion,login,password,dni,idTipoUsuario,departamento,
		         provincia,idUbigeo){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_apaterno]').val(apaterno);
	$('input[id=id_act_amaterno]').val(amaterno);
	$('input[id=id_act_fecha]').val(fechaNacimiento);
	$('input[id=id_act_email]').val(email);
	$('input[id=id_act_estado]').val(estado);
	$('input[id=id_act_celular]').val(celular);
	$('input[id=id_act_direccion]').val(direccion);
	$('input[id=id_act_login]').val(login);
	$('input[id=id_act_password]').val(password);
	$('input[id=id_act_dni]').val(dni);
	$('select[id=id_act_tipo]').val(idTipoUsuario);
	$('select[id=id_act_departamento]').val(departamento);
	$('select[id=id_act_provincia]').val(provincia);
	$('select[id=id_act_distrito]').val(idUbigeo);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumno').DataTable();
} );
</script>

<script type="text/javascript">
   
	$.getJSON("listaDepartamentoss",{},function(data){
		console.log(data);
		$.each(data,function(i, obj){
			$("#id_departamento").append("<option value='" + obj+ "'>"+obj+"</option>");
			
		});
	});

	$('#id_departamento').change(function() {
		//limpio el combo provincia
		$("#id_provincia").empty();
		$("#id_distrito").empty();
		
		
		//Se agrega la primera opcion
		$("#id_provincia").append("<option value=' ' >[Seleccione Provincia]</option>");
		$("#id_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
		
		
		//agrego las provincias
		var dep = $('#id_departamento').val();
		
		$.getJSON("listaProvinciass",{"departamento":dep},function(data){
			$.each(data,function(i, obj){
				$("#id_provincia").append("<option value='" + obj+ "'>"+obj+"</option>");
				
			});
		});
	});
	
	$('#id_provincia').change(function(){
		//limpio el combo provincia
		$("#id_distrito").empty();
		
		//Se agrega la primera opcion
		$("#id_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
		
		
		//agrego provincia y departamento
		var pro=$('#id_provincia').val();
		var dep = $('#id_departamento').val();
		
		$.getJSON("listaDistritoss",{"provincia":pro,"departamento":dep},function(data){
			$.each(data,function(index,obj){
				$("#id_distrito").append("<option value='"+obj.idUbigeo+"'>"+obj.distrito+"</option>")
				
			});
		});
	});
	
</script>

        //El actualizar
        
<script type="text/javascript">
   
	$.getJSON("listaDepartamentoss",{},function(data){
		console.log(data);
		$.each(data,function(i, obj){
			$("#id_act_departamento").append("<option value='" + obj+ "'>"+obj+"</option>");
			
		});
	});

	$('#id_act_departamento').change(function() {
		//limpio el combo provincia
		$("#id_act_provincia").empty();
		$("#id_act_distrito").empty();
		
		
		//Se agrega la primera opcion
		$("#id_act_provincia").append("<option value=' ' >[Seleccione Provincia]</option>");
		$("#id_act_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
		
		
		//agrego las provincias
		var dep = $('#id_act_departamento').val();
		
		$.getJSON("listaProvinciass",{"departamento":dep},function(data){
			$.each(data,function(i, obj){
				$("#id_act_provincia").append("<option value='" + obj+ "'>"+obj+"</option>");
				
			});
		});
	});
	
	$('#id_act_provincia').change(function(){
		//limpio el combo provincia
		$("#id_act_distrito").empty();
		
		//Se agrega la primera opcion
		$("#id_act_distrito").append("<option value=' ' >[Seleccione Distrito]</option>");
		
		
		//agrego provincia y departamento
		var pro=$('#id_act_provincia').val();
		var dep = $('#id_act_departamento').val();
		
		$.getJSON("listaDistritoss",{"provincia":pro,"departamento":dep},function(data){
			$.each(data,function(index,obj){
				$("#id_act_distrito").append("<option value='"+obj.idUbigeo+"'>"+obj.distrito+"</option>")
				
			});
		});
	});
	
</script>


<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
      
        }   
    });
</script>

<script type="text/javascript"> 
$.getJSON("cargaTipoUsuario", {}, function(data){
$.each(data, function(index,item){
	$("#id_reg_tipo").append("<option value="+item.idTipoUsuario +">"+ item.nombre +"</option>");
	$("#id_act_tipo").append("<option value="+item.idTipoUsuario +">"+ item.nombre +"</option>"); 
   });

}); 
</script> 

<script type="text/javascript">
	$('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh' 
        },
        
        fields: {
        	"nombres": {
        		selector : '#id_reg_nombre',
                validators: {
                    notEmpty: {
                        message: 'El nombre es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El nombre es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "apaterno": {
        		selector : '#id_reg_apaterno',
                validators: {
                    notEmpty: {
                        message: 'El apellido paterno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido paterno es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "amaterno": {
        		selector : '#id_reg_amaterno',
                validators: {
                    notEmpty: {
                        message: 'El apellido materno es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El apellido materno es de 5 a 100 caracteres', 
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "fechaNacimiento": {
        		selector : '#id_reg_fecha',
                validators: {
                    notEmpty: {
                        message: 'La fecha  es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'La fecha  es de 5 a 100 caracteres',
                    	min : 5,
                    	max : 100
                    }
                }
            },
            "email": {
        		selector : '#id_reg_email',
                validators: {
                    notEmpty: {
                        message: 'El email es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El email es de 10 a 30 caracteres', 
                    	min : 10,
                    	max : 30
                    }
                }
            },
            "estado": {
        		selector : '#id_reg_estado',
                validators: {
                    notEmpty: {
                        message: 'El estado es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El estado es de 6 a 10 caracteres', 
                    	min : 6,
                    	max : 10
                    }
                }
            },
            "celular": {
        		selector : '#id_reg_celular',
                validators: {
                    notEmpty: {
                        message: 'El celular es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El celular es de 6 a 9 caracteres', 
                    	min : 6,
                    	max : 9
                    }
                }
            },
            "direccion": {
        		selector : '#id_reg_direccion',
                validators: {
                    notEmpty: {
                        message: 'La direccion es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'La direccion es de 20 a 100 caracteres', 
                    	min : 20,
                    	max : 100
                    }
                }
            },
            "login": {
        		selector : '#id_reg_login',
                validators: {
                    notEmpty: {
                        message: 'El login es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El login es de 5 a 15 caracteres', 
                    	min : 5,
                    	max : 15
                    }
                }
            },
            "password": {
        		selector : '#id_reg_password',
                validators: {
                    notEmpty: {
                        message: 'El password es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El password es de 7 a 15 caracteres', 
                    	min : 7,
                    	max : 15
                    }
                }
            },
            "dni": {
        		selector : '#id_reg_dni',
                validators: {
                    notEmpty: {
                        message: 'El password es un campo obligatorio'
                    },
                    stringLength :{
                    	message:'El password es de 7 a 10 caracteres', 
                    	min : 7,
                    	max : 10
                    }
                }
            },
            
            "tipoUsuario.idTipoUsuario": {
        		selector : '#id_reg_tipo',
                validators: {
                	notEmpty: {
                        message: 'Tipo es un campo obligatorio'
                    },
                }
            },
            "ubigeo.departamento": {
        		selector : '#id_departamento',
                validators: {
                	notEmpty: {
                        message: 'Departamento es un campo obligatorio'
                    },
                }
            },
            "ubigeo.provincia": {
        		selector : '#id_provincia',
                validators: {
                	notEmpty: {
                        message: 'Provincia es un campo obligatorio'
                    },
                }
            },
            "ubigeo.idUbigeo": {
        		selector : '#id_distrito',
                validators: {
                	notEmpty: {
                        message: 'Distrito es un campo obligatorio'
                    },
                }
            },
        	
        }   
    });
</script>


</body>
</html> 

