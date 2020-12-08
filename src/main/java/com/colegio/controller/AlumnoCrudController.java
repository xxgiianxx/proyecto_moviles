package com.colegio.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import javax.servlet.http.HttpSession;

import com.colegio.entidad.Alumno;
import com.colegio.entidad.Ciclo;

import com.colegio.entidad.Institucion;
import com.colegio.entidad.Seccion;
import com.colegio.service.AlumnoServicio;
import com.colegio.service.CicloServicio;
import com.colegio.service.InstitucionServicio;
import com.colegio.service.SeccionServicio;

@Controller
public class AlumnoCrudController {
	
	
	@Autowired
	private SeccionServicio seccionService;
	
	@Autowired
	private CicloServicio cicloService;
	
	@Autowired
	private InstitucionServicio institucionService;
	
	
	@Autowired
	private AlumnoServicio alumnoService;
	
	@RequestMapping("/verCrudAlumno")
	public String ver() {
		return "MantenimientoAlumno";
	}
	
	@RequestMapping("/cargaSeccion3")
	@ResponseBody
	public List<Seccion> listaSeccion(){
		return seccionService.listaSeccion();
	}
	
	
	@RequestMapping("/cargaCiclo2")
	@ResponseBody
	public List<Ciclo> listaCiclo(){
		return cicloService.listaCiclo();
	}
	
	
	
	@RequestMapping("/cargaInstitucion2")
	@ResponseBody
	public List<Institucion> listaInstitucion(){
		return institucionService.listaInstitucion();
	}
	
	
	@RequestMapping("/consultaCrudAlumno")
	public String consultarCrud(String filtro, HttpSession session) {
		List<Alumno> lista = alumnoService.listarPorNombre(filtro + "%");
		session.setAttribute("alumnos", lista);
		return "MantenimientoAlumno";
	}
	
	
	@RequestMapping("/registraActualizaAlumno")
	public String regAlumno(Alumno obj,HttpSession session) {
		
		try {
			Alumno objsalida = alumnoService.insertaActualizaAlumno(obj);
			if(objsalida != null) {
		session.setAttribute("MENSAJE", "Se registró correctamente");
			}else {
		session.setAttribute("MENSAJE", "Error al registrar");
			}
		
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Error al registrar");
			e.printStackTrace();
		}
		
		
		return "redirect:salidaCrudAlumno";
		
	}
	

	
	@RequestMapping("/salidaCrudAlumno")
	public String salida(HttpSession session) {
		List<Alumno> lista=alumnoService.listarTodos();
		session.setAttribute("alumnos", lista);
		return "MantenimientoAlumno";
	}
	
	
	
	@RequestMapping("/eliminaCrudAlumno")
	public String elimina(Integer id, HttpSession session) {
		
		try {
			Optional<Alumno> obj = alumnoService.buscaPorId(id);
			if(obj.isPresent()) {
				alumnoService.eliminaAlumno(id);
				session.setAttribute("MENSAJE", "Se eliminÃ³ correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaCrudAlumno";
		
		
	}
	
	

	
	

}
