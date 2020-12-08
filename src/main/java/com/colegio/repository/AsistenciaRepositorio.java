package com.colegio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.colegio.entidad.Asistencia;

public interface AsistenciaRepositorio extends JpaRepository<Asistencia, Integer>{
	
	@Query("select x from Asistencia x where x.nombre like :v_param")
	public abstract List<Asistencia> listaPorNombre(@Param("v_param") String filtro);

}
