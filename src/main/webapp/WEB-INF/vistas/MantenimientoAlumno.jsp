<jsp:include page="intranetValida.jsp" />
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrapValidator.js"></script>

<link rel="stylesheet" href="css/form-elements.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/style2.css">
<link rel="stylesheet" href="css/bootstrapValidator.css">

 
<title>Proyecto-Colegio</title>
</head>   

<body id="body"> 
<jsp:include  page="intranetCabecera.jsp" />
<div class="container">&nbsp;<br>&nbsp;<br>&nbsp;<br><br><br>
<h4>MANTENIMIETNO ALUMNO</h4>
</div>
<div class="container">
<h1>ALUMNO</h1>
 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudAlumno">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudAlumno" class="simple_form" id="defaultForm2"  method="post">
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
						
									<table id="tableAlumnos" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombre</th>
												<th>Apellido Paterno</th>
												<th>Apellido Materno</th>
												<th>Fecha Nacimiento</th>											
												<th>Sexo</th>
												<th>Seccion</th>
												<th>Ciclo</th>
												<th>Institucion</th>												
												<th>Actualiza </th>
												<th>Elimina </th>
											</tr>
										</thead>
										<tbody>
												    
												<c:forEach items="${sessionScope.alumnos}" var="x">
													<tr>
														<td>${x.idAlumno}</td>
														<td>${x.nombre}</td>
														<td>${x.apaterno}</td>
														<td>${x.amaterno}</td>														
														<td>${x.fechaNacimiento}</td>
														<td>${x.sexo}</td>													
														<td>${x.seccion.nombre}</td>
														<td>${x.ciclo.nombre}</td>
														<td>${x.institucion.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idAlumno}','${x.nombre}','${x.apaterno}','${x.amaterno}','${x.fechaNacimiento}','${x.sexo}','${x.seccion.idSeccion}','${x.ciclo.idCiclo}','${x.institucion.idInstitucion}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='img/edit.gif' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idAlumno}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='img/delete.gif' width='auto' height='auto' />
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Alumno</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaAlumno" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Alumno</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_ape_paterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_ape_paterno" name="apaterno" placeholder="Ingrese el Apellido Paterno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_ape_materno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_ape_materno" name="amaterno" placeholder="Ingrese el Apellido Materno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>		   
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nac">Fecha de Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nac" name="fechaNacimiento" placeholder="Ingrese la Fecha de Nacimiento" type="date"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_sexo">Sexo</label>
												 <div class="col-lg-5">
												<select id="id_reg_sexo" name="sexo" class='form-control'>
												<option value=" ">[Seleccione]</option> 
												<option value="Femenino">Femenino</option>
												<option value="Masculino">Masculino</option>					
												</select>
												</div>
		    							</div>	
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_seccion">Seccion</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_seccion" name="seccion.idSeccion" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_ciclo">Ciclo</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_ciclo" name="ciclo.idCiclo" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_institucion">Institucion</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_institucion" name="institucion.idInstitucion" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                    
		                                     
		                                    <div class="form-group">
		                                        <div class="col-lg-5 col-lg-offset-3">
		                                        	<button type="submit" class="btn btn-primary">REGISTRAR ALUMNO</button>
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Alumno</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaCrudAlumno" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Alumno</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idAlumno" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_ape_paterno">Apellido Paterno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_ape_paterno" name="apaterno" placeholder="Ingrese el Apellido Paterno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_ape_materno">Apellido Materno</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_ape_materno" name="amaterno" placeholder="Ingrese el Apellido Materno" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>		   
		                                    
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nac">Fecha de Nacimiento</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nac" name="fechaNacimiento" placeholder="Ingrese la Fecha de Nacimiento" type="date"/>
		                                        </div>
		                                    </div>
		                                    
		                                    <div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_sexo">Sexo</label>
												 <div class="col-lg-5">
												<select id="id_act_sexo" name="sexo" class='form-control'>
												<option value=" ">[Seleccione]</option> 
												<option value="Femenino">Femenino</option>
												<option value="Masculino">Masculino</option>					
												</select>
												</div>
		    							</div>	
		                                   
		                                    <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_seccion">Seccion</label>
		                                        <div class="col-lg-5">
													<select id="id_act_seccion" name="seccion.idSeccion" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_ciclo">Ciclo</label>
		                                        <div class="col-lg-5">
													<select id="id_act_ciclo" name="ciclo.idCiclo" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_institucion">Institucion</label>
		                                        <div class="col-lg-5">
													<select id="id_act_institucion" name="institucion.idInstitucion" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Deseas Eliminar este Alumno???</h4>
						</div>
				
						  <div class="modal-footer">
						    <button type="button" id="idBtnElimina" name="modalDe" class="btn btn-primary">ELIMINAR ALUMNO</button>
						    <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
						  </div>
					</div>
				</div>
				</div>




</div>


<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>


<script type="text/javascript">
$.getJSON("cargaSeccion3", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_seccion").append("<option value="+item.idSeccion +">"+ item.nombre +"</option>");
		$("#id_act_seccion").append("<option value="+item.idSeccion +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
$.getJSON("cargaCiclo2", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_ciclo").append("<option value="+item.idCiclo +">"+ item.nombre +"</option>");
		$("#id_act_ciclo").append("<option value="+item.idCiclo +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
$.getJSON("cargaInstitucion2", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_institucion").append("<option value="+item.idInstitucion +">"+ item.nombre +"</option>");
		$("#id_act_institucion").append("<option value="+item.idInstitucion +">"+ item.nombre +"</option>");
	});
	
});
</script>


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

function editar(id,nombre,apaterno,amaterno,fechaNacimiento,sexo,idSeccion,idCiclo,idInstitucion){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_ape_paterno]').val(apaterno);
	$('input[id=id_act_ape_materno]').val(amaterno);
	$('input[id=id_act_nac]').val(fechaNacimiento);
	$('input[id=id_act_sexo]').val(sexo);	
	$('select[id=id_act_seccion]').val(idSeccion);
	$('select[id=id_act_ciclo]').val(idCiclo);
	$('select[id=id_act_institucion]').val(idInstitucion);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tableAlumnos').DataTable();
} );
</script>



	
		


</body>
</html>