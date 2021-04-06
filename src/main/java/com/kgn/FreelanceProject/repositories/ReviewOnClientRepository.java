package com.kgn.FreelanceProject.repositories;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.kgn.FreelanceProject.models.ReviewOnClient;
@Repository
public interface ReviewOnClientRepository extends CrudRepository<ReviewOnClient,Long>{}
