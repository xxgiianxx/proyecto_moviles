package com.colegio.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.colegio.entidad.Institucion;
import com.colegio.service.InstitucionServicio;


@Controller
public class InstitucionController {
	
	
	@Autowired
	private InstitucionServicio institucionService;
	

	@RequestMapping("/verInstitucion")
	public String verRegistroInstitucion() {
		return "RegistrarInstitucion";
	}

	
	

	@RequestMapping("/insertaInstitucion")
	public String regInstitucion(Institucion obj, HttpSession session) {
		try {
			Institucion objSalida = institucionService.insertaInstitucion(obj);
			if(objSalida != null) {
				session.setAttribute("MENSAJE","Se Registro correctamente");
			}else {
				session.setAttribute("MENSAJE","Error al registrar");
			}
		} catch (Exception e) {
			session.setAttribute("MENSAJE","Error al registrar");
			e.printStackTrace();
		}
		return "redirect:salidaInstitucion";
	}
	
	
	
	@RequestMapping("/salidaInstitucion")
	public String salida() {
		return "RegistrarInstitucion";
	}
}
