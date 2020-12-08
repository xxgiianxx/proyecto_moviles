package com.colegio.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Aula;
import com.colegio.entidad.Seccion;
import com.colegio.service.AulaServicio;
import com.colegio.service.SeccionServicio;




@Controller
public class AulaController {
	
	@Autowired
	private SeccionServicio seccionService;
	
	@Autowired
	private AulaServicio aulaService;
	
	
	@RequestMapping("/verAula")
	public String verRegistroAula() {
		return "RegistrarAula";
	}
	
	
	
	@RequestMapping("/cargaSeccion")
	@ResponseBody
	public List<Seccion> listaSeccion(){
		return seccionService.listaSeccion();
	}
	
	
	@RequestMapping("/insertaAula")
	public String regAula(Aula obj, HttpSession session) {
		try {
			Aula objSalida = aulaService.insertaAula(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se Registro correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:salidaAula";
	}
	
	
	
	@RequestMapping("/salidaAula")
	public String salida() {
		return "RegistrarAula";
	}

}
