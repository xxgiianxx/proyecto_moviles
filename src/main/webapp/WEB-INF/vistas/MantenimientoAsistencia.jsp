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

</div>

<div class="container">
 <h1>Crud de Asistencia</h1>
		 <div class="col-md-23" >  
			  <form id="idFormElimina" action="eliminaCrudAsistencia">
			  		<input type="hidden" id="id_elimina" name="id">
			  </form>	
				
		       <form accept-charset="UTF-8"  action="consultaCrudAsistencia" class="simple_form" id="defaultForm2"  method="post">

					<div class="row" style="height: 70px">
						<div class="col-md-2" >
								<input style="width: 180px;" class="form-control" id="id_nonbre_filtro"  name="filtro" placeholder="Ingrese el nombre" type="text" maxlength="30"/>
						</div>
						<div class="col-md-2" >
							<button type="submit" class="btn btn-primary" style="width: 150px">FILTRA</button>
						</div>
						<div class="col-md-2">
							<button type="button" data-toggle='modal' onclick="registrar();"  class='btn btn-success' id="validateBtnw2" style="width: 150px">REGISTRA</button>
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
						
									<table id="tablePaginacion" class="table table-striped table-bordered" >
										<thead>
											<tr>
												<th>ID</th>
												<th>Nombres</th>
												<th>Dia</th>												
												<th>Fecha Asistencia</th>
												<th>Categoria</th>
												<th>Docente</th>
												<th>Alumno</th>
												<th>Curso</th>
												<th>Actualiza</th>
												<th>Elimina</th>
											</tr>
										</thead>
										<tbody>
												   
												<c:forEach items="${sessionScope.asistencias}" var="x">
													<tr>
														<td>${x.idAsistencia}</td>
														<td>${x.nombre}</td>
														<td>${x.dia}</td>														
														<td>${x.fechaAsistencia}</td>
														<td>${x.categoria}</td>											
														<td>${x.docente.nombre}</td>
														<td>${x.alumno.nombre}</td>
														<td>${x.curso.nombre}</td>
														<td>
															<button type='button' data-toggle='modal' onclick="editar('${x.idAsistencia}','${x.nombre}','${x.dia}','${x.fechaAsistencia}','${x.categoria}','${x.docente.idDocente}','${x.alumno.idAlumno}','${x.curso.idCurso}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'>
																<img src='img/edit.gif' id='id_update' width='auto' height='auto' />
															</button>
														</td>
														<td>
															<button type='button' data-toggle='modal' onclick="eliminar('${x.idAsistencia}');" class='btn btn-success' style='background-color:hsla(233, 100%, 100%, 0);'> 
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Asistencia</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_registra" accept-charset="UTF-8" action="registraActualizaAsistencia" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Asistencia</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="45"/>
		                                        </div>
		                                    </div>
		                                    
		                                <div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_dia">Dia</label>
												 <div class="col-lg-5">
												<select id="id_reg_dia" name="dia" class='form-control'>
												<option value=" ">[Seleccione]</option> 
												<option value="Lunes">Lunes</option>
												<option value="Martes">Martes</option>
												<option value="Miercoles">Miercoles</option>	
												<option value="Jueves">Jueves</option>	
												<option value="Viernes">Viernes</option>	
												<option value="Sabado">Sabado</option>	
												<option value="Domingo">Domingo</option>						
												</select>
												</div>
		    							</div>	
		                                    
		                                    
		                                  
		                                    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_asis">Fecha de Asistencia</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_reg_asis" name="fechaAsistencia" placeholder="Ingrese la Fecha de Asistencia" type="date"/>
		                                        </div>
		                                    </div>
		                                    
		                                    
		                                      <div class="form-group">
												<label class="col-lg-3 control-label" for="id_reg_cat">Categoria</label>
												 <div class="col-lg-5">
												<select id="id_reg_cat" name="categoria" class='form-control'>
												<option value=" ">[Seleccione]</option> 
												<option value="Presente">Presente</option>
												<option value="Tardanza">Tardanza</option>
												<option value="Falto">Falto</option>																	
												</select>
												</div>
		    							</div>	
		                                    
		                                    
		                                    
		                                    
		                                    
		                                         <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_docente">Docente</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_docente" name="docente.idDocente" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_alumno">Alumno</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_alumno" name="alumno.idAlumno" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_reg_curso">Curso</label>
		                                        <div class="col-lg-5">
													<select id="id_reg_curso" name="curso.idCurso" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                    		   
		                                    
		                                   
		                                   
		                              
		                                    <div class="form-group">
		                                        <div class="col-lg-9 col-lg-offset-3">
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
					<h4><span class="glyphicon glyphicon-ok-sign"></span> Actualiza Asistencia</h4>
				</div>
				<div class="modal-body" style="padding: 20px 10px;">
						<form id="id_form_actualiza" accept-charset="UTF-8"  action="registraActualizaAsistencia" class="form-horizontal"     method="post">
		                    <div class="panel-group" id="steps">
		                        <!-- Step 1 -->
		                        <div class="panel panel-default">
		                            <div class="panel-heading">
		                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos de Asistencia</a></h4>
		                            </div>
		                            <div id="stepOne" class="panel-collapse collapse in">
		                                <div class="panel-body">
		                                
		                                    <div class="form-group">
		                                  
		                                        <label class="col-lg-3 control-label" for="id_ID">ID</label>
		                                        <div class="col-lg-5">
		                                           <input class="form-control" id="id_ID" readonly="readonly" name="idAsistencia" type="text" maxlength="8"/>
		                                        </div>
		                                     </div>
		                                     
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_nombre">Nombre</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_nombre" name="nombre" placeholder="Ingrese el Nombre" type="text" maxlength="20"/>
		                                        </div>
		                                    </div>
		                                    
		                                <div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_dia">Dia</label>
												 <div class="col-lg-5">
												<select id="id_act_dia" name="dia" class='form-control'>
												<option value=" ">[Seleccione]</option> 
												<option value="Lunes">Lunes</option>
												<option value="Martes">Martes</option>
												<option value="Miercoles">Miercoles</option>	
												<option value="Jueves">Jueves</option>	
												<option value="Viernes">Viernes</option>	
												<option value="Sabado">Sabado</option>	
												<option value="Domingo">Domingo</option>						
												</select>
												</div>
		    							</div>	
		                                    
		                                    
		                                  
		                                    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_asis">Fecha de Asistencia</label>
		                                        <div class="col-lg-5">
													<input class="form-control" id="id_act_asis" name="fechaAsistencia" placeholder="Ingrese la Fecha de Asistencia" type="date"/>
		                                        </div>
		                                    </div>
		                                    
		                                    
		                                      <div class="form-group">
												<label class="col-lg-3 control-label" for="id_act_cat">Categoria</label>
												 <div class="col-lg-5">
												<select id="id_act_cat" name="categoria" class='form-control'>
												<option value=" ">[Seleccione]</option> 
												<option value="Presente">Presente</option>
												<option value="Tardanza">Tardanza</option>
												<option value="Falto">Falto</option>																	
												</select>
												</div>
		    							</div>	
		                                    
		                                    
		                                    
		                                    
		                                    
		                                         <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_docente">Docente</label>
		                                        <div class="col-lg-5">
													<select id="id_act_docente" name="docente.idDocente" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                     <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_alumno">Alumno</label>
		                                        <div class="col-lg-5">
													<select id="id_act_alumno" name="alumno.idAlumno" class='form-control'>
							                            	<option value=" ">[Seleccione]</option>    
							                         </select>
		                                        </div>
		                                    </div>
		                                    
		                                      <div class="form-group">
		                                        <label class="col-lg-3 control-label" for="id_act_curso">Curso</label>
		                                        <div class="col-lg-5">
													<select id="id_act_curso" name="curso.idCurso" class='form-control'>
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
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Eliminar la Asistencia</h4>
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
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>


<script type="text/javascript">
$.getJSON("cargarDocente_a", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_docente").append("<option value="+item.idDocente +">"+ item.nombre +"</option>");
		$("#id_act_docente").append("<option value="+item.idDocente +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
$.getJSON("cargarAlumno_a", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_alumno").append("<option value="+item.idAlumno +">"+ item.nombre +"</option>");
		$("#id_act_alumno").append("<option value="+item.idAlumno +">"+ item.nombre +"</option>");
	});
	
});
</script>

<script type="text/javascript">
$.getJSON("cargarCurso_a", {}, function(data, q,t){
	console.log(data);
	
	$.each(data, function(index,item){
		$("#id_reg_curso").append("<option value="+item.idCurso +">"+ item.nombre +"</option>");
		$("#id_act_curso").append("<option value="+item.idCurso +">"+ item.nombre +"</option>");
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

function editar(id,nombre,dia,fechaAsistencia,categoria,idDocente,idAlumno,idCurso){	
	$('input[id=id_ID]').val(id);
	$('input[id=id_act_nombre]').val(nombre);
	$('input[id=id_act_dia]').val(dia);
	$('input[id=id_act_asis]').val(fechaAsistencia);
	$('input[id=id_act_cat]').val(categoria);	
	$('select[id=id_act_docente]').val(idDocente);
	$('select[id=id_act_alumno]').val(idAlumno);
	$('select[id=id_act_curso]').val(idCurso);
	$('#idModalActualiza').modal("show");
}

$(document).ready(function() {
    $('#tablePaginacion').DataTable();
} );
</script>



		




		
		


</body>
</html>