package com.kgn.FreelanceProject.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.kgn.FreelanceProject.models.Category;

@Repository
public interface CategoryRepository extends CrudRepository<Category,Long>{

}
