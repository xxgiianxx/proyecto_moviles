package com.colegio.service;


import java.util.List;
import java.util.Optional;


import com.colegio.entidad.Prestamo;

public interface PrestamoServicio {
	
	
public abstract Prestamo insertaActualizaPrestamo(Prestamo obj);
	
	public abstract void eliminaPrestamo(int id);
	
	
	public abstract List<Prestamo> listarTodos();
	
	public abstract List<Prestamo> listaPorNombre(String filtro);
	
	public abstract Optional<Prestamo> buscaPorId(int id);

}
