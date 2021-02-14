package com.kgn.FreelanceProject.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kgn.FreelanceProject.models.Question;


@Repository
public interface QuestionRepository extends CrudRepository<Question,Long>{

}

