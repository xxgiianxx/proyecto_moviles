package com.colegio.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


import com.colegio.entidad.Usuario;
import com.colegio.service.UsuarioServicio;

@Controller
public class LoginController {

	@Autowired
	private UsuarioServicio servicio;

	@RequestMapping("/verLogin")
	public String verLogin() {
		return "login";
	}
	
	
	


	@RequestMapping("/verIntranetHome")
	public String verIntranetHome() {
		return "intranetHome";
	}
	
	
	
	@RequestMapping("/verRegistroAula")
	public String verRegistroAula() {
		return "RegistrarAula";
	}
	
	
	
	
	@RequestMapping("/verRegistroCiclo")
	public String verRegistroCiclo() {
		return "RegistrarCiclo";
	}
	
	@RequestMapping("/verRegistroCurso")
	public String verRegistroCurso() {
		return "RegistrarCurso";
	}
	
	@RequestMapping("/verRegistroInstitucion")
	public String verRegistroInstitucion() {
		return "RegistrarInstitucion";
	}
	@RequestMapping("/verRegistroSeccion")
	public String verRegistroSeccion() {
		return "RegistrarSeccion";
	}
	
	@RequestMapping("/verRegistroAlumno")
	public String verRegistroTipoLibro() {
		return "RegistrarAlumno";
	}
	
	@RequestMapping("/verMantenimientoAlumno")
	public String verMantenimientoAlumno() {
		return "MantenimientoAlumno";
	}
	
	@RequestMapping("/verMantenimientoUsuario")
	public String verMantenimientoUsuario() {
		return "MantenimientoUsuario";
	}
	
	@RequestMapping("/verMantenimientoDocente")
	public String verMantenimientoDocente() {
		return "MantenimientoDocente";
	}
	
	@RequestMapping("/verMantenimientoAsistencia")
	public String verMantenimientoAsistencia() {
		return "MantenimientoAsistencia";
	}
	
	@RequestMapping("/verMantenimientoCurso")
	public String verMantenimientoCurso() {
		return "MantenimientoCurso";
	}
	
	@RequestMapping("/verMantenimientoPrestamo")
	public String verMantenimientoPrestamo() {
		return "MantenimientoPrestamo";
	}
	
	@RequestMapping("/verMantenimientoLibro")
	public String verMantenimientoLibro() {
		return "MantenimientoLibro";
	}
	
	
	@RequestMapping("/verMantenimientoHorario")
	public String verMantenimientoHorario() {
		return "MantenimientoHorario";
	}
	
	@RequestMapping("/verMantenimientoMatricula")
	public String verMantenimientoMatricula() {
		return "MantenimientoMatricula";
	}
	
	@RequestMapping("/verMantenimientoNotas")
	public String verMantenimientoNotas() {
		return "MantenimientoNotas";
	}

	

	@RequestMapping("/login")
	public String login(Usuario user, HttpSession session, HttpServletRequest request) {
		Usuario usuario = servicio.login(user);
		if (usuario == null) {
			request.setAttribute("mensaje", "El usuario no existe");
			return "login";
		} else {		
			session.setAttribute("objUsuario", usuario);
			return "redirect:home";
		}
	}
	
	
	@RequestMapping("/home")
	public String salida() {
		return "intranetHome";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session, HttpServletRequest request, HttpServletResponse response) {
		session.invalidate();

		response.setHeader("Cache-control", "no-cache");
		response.setHeader("Expires", "0");
		response.setHeader("Pragma", "no-cache");

		request.setAttribute("mensaje", "El usuario salió de sesión");
		return "login";

	}

}
