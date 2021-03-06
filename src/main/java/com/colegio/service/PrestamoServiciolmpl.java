package com.colegio.service;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.Prestamo;

import com.colegio.repository.PrestamoRepositorio;


@Service
public class PrestamoServiciolmpl implements PrestamoServicio {
	
	@Autowired
	private PrestamoRepositorio repository;
	

	@Override
	public Prestamo insertaActualizaPrestamo(Prestamo obj) {
		// TODO Auto-generated method stub
		return repository.save(obj);
	}

	@Override
	public void eliminaPrestamo(int id) {
		// TODO Auto-generated method stub
		repository.deleteById(id);
	}

	@Override
	public List<Prestamo> listarTodos() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

	@Override
	public List<Prestamo> listaPorNombre(String filtro) {
		// TODO Auto-generated method stub
		return repository.listaPorNombre(filtro);
	}

	@Override
	public Optional<Prestamo> buscaPorId(int id) {
		// TODO Auto-generated method stub
		return repository.findById(id);
	}

}
