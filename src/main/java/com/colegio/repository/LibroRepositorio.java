package com.colegio.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.colegio.entidad.Libro;

public interface LibroRepositorio extends JpaRepository<Libro, Integer> {

}
