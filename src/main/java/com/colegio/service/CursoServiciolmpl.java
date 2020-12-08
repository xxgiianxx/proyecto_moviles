package com.colegio.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Curso;

import com.colegio.repository.CursoRepositorio;

@Service
public class CursoServiciolmpl implements CursoServicio{
	
	@Autowired
	private CursoRepositorio repository;
	

	@Override
	public List<Curso> listaCurso() {
		
		return repository.findAll();
	}


	@Override
	public Curso insertaCurso(Curso obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}


	@Override
	public Curso insertaActualizaCurso(Curso obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}


	@Override
	public void eliminaCurso(int id) {
		// TODO Auto-generated method stub
		repository.deleteById(id);
	}


	@Override
	public List<Curso> listarTodos() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}


	@Override
	public List<Curso> listarPorNombre(String filtro) {
		// TODO Auto-generated method stub
		return repository.listaPorNombre(filtro);
	}


	@Override
	public Optional<Curso> buscaPorId(int id) {
		// TODO Auto-generated method stub
		return repository.findById(id);
	}

}
