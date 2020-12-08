package com.colegio.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Aula;

import com.colegio.repository.AulaRepositorio;


@Service
public class AulaServiciolmpl implements AulaServicio {
	
	
	@Autowired
	private AulaRepositorio repository;

	@Override
	public Aula insertaAula(Aula obj) {
		
		return repository.save(obj);
	}

}
