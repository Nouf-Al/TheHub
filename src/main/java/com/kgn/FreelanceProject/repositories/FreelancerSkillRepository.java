package com.kgn.FreelanceProject.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kgn.FreelanceProject.models.FreelancerSkill;


@Repository
public interface FreelancerSkillRepository extends CrudRepository<FreelancerSkill,Long>{

}

