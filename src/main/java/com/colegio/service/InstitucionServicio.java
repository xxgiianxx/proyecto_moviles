package com.colegio.service;

import java.util.List;


import com.colegio.entidad.Institucion;

public interface InstitucionServicio {
	public abstract List<Institucion> listaInstitucion();

	
	public Institucion insertaInstitucion(Institucion obj);
}
