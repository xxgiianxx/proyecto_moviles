package com.colegio.service;

import java.util.List;


import com.colegio.entidad.Seccion;

public interface SeccionServicio {
	
	public abstract List<Seccion> listaSeccion();
	public Seccion insertaSeccion(Seccion obj);

}
