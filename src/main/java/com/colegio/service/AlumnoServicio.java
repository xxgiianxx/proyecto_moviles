package com.colegio.service;

import java.util.List;
import java.util.Optional;

import com.colegio.entidad.Alumno;




public interface AlumnoServicio {
	
	
	
	public abstract List<Alumno> listaAlumno();
	
	public abstract Alumno insertaActualizaAlumno(Alumno obj);
	
	public abstract void eliminaAlumno(int id);
	
	
	public abstract List<Alumno> listarTodos();
	
	public abstract List<Alumno> listarPorNombre(String filtro);
	
	public abstract Optional<Alumno> buscaPorId(int id);

}
