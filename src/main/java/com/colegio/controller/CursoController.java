package com.colegio.controller;

import java.util.List;

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
public class CursoController {
	
	@Autowired
	private SistemaEvaluacionService sistemaEvaluacionService;
	
	@Autowired
	private CursoServicio cursoService;
	
	
	
	@RequestMapping("/verCurso")
	public String verRegistroCurso() {
		return "RegistrarCurso";
	}
	
	
	
	@RequestMapping("/cargaSistemaEvaluacion_c")
	@ResponseBody
	public List<SistemaEvaluacion> listaSistemaEvaluacion(){
		return sistemaEvaluacionService.listaSistemaEvaluacion();
	}
	
	
	@RequestMapping("/insertaCurso")
	public String regCurso(Curso obj, HttpSession session) {
		try {
			Curso objSalida = cursoService.insertaCurso(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se Registro correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:salidaCurso";
	}
	
	
	@RequestMapping("/salidaCurso")
	public String salida() {
		return "RegistrarCurso";
	}

}
