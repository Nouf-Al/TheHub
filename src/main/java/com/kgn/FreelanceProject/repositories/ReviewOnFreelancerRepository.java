package com.kgn.FreelanceProject.repositories;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.kgn.FreelanceProject.models.ReviewOnFreelancer;
@Repository
public interface ReviewOnFreelancerRepository extends CrudRepository<ReviewOnFreelancer, Long> {}
