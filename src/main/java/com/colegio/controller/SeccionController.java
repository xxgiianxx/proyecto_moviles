package com.colegio.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.colegio.entidad.Ciclo;
import com.colegio.entidad.Curso;
import com.colegio.entidad.Docente;
import com.colegio.entidad.Seccion;
import com.colegio.service.CicloServicio;
import com.colegio.service.CursoServicio;
import com.colegio.service.DocenteServicio;
import com.colegio.service.SeccionServicio;

@Controller
public class SeccionController {

	
	@Autowired
	private SeccionServicio seccionService;
	
	@Autowired
	private CursoServicio cursoService;
	
	
	@Autowired
	private DocenteServicio docenteService;
	
	
	
	
	@Autowired
	private CicloServicio cicloService;
	
	
	
	@RequestMapping("/verSeccion")
	public String verRegistrarSeccion() {
		return "RegistrarSeccion";
	}
	
	

	@RequestMapping("/cargaCurso_s")
	@ResponseBody
	public List<Curso> listaCurso(){
		return cursoService.listaCurso();
	}
	
	@RequestMapping("/cargaDocente_s")
	@ResponseBody
	public List<Docente> listaDocente(){
		return docenteService.listaDocente();
	}
	
	@RequestMapping("/cargaCiclo_s")
	@ResponseBody
	public List<Ciclo> listaCiclo(){
		return cicloService.listaCiclo();
	}
	
	
	@RequestMapping("/insertaSeccion")
	public String regSeccion(Seccion obj, HttpSession session) {
		try {
			Seccion objSalida = seccionService.insertaSeccion(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se Registro correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:salidaSeccion";
	}
	
	
	@RequestMapping("/salidaSeccion")
	public String salida() {
		return "RegistrarSeccion";
	}

	
	
}
