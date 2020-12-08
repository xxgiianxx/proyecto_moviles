package com.colegio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Curso;


public interface CursoRepositorio extends JpaRepository<Curso, Integer>{
	
	@Query("select x from Curso x where x.nombre like :v_param")
	public abstract List<Curso> listaPorNombre(@Param("v_param") String filtro);

}
