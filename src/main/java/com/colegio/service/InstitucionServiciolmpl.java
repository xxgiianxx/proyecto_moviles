package com.colegio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Institucion;
import com.colegio.repository.InstitucionRepositorio;


@Service
public class InstitucionServiciolmpl implements InstitucionServicio{
	
	@Autowired
	private InstitucionRepositorio repository;

	@Override
	public List<Institucion> listaInstitucion() {
		
		return repository.findAll();
	}

	@Override
	public Institucion insertaInstitucion(Institucion obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}
	

}
