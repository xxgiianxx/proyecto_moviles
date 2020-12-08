package com.colegio.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Docente;
import com.colegio.repository.DocenteRepositorio;

@Service
public class DocenteServiciolmpl implements DocenteServicio {

	@Autowired
	private DocenteRepositorio repository;
	
	@Override
	public List<Docente> listaDocente() {
		
		return repository.findAll() ;
	}

	@Override
	public Docente insertaActualizaDocente(Docente obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

	@Override
	public void eliminaDocente(int id) {
		// TODO Auto-generated method stub
		repository.deleteById(id);
	}

	@Override
	public List<Docente> listarTodos() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public List<Docente> listarPorNombre(String filtro) {
		// TODO Auto-generated method stub
		return repository.listaPorNombre(filtro);
	}

	@Override
	public Optional<Docente> buscaPorId(int id) {
		// TODO Auto-generated method stub
		return repository.findById(id);
	}

}
