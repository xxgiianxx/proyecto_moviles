package com.colegio.repository;




import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


import com.colegio.entidad.Prestamo;

public interface PrestamoRepositorio extends JpaRepository<Prestamo, Integer> {
	
	@Query("select x from Prestamo x where x.nombre like :v_param")
	public abstract List<Prestamo> listaPorNombre(@Param("v_param") String filtro);

	
}
