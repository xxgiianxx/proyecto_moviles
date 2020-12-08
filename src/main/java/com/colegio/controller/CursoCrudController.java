package com.colegio.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Curso;

import com.colegio.entidad.SistemaEvaluacion;
import com.colegio.service.CursoServicio;
import com.colegio.service.SistemaEvaluacionService;

@Controller
public class CursoCrudController {
	
	
	@Autowired
	private SistemaEvaluacionService sistemaEvaluacionService;
	
	@Autowired
	private CursoServicio cursoService;
	
	
	@RequestMapping("/verCrudCurso")
	public String ver() {
		return "MantenimientoCurso";
	}
	
	@RequestMapping("/cargarSistemaEvaluacion_c")
	@ResponseBody
	public List<SistemaEvaluacion> listaSistemaEvaluacion() {
		return sistemaEvaluacionService.listaSistemaEvaluacion();
	}
	
	
	@RequestMapping("/consultaCrudCurso")
	public String consultaCrud(String filtro, HttpSession session) {
		List<Curso> lista = cursoService.listarPorNombre(filtro+"%");
		session.setAttribute("cursos", lista);
		return "MantenimientoCurso";
	}
	
	@RequestMapping("/registraActualizaCurso")
	public String regCurso(Curso obj,HttpSession session) {
		
		try {
			Curso objsalida = cursoService.insertaActualizaCurso(obj);
			if(objsalida != null) {
		session.setAttribute("MENSAJE", "Se registró correctamente");
			}else {
		session.setAttribute("MENSAJE", "Error al registrar");
			}
		
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Error al registrar");
			e.printStackTrace();
		}
		
		
		return "redirect:salidaCrudCurso";
		
	}
	
	
	@RequestMapping("/salidaCrudCurso")
	public String salida(HttpSession session) {
		List<Curso> lista=cursoService.listarTodos();
		session.setAttribute("cursos", lista);
		return "MantenimientoCurso";
	}
	
	

	@RequestMapping("/eliminaCrudCurso")
	public String elimina(Integer id, HttpSession session) {
		
		try {
			Optional<Curso> obj = cursoService.buscaPorId(id);
			if(obj.isPresent()) {
				cursoService.eliminaCurso(id);
				session.setAttribute("MENSAJE", "Se eliminÃ³ correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaCrudCurso";
		
		
	}
	
	

}
