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
<h4>REGISTRO DE Ciclo</h4>
</div>

<div class="container">
 <h1>Ciclo</h1>
 
 
	<form action="insertaCiclo" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			
		
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
								
			
			
			<div class="form-group">
				<label class="control-label" for="id_estado">Estado</label>
				<select id="id_estado" name="estado" class='form-control'>
					<option value=" ">[Seleccione]</option> 
					<option value="ACTIVO">ACTIVO</option>
					<option value="INACTIVO">INACTIVO</option>					
				</select>
		    </div>	
		    
		    
		       
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >CREAR AULA</button>
			</div>
	</form>
 
 
 </div>
 
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