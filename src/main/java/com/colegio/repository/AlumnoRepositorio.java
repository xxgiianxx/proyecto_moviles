package com.colegio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Alumno;


public interface AlumnoRepositorio extends JpaRepository<Alumno, Integer> {

	
	@Query("select x from Alumno x where x.nombre like :v_param")
	public abstract List<Alumno> listaPorNombre(@Param("v_param") String filtro);
}
