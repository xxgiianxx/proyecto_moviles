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

 
<title>Proyecto-COLEGIO</title>
</head>   
<body id="body"> 
<jsp:include  page="intranetCabecera.jsp" />
<div class="container">&nbsp;<br>&nbsp;<br>&nbsp;<br><br><br>
<h4>REGISTRO DE AULAS</h4>
</div>



 <div class="container">
 <h1>SECCION</h1>
 
 
	<form action="insertaSeccion" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			
		
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
						
						
								
							
			<div class="form-group">
				<label class="control-label" for="id_curso">Curso</label>
				<select id="id_curso" name="curso.idCurso" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>		
		    
		    	<div class="form-group">
				<label class="control-label" for="id_docente">Docente</label>
				<select id="id_docente" name="docente.idDocente" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>	
		    
		    	<div class="form-group">
				<label class="control-label" for="id_ciclo">Ciclo</label>
				<select id="id_ciclo" name="ciclo.idCiclo" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>	
		    
		    
		        	    
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >CREAR SECCION</button>
			</div>
	</form>
 
 
 </div>
 
 
  <script type="text/javascript">
$.getJSON("cargaCurso_s", {}, function(data){
	$.each(data, function(index,item){
		$("#id_curso").append("<option value="+item.idCurso +">"+ item.nombre +"</option>");
	});
});
</script>
 
 <script type="text/javascript">
$.getJSON("cargaDocente_s", {}, function(data){
	$.each(data, function(index,item){
		$("#id_docente").append("<option value="+item.idDocente +">"+ item.nombre +"</option>");
	});
});
</script>

 <script type="text/javascript">
$.getJSON("cargaCiclo_s", {}, function(data){
	$.each(data, function(index,item){
		$("#id_ciclo").append("<option value="+item.idCiclo +">"+ item.nombre +"</option>");
	});
});
</script>


<script type="text/javascript">
$("#success-alert").fadeTo(1000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<script type="text/javascript">

$('#id_form').bootstrapValidator({
    message: 'This value is not valid',
    feedbackIcons: {
        valid: 'glyphicon glyphicon-ok',
        invalid: 'glyphicon glyphicon-remove',
        validating: 'glyphicon glyphicon-refresh'
    },
    fields: {
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El Nombre  es un campo obligatorio'
                },               
                stringLength :{
                	message:'El Nombre es de 4  caracteres',
                	min : 4,
                	max : 4
                }
                
            }
        },
     
        curso: {
    		selector : '#id_curso',
            validators: {
            	notEmpty: {
                    message: 'el Curso es un campo Obligatorio'
                },
               
            }
        },  

        docente: {
    		selector : '#id_docente',
            validators: {
            	notEmpty: {
                    message: 'el Docente es un campo Obligatorio'
                },
               
            }
        }, 

        ciclo: {
    		selector : '#id_ciclo',
            validators: {
            	notEmpty: {
                    message: 'el Ciclo es un campo Obligatorio'
                },
               
            }
        },                	
    }   
});
</script>

<script type="text/javascript">
$("#success-alert").fadeTo(2000, 500).slideUp(500, function(){
    $("#success-alert").slideUp(500);
});
</script>

<div class="container" >
 <div class="col-md-12" align="center"> 

 </div>
</div>
		
		


</body>



</html>