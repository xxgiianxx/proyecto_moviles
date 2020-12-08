package com.colegio.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Alumno;
import com.colegio.repository.AlumnoRepositorio;


@Service
public class AlumnoServiciolmpl implements AlumnoServicio{
	
	
	@Autowired
	private AlumnoRepositorio repository;


	@Override
	public Alumno insertaActualizaAlumno(Alumno obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

	@Override
	public void eliminaAlumno(int id) {
		// TODO Auto-generated method stub
		repository.deleteById(id);
	}

	@Override
	public List<Alumno> listarTodos() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public List<Alumno> listarPorNombre(String filtro) {
		// TODO Auto-generated method stub
		return repository.listaPorNombre(filtro);
	}

	@Override
	public Optional<Alumno> buscaPorId(int id) {
		// TODO Auto-generated method stub
		return repository.findById(id);
	}

	@Override
	public List<Alumno> listaAlumno() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}
	

}
