package com.colegio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Libro;

import com.colegio.repository.LibroRepositorio;

@Service
public class LibroServiciolmpl implements LibroServicio{
	
	
	
	@Autowired
	private LibroRepositorio repository;

	@Override
	public List<Libro> listaLibro() {
		
		return repository.findAll();
	}

}
