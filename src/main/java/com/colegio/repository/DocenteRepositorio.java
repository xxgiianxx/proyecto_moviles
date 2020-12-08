package com.colegio.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.colegio.entidad.Docente;

public interface DocenteRepositorio extends JpaRepository<Docente, Integer>{

	@Query("select x from Docente x where x.nombre like :v_param")
	public abstract List<Docente> listaPorNombre(@Param("v_param") String filtro);
}
