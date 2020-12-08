package com.colegio.service;

import java.util.List;
import java.util.Optional;


import com.colegio.entidad.Docente;

public interface DocenteServicio {
	
	public abstract List<Docente> listaDocente();
	
	public abstract Docente insertaActualizaDocente(Docente obj);
	
	public abstract void eliminaDocente(int id);
	
	
	public abstract List<Docente> listarTodos();
	
	public abstract List<Docente> listarPorNombre(String filtro);
	
	public abstract Optional<Docente> buscaPorId(int id);

	
}
