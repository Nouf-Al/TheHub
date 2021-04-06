package com.kgn.FreelanceProject.repositories;
import java.util.Optional;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.kgn.FreelanceProject.models.Client;
@Repository
public interface ClientRepository extends CrudRepository<Client,Long>{
	Optional<Client> findByEmail(String email);
}

