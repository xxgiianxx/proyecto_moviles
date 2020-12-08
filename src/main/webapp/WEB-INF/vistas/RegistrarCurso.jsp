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
 <h1>CURSO</h1>
 
 
	<form action="insertaCurso" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			
			
			<div class="form-group">
				<label class="control-label" for="id_codigo">Codigo</label>
				<input class="form-control" type="text" id="id_codigo" name="codigo" placeholder="Ingrese el Codigo">
			</div>
		
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
								
			<div class="form-group">
				<label class="control-label" for="id_estado">Estado</label>
				<select id="id_estado" name="estado" class='form-control'>
					<option value=" ">[Seleccione]</option> 
					<option value="Disponible">Disponible</option>
					<option value="En uso">En uso</option>					
				</select>
		    </div>			
		    
		    			
			<div class="form-group">
				<label class="control-label" for="id_sistema">Sistema Evaluacion</label>
				<select id="id_sistema" name="sistemaevaluacion.idSistemaEvaluacion" class='form-control'>
					<option value=" ">[Seleccione]</option>    
				</select>
		    </div>		
	    
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >CREAR CURSO</button>
			</div>
	</form>
 
 
 </div>
 
 
 <script type="text/javascript">
$.getJSON("cargaSistemaEvaluacion_c", {}, function(data){
	$.each(data, function(index,item){
		$("#id_sistema").append("<option value="+item.idSistemaEvaluacion +">"+ item.nombre +"</option>");
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
    	codigo: {
    		selector : '#id_codigo',
            validators: {
                notEmpty: {
                    message: 'El Codigo  es un campo obligatorio'
                },
                regexp: {
                  	 regexp: /^[0-9]{4}$/,
               	 message: 'El Codigo es de 4 digitos numericos'
                   }
                
            }
        },
        
    	nombre: {
    		selector : '#id_nombre',
            validators: {
                notEmpty: {
                    message: 'El Nombre  es un campo obligatorio'
                },               
                stringLength :{
                	message:'El Nombre es de 4 a 20 caracteres',
                	min : 4,
                	max : 20
                }
                
            }
        },
        estado: {
    		selector : '#id_estado',
            validators: {
                notEmpty: {
                    message: 'El Estado  es un campo obligatorio'
                },
                
            }
        },
        sistemaEvaluacion: {
    		selector : '#id_sistema',
            validators: {
            	notEmpty: {
                    message: 'El Sistema de Evaluacion es un campo Obligatorio'
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