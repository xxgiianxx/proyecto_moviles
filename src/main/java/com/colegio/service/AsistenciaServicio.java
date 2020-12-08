package com.colegio.service;

import java.util.List;
import java.util.Optional;

import com.colegio.entidad.Asistencia;


public interface AsistenciaServicio {

	
public abstract List<Asistencia> listaDocente();
	
	public abstract Asistencia insertaActualizaAsistencia(Asistencia obj);
	
	public abstract void eliminaAsistencia(int id);
	
	
	public abstract List<Asistencia> listarTodos();
	
	public abstract List<Asistencia> listarPorNombre(String filtro);
	
	public abstract Optional<Asistencia> buscaPorId(int id);
}
