package com.kgn.FreelanceProject.services;
import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import com.kgn.FreelanceProject.models.Client;
import com.kgn.FreelanceProject.models.Freelancer;
import com.kgn.FreelanceProject.models.LoginUser;
import com.kgn.FreelanceProject.repositories.ClientRepository;
import com.kgn.FreelanceProject.repositories.FreelancerRepository;

@Service
public class UserService {
	@Autowired
	private FreelancerRepository freelancerRepo;
	@Autowired
	private ClientRepository clientRepo;
	
////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////// freelancer//////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

	public Freelancer findFreelancerById(Long id) {
		if (id == null) {
			return null;
		}
		
		Optional<Freelancer> potentialUser = freelancerRepo.findById(id);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}

	public Freelancer findFreelancerByEmail(String email) {
		Optional<Freelancer> potentialUser = freelancerRepo.findByEmail(email);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}

	public Freelancer registerFreelancer(Freelancer newUser, BindingResult result) {
		if (findFreelancerByEmail(newUser.getEmail()) != null) {
			result.rejectValue("email", "Unique", "This email is already in use!");
		}
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			return freelancerRepo.save(newUser);
		}
	}

	public Freelancer loginFreelancer(LoginUser newLogin, BindingResult result) {
		if (result.hasErrors()) {
			return null;
		}
		Freelancer user = findFreelancerByEmail(newLogin.getEmail());
		if (user == null) {
			result.rejectValue("email", "Unique", "Unknown email!");
			return null;
		}
		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid Password!");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			return user;
		}
	}

////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////// client//////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////

	public Client findClientById(Long id) {
		if (id == null) {
			return null;
		}
		Optional<Client> potentialUser = clientRepo.findById(id);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}

	public Client findClientByEmail(String email) {
		Optional<Client> potentialUser = clientRepo.findByEmail(email);
		return potentialUser.isPresent() ? potentialUser.get() : null;
	}

	public Client registerClient(Client newUser, BindingResult result) {
		if (findClientByEmail(newUser.getEmail()) != null) {
			result.rejectValue("email", "Unique", "This email is already in use!");
		}
		if (!newUser.getPassword().equals(newUser.getConfirm())) {
			result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
			newUser.setPassword(hashed);
			return clientRepo.save(newUser);
		}
	}

	public Client loginClient(LoginUser newLogin, BindingResult result) {
		if (result.hasErrors()) {
			return null;
		}
		Client user = findClientByEmail(newLogin.getEmail());
		if (user == null) {
			result.rejectValue("email", "Unique", "Unknown email.");
			return null;
		}
		if (!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
			result.rejectValue("password", "Matches", "Invalid email or password.");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			return user;
		}
	}

}
