package com.colegio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Ciclo;
import com.colegio.repository.CicloRepositorio;


@Service
public class CicloServiciolmlp implements CicloServicio{
	
	
	@Autowired
	private CicloRepositorio repository;

	@Override
	public List<Ciclo> listaCiclo() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public Ciclo insertaCiclo(Ciclo obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

}
