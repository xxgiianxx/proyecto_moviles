package com.colegio.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Asistencia;
import com.colegio.repository.AsistenciaRepositorio;

@Service
public class AsistenciaServiciolmpl implements AsistenciaServicio {
	
	
	@Autowired
	private AsistenciaRepositorio repository;

	@Override
	public List<Asistencia> listaDocente() {
	
		return repository.findAll();
	}

	@Override
	public Asistencia insertaActualizaAsistencia(Asistencia obj) {
		
		return repository.save(obj);
	}

	@Override
	public void eliminaAsistencia(int id) {
		
		repository.deleteById(id);
	}

	@Override
	public List<Asistencia> listarTodos() {
	
		return repository.findAll();
	}

	@Override
	public List<Asistencia> listarPorNombre(String filtro) {
	
		return repository.listaPorNombre(filtro);
	}

	@Override
	public Optional<Asistencia> buscaPorId(int id) {
	
		return repository.findById(id);
	}

}
