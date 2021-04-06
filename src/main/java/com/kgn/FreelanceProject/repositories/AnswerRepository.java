package com.kgn.FreelanceProject.repositories;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.kgn.FreelanceProject.models.Answer;
@Repository
public interface AnswerRepository extends CrudRepository<Answer, Long> {}
