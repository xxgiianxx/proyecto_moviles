package com.colegio.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.colegio.entidad.Ciclo;
import com.colegio.entidad.Curso;
import com.colegio.entidad.Docente;
import com.colegio.entidad.Institucion;

import com.colegio.service.CicloServicio;
import com.colegio.service.CursoServicio;
import com.colegio.service.DocenteServicio;
import com.colegio.service.InstitucionServicio;

@Controller
public class DocenteController {
	
	
	@Autowired
	private CicloServicio cicloService;
	
	@Autowired
	private InstitucionServicio institucionService;
	
	@Autowired
	private CursoServicio cursoService;
	
	
	@Autowired
	private DocenteServicio docenteService;
	
	

	@RequestMapping("/verCrudDocente")
	public String ver() {
		return "MantenimientoDocente";
	}
	
	
	@RequestMapping("/cargarCurso2")
	@ResponseBody
	public List<Curso> listaCurs() {
		return cursoService.listaCurso();
	}
	
	
	
	@RequestMapping("/cargarCiclo3")
	@ResponseBody
	public List<Ciclo> listaCiclo() {
		return cicloService.listaCiclo();
	}
	
	@RequestMapping("/cargarInstitucion3")
	@ResponseBody
	public List<Institucion> listaInstitucion() {
		return institucionService.listaInstitucion();
	}
	
	
	@RequestMapping("/consultaCrudDocente")
	public String consultaCrud(String filtro, HttpSession session) {
		List<Docente> lista = docenteService.listarPorNombre(filtro+"%");
		session.setAttribute("docentes", lista);
		return "MantenimientoDocente";
	}
	
	
	
	@RequestMapping("/registraActualizaDocente")
	public String regDocente(Docente obj,HttpSession session) {
		
		try {
			Docente objsalida = docenteService.insertaActualizaDocente(obj);
			if(objsalida != null) {
		session.setAttribute("MENSAJE", "Se registró correctamente");
			}else {
		session.setAttribute("MENSAJE", "Error al registrar");
			}
		
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Error al registrar");
			e.printStackTrace();
		}
		
		
		return "redirect:salidaCrudDocente";
		
	}
	
	
	@RequestMapping("/salidaCrudDocente")
	public String salida(HttpSession session) {
		List<Docente> lista=docenteService.listarTodos();
		session.setAttribute("docentes", lista);
		return "MantenimientoDocente";
	}
	
	
	@RequestMapping("/eliminaCrudDocente")
	public String elimina(Integer id, HttpSession session) {
		
		try {
			Optional<Docente> obj = docenteService.buscaPorId(id);
			if(obj.isPresent()) {
				docenteService.eliminaDocente(id);
				session.setAttribute("MENSAJE", "Se eliminÃ³ correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaCrudDocente";
		
		
	}
	
	

}
