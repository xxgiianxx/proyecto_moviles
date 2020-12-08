package com.colegio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.colegio.entidad.Seccion;

import com.colegio.repository.SeccionRepositorio;

@Service
public class SeccionServiciolmpl implements SeccionServicio{
	
	
	@Autowired
	private SeccionRepositorio repository;

	@Override
	public List<Seccion> listaSeccion() {
		
		return repository.findAll();
	}

	@Override
	public Seccion insertaSeccion(Seccion obj) {
		
		return repository.save(obj);
	}

	


}
