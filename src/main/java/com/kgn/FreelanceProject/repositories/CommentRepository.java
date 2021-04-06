package com.kgn.FreelanceProject.repositories;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.kgn.FreelanceProject.models.Comment;
@Repository
public interface CommentRepository extends CrudRepository<Comment,Long>{}

