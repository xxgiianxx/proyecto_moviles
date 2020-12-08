package com.colegio.service;

import java.util.List;


import com.colegio.entidad.Ciclo;


public interface CicloServicio {
	
	public abstract List<Ciclo> listaCiclo();
	
	public Ciclo insertaCiclo(Ciclo obj);

}
