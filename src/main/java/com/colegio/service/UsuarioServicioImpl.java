package com.colegio.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.colegio.entidad.Usuario;
import com.colegio.repository.UsuarioRepositorio;

@Service
public class UsuarioServicioImpl implements UsuarioServicio{

	@Autowired
	private UsuarioRepositorio repositorio;
	
	@Override
	public Usuario login(Usuario bean) {
		return repositorio.login(bean);
	}

	

}
