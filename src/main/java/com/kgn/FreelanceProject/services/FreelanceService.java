package com.kgn.FreelanceProject.services;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kgn.FreelanceProject.models.Answer;
import com.kgn.FreelanceProject.models.Category;
import com.kgn.FreelanceProject.models.Client;
import com.kgn.FreelanceProject.models.Comment;
import com.kgn.FreelanceProject.models.Freelancer;
import com.kgn.FreelanceProject.models.Project;
import com.kgn.FreelanceProject.models.Question;
import com.kgn.FreelanceProject.models.ReviewOnClient;
import com.kgn.FreelanceProject.models.ReviewOnFreelancer;
import com.kgn.FreelanceProject.models.Skill;
import com.kgn.FreelanceProject.repositories.AnswerRepository;
import com.kgn.FreelanceProject.repositories.CategoryRepository;
import com.kgn.FreelanceProject.repositories.ClientRepository;
import com.kgn.FreelanceProject.repositories.CommentRepository;
import com.kgn.FreelanceProject.repositories.FreelancerRepository;
import com.kgn.FreelanceProject.repositories.ProjectRepository;
import com.kgn.FreelanceProject.repositories.QuestionRepository;
import com.kgn.FreelanceProject.repositories.ReviewOnClientRepository;
import com.kgn.FreelanceProject.repositories.ReviewOnFreelancerRepository;
import com.kgn.FreelanceProject.repositories.SkillRepository;
@Service
public class FreelanceService {
	@Autowired
	private ProjectRepository projectRepo;
	@Autowired
	private FreelancerRepository freelancerRepo;
	@Autowired
	private QuestionRepository questionRepo;
	@Autowired
	private CategoryRepository categoryRepo;
	@Autowired
	private CommentRepository commentRepo;
	@Autowired
	private SkillRepository skillRepo;
	@Autowired
	private ReviewOnFreelancerRepository reviewOnFreelancerRepo;
	@Autowired
	private ReviewOnClientRepository reviewOnClientRepo;
	@Autowired
	private ClientRepository clientRepo;
	@Autowired
	private AnswerRepository answerRepo;
	
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Project ///////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////
	
	public Project createProject(Project p) {
		return projectRepo.save(p);
	}

	public ArrayList<Project> getAllProjects() {
		return (ArrayList<Project>) projectRepo.findAll();
	}

	public ArrayList<Project> getAllProjectsSorted() {
		return (ArrayList<Project>) projectRepo.findByOrderByCreatedAtDesc();
	}

	public Project getOneProject(Long id) {
		Optional<Project> project = projectRepo.findById(id);
		return project.get();
	}

	public Project updateProject(Project toEdit) {
		return projectRepo.save(toEdit);
	}

	public void deleteProject(Long id) {
		projectRepo.deleteById(id);
	}

	public List<Project> searchTitle(String title) {
		return projectRepo.findByTitleContaining(title);
	}

	public List<Project> filterByCategory(Long id) {
		return projectRepo.findByCategoryId(id);
	}

	public List<Project> findProjectsByClientId(Long id) {
		return projectRepo.findByClientId(id);
	}

	public List<Project> findProjectsByFreelancerId(Long id) {
		return projectRepo.findByfreelancerId(id);
	}

	public List<Project> filterMyProjectsByCategory(Long clientId, Long categoryId, String user_type) {
		if(user_type == "freelancer"){
			List<Project> projects = projectRepo.findByfreelancerId(clientId);
			List<Project> projectsFilterd = new ArrayList<Project>();
			for (Project project : projects) {
				if (project.getCategory().getId() == categoryId) {
					projectsFilterd.add(project);
				}
			}
			return projectsFilterd;
		}else{
			List<Project> projects = projectRepo.findByClientId(clientId);
			List<Project> projectsFilterd = new ArrayList<Project>();
			for (Project project : projects) {
				if (project.getCategory().getId() == categoryId) {
					projectsFilterd.add(project);
				}
			}
			return projectsFilterd;
		}
	}
	
	public void like(Freelancer u, Project p) {
		p.getFreelancers_like().add(u);
		projectRepo.save(p);
	}

	public void unlike(Freelancer u, Project p) {
		p.getFreelancers_like().remove(u);
		projectRepo.save(p);
	}

	public void clientLike(Client u, Project p) {
		p.getClients_like().add(u);
		projectRepo.save(p);
	}

	public void clientUnlike(Client u, Project p) {
		p.getClients_like().remove(u);
		projectRepo.save(p);
	}

	public void offer(Freelancer u, Project p) {
		p.getFreelancersOffers().add(u);
		projectRepo.save(p);
	}

	public void withdraw(Freelancer u, Project p) {
		p.getFreelancersOffers().remove(u);
		projectRepo.save(p);
	}

	public void accept(Freelancer u, Project p) {
		p.setFreelancer(u);
		p.setStatus("Close");
		projectRepo.save(p);
	}

	public void reject(Project p) {
		p.setFreelancer(null);
		p.setStatus(null);
		projectRepo.save(p);
	}

	public void changeStatus(String status, Project p) {
		p.setStatus(status);
		projectRepo.save(p);
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Freelancer ////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////
	
	public Freelancer getOneFreelancer(Long id) {
		Optional<Freelancer> freelancer = freelancerRepo.findById(id);
		return freelancer.get();
	}

	public Freelancer updateFreelancer(Freelancer user) {
		return freelancerRepo.save(user);
	}

	public ArrayList<Freelancer> getAllFreelancers() {
		return (ArrayList<Freelancer>) freelancerRepo.findAll();
	}

	public List<Freelancer> getFourFreelancers() {
		Iterable<Freelancer> freelancers = freelancerRepo.findAll();
		ArrayList<Freelancer> fourFreelancers = new ArrayList<Freelancer>();
		int i =1;
		for(Freelancer f: freelancers){
			if(i<5){
				fourFreelancers.add(f);
				i++;
			}
			if(i==5){
				break;
			}
		}
		return fourFreelancers;
	}

	public Freelancer editFreelancer(Freelancer newFreelancer,Long id) {
		Freelancer theFreelancer = getOneFreelancer(id);
		String[] skill = newFreelancer.getSkillString().split(",");
		List<Skill> skills = new ArrayList<Skill>();
		for (String title : skill) {
			Skill skil = findOrCreate(title);
			skills.add(skil);
		}
		String hashed = BCrypt.hashpw(newFreelancer.getPassword(), BCrypt.gensalt());
		theFreelancer.setFirstname(newFreelancer.getFirstname());
		theFreelancer.setLastname(newFreelancer.getLastname());
		theFreelancer.setEmail(newFreelancer.getEmail());
		theFreelancer.setPassword(hashed);
		theFreelancer.setGender(newFreelancer.getGender());
		theFreelancer.setSpeciality(newFreelancer.getSpeciality());
		theFreelancer.setBio(newFreelancer.getBio());
		theFreelancer.setPhotos(newFreelancer.getPhotos());
		theFreelancer.setSkills(skills);
		return updateFreelancer(theFreelancer);
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Client ////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////
	
	public Client getOneClient(Long id) {
		Optional<Client> getter = clientRepo.findById(id);
		return getter.get();
	}

	public ArrayList<Client> getAllClients() {
		return (ArrayList<Client>) clientRepo.findAll();
	}
	
	public Client editClient(Client editClient,Long id) {
		Client theClient = getOneClient(id);
		String hashed = BCrypt.hashpw(editClient.getPassword(), BCrypt.gensalt());
		theClient.setFirstname(editClient.getFirstname());
		theClient.setLastname(editClient.getLastname());
		theClient.setEmail(editClient.getEmail());
		theClient.setPassword(hashed);
		theClient.setGender(editClient.getGender());
		theClient.setBio(editClient.getBio());
		theClient.setPhoto(editClient.getPhoto());
		return clientRepo.save(theClient);
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Question ///////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////
	
	public Question createQuestion(Question q) {
		q.setId(null);
		return questionRepo.save(q);
	}

	public ArrayList<Question> getAllQuestions(Long id) {
		return (ArrayList<Question>) questionRepo.findByProjectId(id);
	}

	public void deleteQuestion(Long id) {
		questionRepo.deleteById(id);
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Answer ////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////
	
	public Answer createAnswer(Answer a) {
		a.setId(null);
		return answerRepo.save(a);
	}

	public ArrayList<Answer> getAllAnswers() {
		return (ArrayList<Answer>) answerRepo.findAll();
	}

	public void deleteAnswer(Long id) {
		answerRepo.deleteById(id);
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Comment ///////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////
	
	public Comment leaveAComment(Comment newO) {
		newO.setId(null);
		return commentRepo.save(newO);
	}

	public ArrayList<Comment> getAllComments() {
		return (ArrayList<Comment>) commentRepo.findAll();
	}

	public ArrayList<Comment> getRelatedComments(long pId) {
		ArrayList<Comment> allComments = getAllComments();
		ArrayList<Comment> properComments = new ArrayList<Comment>();
		for (Comment comment : allComments) {
			if (comment.getProject().getId() == pId){
				properComments.add(comment);
			}
		}
		return properComments;
	}

	public void deleteComments(Long id) {
		commentRepo.deleteById(id);
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Category //////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////
	
	public Category createCategory(Category newO) {
		newO.setId(null);
		return categoryRepo.save(newO);
	}

	public ArrayList<Category> getAllCategories() {
		return (ArrayList<Category>) categoryRepo.findAll();
	}

	public Category getOneCategory(Long id) {
		Optional<Category> getter = categoryRepo.findById(id);
		return getter.get();
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Skill /////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////
	
	public void addSkill(Freelancer freelancer, Long id) {
		Optional<Skill> theSkill = skillRepo.findById(id);
		Skill updatedS = theSkill.get();
		freelancer.getSkills().add(updatedS);
		updateFreelancer(freelancer);
	}

	public List<Skill> returnTheNoExistingSkills(Long idF, List<Skill> allSkills) {
		Optional<Freelancer> freelancer = freelancerRepo.findById(idF);
		Freelancer updatedF = freelancer.get();
		return updatedF.returnTheNoExistingSkill(allSkills);
	}
	
	public Skill findOrCreate(String title) {
		Optional<Skill> skill = skillRepo.findByTitle(title);
		if (skill.isPresent()) {
			return skill.get();
		} else {
			Skill newSkill = new Skill();
			newSkill.setTitle(title.toLowerCase());
			return skillRepo.save(newSkill);
		}
	}
	
	////////////////////////////////////////////////////////////////////////////////////
	/////////////////////////////////// Review ////////////////////////////////////////
	//////////////////////////////////////////////////////////////////////////////////
	
	public ReviewOnFreelancer reviewFreelancer(ReviewOnFreelancer newO) {
		newO.setId(null);
		ReviewOnFreelancer review = reviewOnFreelancerRepo.save(newO);
		return review;
	}

	public double findFreelancerAvgRating(Long id) {
		ArrayList<ReviewOnFreelancer> reviews = (ArrayList<ReviewOnFreelancer>) reviewOnFreelancerRepo.findAll();
		double total = 0;
		double count=0;
		for (ReviewOnFreelancer r : reviews) {
			if (r.getFreelancer().getId() == id) {
				count++;
				total += r.getRating();
			}
		}
		if( count != 0){
			return total / count;
		} else{
			return 0;
		}
	}

	public ReviewOnClient reviewClient(ReviewOnClient newO) {
		newO.setId(null);
		ReviewOnClient review = reviewOnClientRepo.save(newO);
		Client client = review.getClient();
		client.getReviewsOnClient().add(review);
		return review;
	}

	public double findClientAvgRating(Long id) {
		ArrayList<ReviewOnClient> reviews = (ArrayList<ReviewOnClient>) reviewOnClientRepo.findAll();
		double total = 0;
		double count=0;
		for (ReviewOnClient r : reviews) {
			if (r.getClient().getId() == id) {
				count++;
				total += r.getRating();
			}
		}
		if( count != 0){
			return total / count;
		} else{
			return 0;
		}
	}

	public ArrayList<ReviewOnClient> getAllReviewsOnClients() {
		return (ArrayList<ReviewOnClient>) reviewOnClientRepo.findAll();
	}

	public ArrayList<ReviewOnFreelancer> getAllReviewsOnFreelancers() {
		return (ArrayList<ReviewOnFreelancer>) reviewOnFreelancerRepo.findAll();
	}

	public ReviewOnFreelancer getOneReviewOnFreelancer(Long id) {
		Optional<ReviewOnFreelancer> getter = reviewOnFreelancerRepo.findById(id);
		return getter.get();
	}

	public ReviewOnFreelancer updateReviewOnFreelancer(ReviewOnFreelancer toEdit) {
		return reviewOnFreelancerRepo.save(toEdit);
	}

	public void removeReviewOnFreelancer(Long id) {
		reviewOnFreelancerRepo.deleteById(id);
	}
}
