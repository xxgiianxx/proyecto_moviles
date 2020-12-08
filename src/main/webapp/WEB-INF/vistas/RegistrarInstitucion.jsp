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
<h4>REGISTRO DE INSTITUCION</h4>
</div>



 <div class="container">
 <h1>INSTITUCION</h1>
 
 
	<form action="insertaInstitucion" id="id_form" method="post"> 
			<input type="hidden" name="metodo" value="registra">	
			
			
			<div class="form-group">
				<label class="control-label" for="id_codigo">Codigo</label>
				<input class="form-control" type="text" id="id_codigo" name="codigo" placeholder="Ingrese el Codigo" maxlength="5">
			</div>
		
			<div class="form-group">
				<label class="control-label" for="id_nombre">Nombre</label>
				<input class="form-control" type="text" id="id_nombre" name="nombre" placeholder="Ingrese el nombre">
			</div>
					
					<div class="form-group">
				<label class="control-label" for="id_direccion">Direccion</label>
				<input class="form-control" type="text" id="id_direccion" name="direccion" placeholder="Ingrese la Direccion">
			</div>			
								
			<div class="form-group">
				<label class="control-label" for="id_nivel">Nivel</label>
				<select id="id_nivel" name="nivel" class='form-control'>
					<option value=" ">[Seleccione]</option> 
					<option value="Inicial">Inicial</option>
					<option value="Primaria">Primaria</option>
					<option value="Segundaria">Segundaria</option>					
				</select>
		    </div>    	    
			<div class="form-group">
				<button type="submit" class="btn btn-primary" >CREAR INSTITUCION</button>
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

     	codigo: {
    		selector : '#id_codigo',
            validators: {
                notEmpty: {
                    message: 'El Codigo  es un campo obligatorio'
                },               
                regexp: {
                 	 regexp: /^[0-9]{5}$/,
              	 message: 'El Codigo es de 5 digitos numericos'
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
                	message:'El Nombre es de 4 a 45 caracteres',
                	min : 4,
                	max : 45
                }
                
            }
        },


        direccion: {
    		selector : '#id_direccion',
            validators: {
                notEmpty: {
                    message: 'la Direccion  es un campo obligatorio'
                },               
                stringLength :{
                	message:'La Direccion es de 4 a 45 caracteres',
                	min : 4,
                	max : 45
                }
                
            }
        },
        nivel: {
    		selector : '#id_nivel',
            validators: {
                notEmpty: {
                    message: 'El Nivel  es un campo obligatorio'
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