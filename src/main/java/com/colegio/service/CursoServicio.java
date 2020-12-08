package com.colegio.service;

import java.util.List;
import java.util.Optional;

import com.colegio.entidad.Curso;


public interface CursoServicio {
	
	public abstract List<Curso> listaCurso();
	
	
	public Curso insertaCurso(Curso obj);
	
	
public abstract Curso insertaActualizaCurso(Curso obj);
	
	public abstract void eliminaCurso(int id);
	
	
	public abstract List<Curso> listarTodos();
	
	public abstract List<Curso> listarPorNombre(String filtro);
	
	public abstract Optional<Curso> buscaPorId(int id);

}
