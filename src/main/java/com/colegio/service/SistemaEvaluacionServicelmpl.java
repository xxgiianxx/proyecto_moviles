package com.colegio.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.colegio.entidad.SistemaEvaluacion;

import com.colegio.repository.SistemaEvaluacionRepositorio;

@Service
public class SistemaEvaluacionServicelmpl implements SistemaEvaluacionService{
	
	
	@Autowired
	private SistemaEvaluacionRepositorio repository;


	@Override
	public List<SistemaEvaluacion> listaSistemaEvaluacion() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}

}
