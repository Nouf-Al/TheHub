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
	
//	project model
	public Project createProject(Project p) {
		return projectRepo.save(p);
	}

	public ArrayList<Project> getAllProjects() {
		return (ArrayList<Project>) projectRepo.findAll();
	}

	public Project getOneProject(Long id) {
		Optional<Project> getter = projectRepo.findById(id);
		return getter.get();
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

	public void like(Freelancer u, Project p) {
		p.getFreelancers_like().add(u);
		projectRepo.save(p);
	}

	public void unlike(Freelancer u, Project p) {
		p.getFreelancers_like().remove(u);
		projectRepo.save(p);
	}

	public void offer(Freelancer u, Project p) {
		p.getFreelancers_offer().add(u);
		projectRepo.save(p);
	}

	public void withdraw(Freelancer u, Project p) {
		p.getFreelancers_offer().remove(u);
		projectRepo.save(p);
	}

	public void accept(Freelancer u, Project p) {
		p.setFreelancer(u);
		projectRepo.save(p);
	}

	public void reject(Project p) {
		p.setFreelancer(null);
		projectRepo.save(p);
	}

//	freelancer model
	public Freelancer updateFreelancer(Freelancer user) {
		return freelancerRepo.save(user);
	}

	public ArrayList<Freelancer> getAllFreelancers() {
		return (ArrayList<Freelancer>) freelancerRepo.findAll();
	}

	public Freelancer editFreeLancer(Freelancer newFreelancer) {
		String[] skill = newFreelancer.getSkillString().split(",");
		List<Skill> skills = new ArrayList<Skill>();
		for (String title : skill) {
			Skill skil = findOrCreate(title);
			skills.add(skil);
		}
		newFreelancer.setSkills(skills);
		String hashed = BCrypt.hashpw(newFreelancer.getPassword(), BCrypt.gensalt());
		newFreelancer.setPassword(hashed);
		return freelancerRepo.save(newFreelancer);
	}

//	question model
	public Question createQuestion(Question q) {
		q.setId(null);
		return questionRepo.save(q);
	}

	public ArrayList<Question> getAllQuestions() {
		return (ArrayList<Question>) questionRepo.findAll();
	}

	public void deleteQuestion(Long id) {
		questionRepo.deleteById(id);
	}

//	answer model
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

//	comment model
	public Comment leaveAComment(Comment newO) {
		newO.setId(null);
		return commentRepo.save(newO);
	}

	public ArrayList<Comment> getAllComments() {
		return (ArrayList<Comment>) commentRepo.findAll();
	}

	public ArrayList<Comment> getProperComments(Freelancer fr, Client cl) {

		ArrayList<Comment> allComments = getAllComments();
		ArrayList<Comment> properComments = new ArrayList<Comment>();

		for (Comment comment : allComments) {
			if (comment.getClient().equals(cl) && comment.getFreelancer().equals(fr)) {
				properComments.add(comment);
			}
		}

		return properComments;
	}

// category model
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

//	skill model
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

//	review model
	public ReviewOnFreelancer reviewFreelancer(ReviewOnFreelancer newO) {
		newO.setId(null);
		ReviewOnFreelancer review = reviewOnFreelancerRepo.save(newO);
		Freelancer freelancer = review.getReviewedFreelancer();
		freelancer.getReviewsOnFreelancer().add(review);
		return review;
	}

	public ReviewOnClient reviewClient(ReviewOnClient newO) {
		newO.setId(null);
		ReviewOnClient review = reviewOnClientRepo.save(newO);
		Client client = review.getReviewedClient();
		client.getReviewsOnClient().add(review);
		return review;
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

	public Client EditClient(Client editClient) {
		String hashed = BCrypt.hashpw(editClient.getPassword(), BCrypt.gensalt());
		editClient.setPassword(hashed);
		return clientRepo.save(editClient);
	}
}
