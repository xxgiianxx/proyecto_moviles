package com.colegio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.TipoLibro;

import com.colegio.repository.TipoLibroRepositorio;

@Service
public class TipoLibroServiciolmpl implements TipoLibroService {
	
	
	
	@Autowired
	private TipoLibroRepositorio repository;

	@Override
	public List<TipoLibro> listaTipoLibro() {
		
		return repository.findAll();
	}

}
