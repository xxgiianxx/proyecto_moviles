package com.colegio.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Alumno;
import com.colegio.entidad.Asistencia;
import com.colegio.entidad.Curso;
import com.colegio.entidad.Docente;
import com.colegio.service.AlumnoServicio;
import com.colegio.service.AsistenciaServicio;
import com.colegio.service.CursoServicio;
import com.colegio.service.DocenteServicio;


@Controller
public class AsistenciaController {
	
	
	@Autowired
	private AsistenciaServicio asistenciaService;
	
	@Autowired
	private DocenteServicio docenteService;
	
	@Autowired
	private AlumnoServicio alumnoService;
	
	
	@Autowired
	private CursoServicio cursoService;
	
	@RequestMapping("/verCrudAsistencia")
	public String ver() {
		return "MantenimientoAsistencia";
	}
	
	
	
	@RequestMapping("/cargarDocente_a")
	@ResponseBody
	public List<Docente> listaDocente() {
		return docenteService.listaDocente();
	}
	
	
	@RequestMapping("/cargarAlumno_a")
	@ResponseBody
	public List<Alumno> listaAlumno() {
		return alumnoService.listaAlumno();
	}
	
	
	@RequestMapping("/cargarCurso_a")
	@ResponseBody
	public List<Curso> listaCurso() {
		return cursoService.listaCurso();
	}
	
	
	@RequestMapping("/consultaCrudAsistencia")
	public String consultaCrud(String filtro, HttpSession session) {
		List<Asistencia> lista = asistenciaService.listarPorNombre(filtro+"%");
		session.setAttribute("asistencias", lista);
		return "MantenimientoAsistencia";
	}
	
	
	
	@RequestMapping("/registraActualizaAsistencia")
	public String regAsistencia(Asistencia obj,HttpSession session) {
		
		try {
			Asistencia objsalida = asistenciaService.insertaActualizaAsistencia(obj);
			if(objsalida != null) {
		session.setAttribute("MENSAJE", "Se registró correctamente");
			}else {
		session.setAttribute("MENSAJE", "Error al registrar");
			}
		
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Error al registrar");
			e.printStackTrace();
		}
		
		
		return "redirect:salidaCrudAsistencia";
		
	}
	
	
	@RequestMapping("/salidaCrudAsistencia")
	public String salida(HttpSession session) {
		List<Asistencia> lista=asistenciaService.listarTodos();
		session.setAttribute("asistencias", lista);
		return "MantenimientoAsistencia";
	}
	
	
	

	@RequestMapping("/eliminaCrudAsistencia")
	public String elimina(Integer id, HttpSession session) {
		
		try {
			Optional<Asistencia> obj = asistenciaService.buscaPorId(id);
			if(obj.isPresent()) {
				asistenciaService.eliminaAsistencia(id);
				session.setAttribute("MENSAJE", "Se eliminÃ³ correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaCrudAsistencia";
		
		
	}

}
