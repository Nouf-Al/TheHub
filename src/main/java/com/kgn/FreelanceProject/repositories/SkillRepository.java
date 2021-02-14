package com.kgn.FreelanceProject.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kgn.FreelanceProject.models.Skill;

@Repository
public interface SkillRepository extends CrudRepository<Skill,Long>{
	Optional<Skill> findByTitle(String title);
}

