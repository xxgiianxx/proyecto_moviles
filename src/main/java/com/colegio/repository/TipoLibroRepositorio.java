package com.colegio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.TipoLibro;

public interface TipoLibroRepositorio extends JpaRepository<TipoLibro, Integer> {

}
