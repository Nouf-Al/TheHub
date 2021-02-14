package com.kgn.FreelanceProject.repositories;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kgn.FreelanceProject.models.Freelancer;




@Repository
public interface FreelancerRepository extends CrudRepository<Freelancer,Long>{
	Optional<Freelancer> findByEmail(String email);

}

