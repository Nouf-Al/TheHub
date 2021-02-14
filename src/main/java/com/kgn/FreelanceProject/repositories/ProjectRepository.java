package com.kgn.FreelanceProject.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kgn.FreelanceProject.models.Project;


@Repository
public interface ProjectRepository extends CrudRepository<Project,Long>{
	List<Project> findByTitleContaining(String search);
	List<Project> findByCategoryId(Long id);
}

