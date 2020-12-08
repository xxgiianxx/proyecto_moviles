package com.colegio.controller;


import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.colegio.entidad.Alumno;
import com.colegio.entidad.Libro;
import com.colegio.entidad.Prestamo;
import com.colegio.service.AlumnoServicio;


import com.colegio.service.LibroServicio;
import com.colegio.service.PrestamoServicio;

@Controller
public class PrestamoController {
	
	@Autowired
	private PrestamoServicio prestamoService;
	
	@Autowired
	private LibroServicio libroService;
	
	@Autowired
	private AlumnoServicio alumnoService;
	
	
	
	@RequestMapping("/verCrudPrestamo")
	public String ver() {
		return "MantenimientoPrestamo";
	}
	
	
	@RequestMapping("/cargarLibro_p")
	@ResponseBody
	public List<Libro> listaLibro() {
		return libroService.listaLibro();
	}
	

	@RequestMapping("/cargarAlumno_p")
	@ResponseBody
	public List<Alumno> listaAlumno() {
		return alumnoService.listaAlumno();
	}
	
	
	@RequestMapping("/consultaCrudPrestamo")
	public String consultaCrud(String filtro, HttpSession session) {
		List<Prestamo> lista = prestamoService.listaPorNombre(filtro+"%");
		session.setAttribute("prestamos", lista);
		return "MantenimientoPrestamo";
	}
	
	
	
	@RequestMapping("/registraActualizaPrestamo")
	public String regPrestamo(Prestamo obj,HttpSession session) {
		
		try {
			Prestamo objsalida = prestamoService.insertaActualizaPrestamo(obj);
			if(objsalida != null) {
		session.setAttribute("MENSAJE", "Se registró correctamente");
			}else {
		session.setAttribute("MENSAJE", "Error al registrar");
			}
		
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Error al registrar");
			e.printStackTrace();
		}
		
		
		return "redirect:salidaCrudPrestamo";
		
	}
	
	
	@RequestMapping("/salidaCrudPrestamo")
	public String salida(HttpSession session) {
		List<Prestamo> lista=prestamoService.listarTodos();
		session.setAttribute("prestamos", lista);
		return "MantenimientoPrestamo";
	}
	
	
	@RequestMapping("/eliminaCrudPrestamo")
	public String elimina(Integer id, HttpSession session) {
		
		try {
			Optional<Prestamo> obj = prestamoService.buscaPorId(id);
			if(obj.isPresent()) {
				prestamoService.eliminaPrestamo(id);
				session.setAttribute("MENSAJE", "Se eliminÃ³ correctamente");
			}else {
				session.setAttribute("MENSAJE", "No existe el ID");	
			}	
		} catch (Exception e) {
			session.setAttribute("MENSAJE", "Existe ERROR");
			e.printStackTrace();
		}
		return "redirect:salidaCrudPrestamo";
		
		
	}

}
