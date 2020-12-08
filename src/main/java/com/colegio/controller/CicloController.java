package com.colegio.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.colegio.entidad.Ciclo;
import com.colegio.service.CicloServicio;

@Controller
public class CicloController {
	
	@Autowired
	private CicloServicio cicloService;
	
	@RequestMapping("/verCiclo")
	public String verAlumnos() {
		return "RegistrarCiclo";
	}

	
	@RequestMapping("/insertaCiclo")
	public String regCiclo(Ciclo obj, HttpSession session) {
		try {
			Ciclo objSalida = cicloService.insertaCiclo(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se Registro correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:salidaCiclo";
	}
	
	
	@RequestMapping("/salidaCiclo")
	public String salida() {
		return "RegistrarCiclo";
	}
}
