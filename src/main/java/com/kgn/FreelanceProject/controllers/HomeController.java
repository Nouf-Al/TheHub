package com.kgn.FreelanceProject.controllers;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.kgn.FreelanceProject.models.Answer;
import com.kgn.FreelanceProject.models.Category;
import com.kgn.FreelanceProject.models.Client;
import com.kgn.FreelanceProject.models.Comment;
import com.kgn.FreelanceProject.models.Freelancer;
import com.kgn.FreelanceProject.models.LoginUser;
import com.kgn.FreelanceProject.models.Project;
import com.kgn.FreelanceProject.models.Question;
import com.kgn.FreelanceProject.models.ReviewOnClient;
import com.kgn.FreelanceProject.models.ReviewOnFreelancer;
import com.kgn.FreelanceProject.services.FreelanceService;
import com.kgn.FreelanceProject.services.UserService;
@Controller
public class HomeController {
	private final UserService userSer;
	private final FreelanceService freelanceSer;
	public HomeController(UserService userSer, FreelanceService freelanceSer) {
		this.userSer = userSer;
		this.freelanceSer = freelanceSer;
	}

	@RequestMapping("/")
	public String index(Model model, HttpSession session) {
		List<Project> p = freelanceSer.getAllProjects();
		model.addAttribute("projectsLength", p.size());

		List<Freelancer> f = freelanceSer.getAllFreelancers();
		model.addAttribute("freelancersLength", f.size());
		model.addAttribute("freelancers", f);

		List<Client> c = freelanceSer.getAllClients();
		model.addAttribute("clientsLength", c.size());

		int reviews = freelanceSer.getAllReviewsOnFreelancers().size() + freelanceSer.getAllReviewsOnClients().size();
		// List<ReviewOnClient> reviewC = freelanceSer.getAllReviewsOnClients();
		model.addAttribute("reviewsLength", reviews);

		model.addAttribute("user_id", session.getAttribute("user_id"));
		return "index.jsp";
	}

	// login and registration
	@RequestMapping(value = "/freelancer/register", method = RequestMethod.POST)
	public String registerFreelancer(HttpSession session, @Valid @ModelAttribute("newUser") Freelancer newUser, BindingResult result, Model model) {
		userSer.registerFreelancer(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register_f.jsp";
		} else {
			session.setAttribute("user_id", newUser.getId());
			session.setAttribute("user_type", "freelancer");
			return "redirect:/freelance/projects";
		}
	}

	@RequestMapping("/freelancer/register")
	public String registerFreelancerPage(HttpSession session, Model model) {
		model.addAttribute("newUser", new Client());
		model.addAttribute("newLogin", new LoginUser());
		return "register_f.jsp";
	}

	@RequestMapping(value = "/client/register", method = RequestMethod.POST)
	public String registerClient(HttpSession session, @Valid @ModelAttribute("newUser") Client newUser, BindingResult result, Model model) {
		userSer.registerClient(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register_c.jsp";
		} else {
			session.setAttribute("user_id", newUser.getId());
			session.setAttribute("user_type", "client");
			return "redirect:/freelance/projects";	
		}
	}

	@RequestMapping("/client/register")
	public String registerClientPage(HttpSession session, Model model) {
		model.addAttribute("newUser", new Client());
		model.addAttribute("newLogin", new LoginUser());
		return "register_c.jsp";
	}

	@RequestMapping(value = "/freelancer/login", method = RequestMethod.POST)
	public String loginFreelancer(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result,
			Model model, HttpSession session) {
		Freelancer u = userSer.loginFreelancer(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new Client());
			return "login_f.jsp";
		}
		session.setAttribute("user_id", u.getId());
		session.setAttribute("user_type", "freelancer");
		return "redirect:/freelance/projects";
		
	}

	@RequestMapping("/freelancer/login")
	public String loginFreelancerPage(HttpSession session, Model model) {
		model.addAttribute("newUser", new Client());
		model.addAttribute("newLogin", new LoginUser());
		return "login_f.jsp";
	}

	@RequestMapping(value = "/client/login", method = RequestMethod.POST)
	public String loginClient(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,
			HttpSession session) {
		Client u = userSer.loginClient(newLogin, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new Client());
			return "login_c.jsp";
		}
		session.setAttribute("user_id", u.getId());
		session.setAttribute("user_type", "client");
		return "redirect:/freelance/projects";
	}

	@RequestMapping("/client/login")
	public String loginClientPage(HttpSession session, Model model) {
		model.addAttribute("newUser", new Client());
		model.addAttribute("newLogin", new LoginUser());
		return "login_c.jsp";
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_id");
		session.removeAttribute("user_type");
		return "redirect:/";
	}




	@RequestMapping("/freelance/freelancers")
	public String allFreelancers(Model model, HttpSession session) {
		if (userSer.findFreelancerById((Long) session.getAttribute("user_id")) == null && userSer.findClientById((Long) session.getAttribute("user_id")) == null) {
			return "redirect:/";
		} else {
			model.addAttribute("freelancers", freelanceSer.getAllFreelancers());
			if (session.getAttribute("user_type").equals("freelancer")) {
				model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", false);
			} else {
				model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", true);
			}
			return "freelancers.jsp";
		}
	}

	@GetMapping("/freelance/projects")
	public String projects(Model model, HttpSession session) {
		if (userSer.findClientById((Long) session.getAttribute("user_id")) == null && (userSer.findFreelancerById((Long) session.getAttribute("user_id")) == null)) {
			return "redirect:/";
		} 
		else {
			model.addAttribute("projects", freelanceSer.getAllProjects());
			model.addAttribute("categories", freelanceSer.getAllCategories());
			if (session.getAttribute("user_type").equals("freelancer")) {
				model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", false);
			} else if (session.getAttribute("user_type").equals("client")) {
				model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", true);
			}
			return "projects.jsp";
		}
	}

	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(Model model, HttpSession session, @RequestParam(value = "title") String title) {
		model.addAttribute("projects", freelanceSer.searchTitle(title));
		model.addAttribute("categories", freelanceSer.getAllCategories());
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", false);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		return "projects.jsp";
	}

	@RequestMapping(value = "/freelance/projects/category/{id}")
	public String filterByCategory(Model model, HttpSession session, @PathVariable Long id) {
		model.addAttribute("projects", freelanceSer.filterByCategory(id));
		model.addAttribute("categories", freelanceSer.getAllCategories());
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", false);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		return "projects.jsp";
	}

	// CRUD - project
	@RequestMapping("/freelance/projects/{id}")
	public String viewProject(Model model, HttpSession session, @PathVariable Long id, @ModelAttribute(name = "newQuestion") Question newQuestion, @ModelAttribute(name = "newAnswer") Answer newAnswer) {
		model.addAttribute("project", freelanceSer.getOneProject(id));
		model.addAttribute("questions", freelanceSer.getAllQuestions(id));
		model.addAttribute("answers", freelanceSer.getAllAnswers());
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", false);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		return "viewProject.jsp";
	}
	
	@RequestMapping("/freelance/projects/new")
	public String newProjectPage(@ModelAttribute("newProject") Project newProject, HttpSession session, Model model) {
		if(session.getAttribute("user_type").equals("freelancer")){
			return "redirect:/freelance/projects";
		}
		model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
		model.addAttribute("categories", freelanceSer.getAllCategories());
		model.addAttribute("isClient", true);
		return "newProject.jsp";
	}

	@RequestMapping(value = "/freelance/projects/create", method = RequestMethod.POST)
	public String createProject(Model model, @Valid @ModelAttribute("newProject") Project newProject, BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
			model.addAttribute("categories", freelanceSer.getAllCategories());
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			return "newProject.jsp";
		}
		Project p = freelanceSer.createProject(newProject);
		return "redirect:/freelance/projects/" + p.getId();
	}

	@RequestMapping("/freelance/projects/{id}/edit")
	public String editProjectPage(@PathVariable Long id, Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		model.addAttribute("project", freelanceSer.getOneProject(id));
		model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
		model.addAttribute("categories", freelanceSer.getAllCategories());
		model.addAttribute("isClient", true);
		return "editProject.jsp";
	}
	
	@RequestMapping(value = "/freelance/projects/{id}/update", method = RequestMethod.POST)
	public String updateProject(Model model, @Valid @ModelAttribute("project") Project project, BindingResult result, HttpSession session, @PathVariable Long id) {
		if (result.hasErrors()) {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
			model.addAttribute("categories", freelanceSer.getAllCategories());
			return "editProject.jsp";
		}
		freelanceSer.updateProject(project);
		return "redirect:/freelance/projects/" + id;
	}

	@RequestMapping(value = "/freelance/projects/{id}/delete")
	public String deleteProject(@PathVariable Long id, HttpSession session) {
		if(session.getAttribute("user_id").equals(freelanceSer.getOneProject(id).getClient().getId())){
			System.err.println("here");
			freelanceSer.deleteProject(id);
			return "redirect:/freelance/projects";
		}
		return "redirect:/freelance/projects";
	}

	@GetMapping("/freelance/favorites")
	public String favorites(Model model, HttpSession session) {
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", false);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		return "favorites.jsp";
	}

	@GetMapping("/freelance/myprojects")
	public String myProjects(Model model, HttpSession session) {		
		model.addAttribute("categories", freelanceSer.getAllCategories());
		if (session.getAttribute("user_type").equals("freelancer")) {
			Freelancer user = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
			model.addAttribute("user", user);
			model.addAttribute("isClient", false);
			model.addAttribute("projects", freelanceSer.findProjectsByFreelancerId(user.getId()));
		} else {
			Client user = userSer.findClientById((Long) session.getAttribute("user_id"));
			model.addAttribute("user", user);
			model.addAttribute("isClient", true);
			model.addAttribute("projects", freelanceSer.findProjectsByClientId(user.getId()));
		}
		return "myProjects.jsp";
	}

	@RequestMapping(value = "/freelance/myprojects/category/{id}")
	public String filterMyProjectsByCategory(Model model, HttpSession session, @PathVariable Long id) {
		model.addAttribute("categories", freelanceSer.getAllCategories());
		if (session.getAttribute("user_type").equals("freelancer")) {
			Freelancer user = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
			model.addAttribute("user", user);
			model.addAttribute("isClient", false);
			model.addAttribute("projects", freelanceSer.filterMyProjectsByCategory(user.getId(), id, "freelancer"));
		} else {
			Client user = userSer.findClientById((Long) session.getAttribute("user_id"));
			model.addAttribute("user", user);
			model.addAttribute("isClient", true);
			model.addAttribute("projects", freelanceSer.filterMyProjectsByCategory(user.getId(), id, "client"));
		}
		return "myProjects.jsp";
	}

//	question
	@RequestMapping(value = "/freelance/projects/{id}/create/question", method = RequestMethod.POST)
	public String createQuestion(Model model, @PathVariable Long id, @Valid @ModelAttribute("newQuestion") Question newQuestion, BindingResult result,HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("project", freelanceSer.getOneProject(id));
			model.addAttribute("questions", freelanceSer.getAllQuestions(id));
			model.addAttribute("answers", freelanceSer.getAllAnswers());
			if (session.getAttribute("user_type").equals("freelancer")) {
				model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", false);
			} else {
				model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", true);
			}
			return "viewProject.jsp";
		}
		freelanceSer.createQuestion(newQuestion);
		return "redirect:/freelance/projects/" + id;
	}
	
	@RequestMapping(value = "/freelance/projects/{pId}/{qId}/delete")
	public String deleteQuestion(@PathVariable Long pId, @PathVariable Long qId) {
		freelanceSer.deleteQuestion(qId);
		return "redirect:/freelance/projects/"+pId;
	}
	
//	answer
	@RequestMapping(value = "/freelance/projects/{id}/create/answer", method = RequestMethod.POST)
	public String createAnswer(Model model, @PathVariable Long id, @Valid @ModelAttribute("newAnswer") Answer newAnswer, BindingResult result,HttpSession session) {
		if (result.hasErrors()) {
			model.addAttribute("project", freelanceSer.getOneProject(id));
			model.addAttribute("questions", freelanceSer.getAllQuestions(id));
			model.addAttribute("answers", freelanceSer.getAllAnswers());
			if (session.getAttribute("user_type").equals("freelancer")) {
				model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", false);
			} else {
				model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", true);
			}
			return "viewProject.jsp";
		}
		freelanceSer.createAnswer(newAnswer);
		return "redirect:/freelance/projects/" + id;
	}

	@RequestMapping(value = "/freelance/projects/{pId}/{qId}/{aId}/delete")
	public String deleteAnswer(@PathVariable(name = "pId") Long pId, @PathVariable Long qId, @PathVariable Long aId) {
		freelanceSer.deleteAnswer(aId);
		return "redirect:/freelance/projects/"+pId;
	}
	
// 	Category
	@RequestMapping("/freelance/category/new")
	public String newCat(@ModelAttribute("newCategory") Category newCategory, Model model) {
		return "category.jsp";
	}

	@RequestMapping(value="/freelance/category/create",method=RequestMethod.POST)
	public String category(@Valid @ModelAttribute("newCategory") Category newCategory, BindingResult result) {
		if(result.hasErrors()) {
			return "category.jsp";
		}
		freelanceSer.createCategory(newCategory);
		return "redirect:/freelance/category/new";
	}

//    like and unlike
	@RequestMapping(value = "/freelance/projects/{id}/like")
	public String like(@PathVariable Long id, HttpSession session) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.like(u, p);
		return "redirect:/freelance/projects";
	}

	@RequestMapping(value = "/freelance/projects/{id}/unlike/{page}")
	public String unlike(@PathVariable Long id,@PathVariable String page, HttpSession session) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.unlike(u, p);
		return "redirect:/freelance/"+page;
	}
	
	@RequestMapping(value = "/freelance/projects/{id}/client/like")
	public String clientlike(@PathVariable Long id, HttpSession session) {
		Client u = userSer.findClientById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.clientLike(u, p);
		return "redirect:/freelance/projects";
	}

	@RequestMapping(value = "/freelance/projects/{id}/client/unlike/{page}")
	public String clientunlike(@PathVariable Long id,@PathVariable String page, HttpSession session) {
		Client u = userSer.findClientById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.clientUnlike(u, p);
		return "redirect:/freelance/"+page;
	}

	@RequestMapping(value = "/freelance/projects/{id}/likeFromViewProject")
	public String likeFromViewProject(@PathVariable Long id, HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		model.addAttribute("project", p);
		freelanceSer.like(u, p);
		return "redirect:/freelance/projects/" + id;
	}

	@RequestMapping(value = "/freelance/projects/{id}/unlikeFromViewProject")
	public String unlikeFromViewProject(@PathVariable Long id, HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		model.addAttribute("project", p);
		freelanceSer.unlike(u, p);
		return "redirect:/freelance/projects/" + id;
	}

//  offer and withdraw
	@RequestMapping(value = "/freelance/projects/{id}/offer")
	public String offer(@PathVariable Long id, HttpSession session) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.offer(u, p);
		return "redirect:/freelance/projects";
	}

	@RequestMapping(value = "/freelance/projects/{id}/withdraw")
	public String withdraw(@PathVariable Long id, HttpSession session) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.withdraw(u, p);
		return "redirect:/freelance/projects";
	}

	@RequestMapping(value = "/freelance/projects/{id}/offerFromViewProject")
	public String offerFromViewProject(@PathVariable Long id, HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		model.addAttribute("project", p);
		freelanceSer.offer(u, p);
		return "redirect:/freelance/projects/" + id;
	}

	@RequestMapping(value = "/freelance/projects/{id}/withdrawFromViewProject")
	public String withdrawFromViewProject(@PathVariable Long id, HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		model.addAttribute("project", p);
		freelanceSer.withdraw(u, p);
		return "redirect:/freelance/projects/" + id;
	}

//  accept and reject offers
	@RequestMapping(value = "/freelance/projects/{pId}/offer/accept/{fId}")
	public String accept(@PathVariable Long pId, @PathVariable Long fId) {
		Freelancer u = userSer.findFreelancerById(fId);
		Project p = freelanceSer.getOneProject(pId);
		freelanceSer.accept(u, p);
		freelanceSer.changeStatus("Active", p);
		return "redirect:/freelance/projects/" + pId;
	}

	@RequestMapping(value = "/freelance/projects/{pId}/offer/reject/{fId}")
	public String reject(@PathVariable Long pId, @PathVariable Long fId) {
		Freelancer u = userSer.findFreelancerById(fId);
		Project p = freelanceSer.getOneProject(pId);
		freelanceSer.reject(p);
		freelanceSer.withdraw(u, p);
		freelanceSer.changeStatus(null, p);
		return "redirect:/freelance/projects/" + pId;
	}

	@RequestMapping(value = "/freelance/{cId}/{pId}/{status}")
	public String completeProject(@PathVariable Long cId, @PathVariable Long pId, @PathVariable String status) {
		Project p = freelanceSer.getOneProject(pId);
		freelanceSer.changeStatus(status,p);
		return "redirect:/client/profile/"+p.getClient().getId();
	}

// 	Freelancer & client profiles
	@RequestMapping("/freelancer/profile/{id}")
	public String freelancerProfile(@PathVariable Long id, HttpSession session, Model model) {
		if (userSer.findClientById((Long) session.getAttribute("user_id")) == null && (userSer.findFreelancerById((Long) session.getAttribute("user_id")) == null)) {
			System.err.println("here");
			return "redirect:/client/login";
		} 

		Freelancer freelancer = userSer.findFreelancerById(id);
		model.addAttribute("newReview", new ReviewOnFreelancer());
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", false);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		model.addAttribute("freelancer", freelancer);
		return "profile_f.jsp";
	}

	@RequestMapping("/freelancer/profile/{id}/edit")
	public String freelancerEditPage(@PathVariable Long id, HttpSession session, Model model) {
		if(session.getAttribute("user_type").equals("freelancer") && session.getAttribute("user_id").equals(id)){
			model.addAttribute("freelancer", userSer.findFreelancerById(id));
			model.addAttribute("editFreelancer", new Freelancer());
			return "edit_f.jsp";
		}
		return "redirect:/freelance/projects";
	}

	@PostMapping("/freelancer/profile/{id}/update")
	public String updateFreelancer(@Valid @ModelAttribute("editFreelancer") Freelancer editFreelancer,BindingResult result, @PathVariable Long id, Model model) {
		Freelancer freelancer = userSer.findFreelancerById(id);
		if (result.hasErrors()) {
			model.addAttribute("freelancer", freelancer);
			return "edit_f.jsp";
		}
		model.addAttribute("freelancer", freelancer);
		freelanceSer.editFreelancer(editFreelancer,id);
		return "redirect:/freelancer/profile/" + id;
	}

	@RequestMapping("/client/profile/{id}")
	public String clientProfile(@PathVariable Long id, HttpSession session, Model model) {
		Client client = userSer.findClientById(id);
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", false);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		model.addAttribute("newReview", new ReviewOnClient());
		model.addAttribute("client", client);
		return "profile_c.jsp";
	}

	@RequestMapping("/client/profile/{id}/edit")
	public String clientEditPage(@PathVariable Long id, HttpSession session, Model model) {
		if(session.getAttribute("user_type").equals("client") && session.getAttribute("user_id").equals(id)){
			model.addAttribute("client", userSer.findClientById(id));
			model.addAttribute("editClient", new Client());
			return "edit_c.jsp";
		}
		return "redirect:/freelance/projects";
	}

	@PostMapping("/client/profile/{id}/update")
	public String updateClient(@Valid @ModelAttribute("editClient") Client editClient, BindingResult result, @PathVariable Long id, Model model) {
		Client client = userSer.findClientById(id);
		model.addAttribute("client", client);
		if (result.hasErrors()) {
			return "edit_c.jsp";
		}
		freelanceSer.editClient(editClient,id);
		return "redirect:/client/profile/" + id;
	}

	@PostMapping("/freelancer/profile/{freelancerId}/review/create")
	public String createReviewOnfreelancer(@Valid @ModelAttribute("newReview") ReviewOnFreelancer newReview, BindingResult result, @PathVariable Long freelancerId, HttpSession session, Model model) {
		if(result.hasErrors()){
			Freelancer freelancer = userSer.findFreelancerById(freelancerId);
			if (session.getAttribute("user_type").equals("freelancer")) {
				model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", false);
			} else {
				model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", true);
			}
			model.addAttribute("freelancer", freelancer);
			return "profile_f.jsp";
		}
		freelanceSer.reviewFreelancer(newReview);
		return "redirect:/freelancer/profile/" + freelancerId;
	}

	@PostMapping("/client/profile/{clientId}/review/create")
	public String createReviewOnClient(@Valid @ModelAttribute("newReview") ReviewOnClient newReview, BindingResult result, @PathVariable Long clientId, Model model, HttpSession session) {
		if (result.hasErrors()) {
			Client client = userSer.findClientById(clientId);
			if (session.getAttribute("user_type").equals("freelancer")) {
				model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", false);
			} else {
				model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", true);
			}
			model.addAttribute("client", client);
			return "profile_c.jsp";
		}
		freelanceSer.reviewClient(newReview);
		return "redirect:/client/profile/" + clientId;
	}

	@RequestMapping("/freelance/projects/{id}/chating")
	public String chatPage(HttpSession session, @PathVariable Long id, Model model) {
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", false);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		Project project = freelanceSer.getOneProject(id);
		model.addAttribute("newComment", new Comment());
		model.addAttribute("project", project);
		model.addAttribute("comments", freelanceSer.getRelatedComments(project.getId()));
		return "chatRoom.jsp";
	}

	@RequestMapping(value = "/freelance/projects/{id}/chating/create", method = RequestMethod.POST)
	public String createComment(@Valid @ModelAttribute("newComment") Comment newComment, BindingResult result, @PathVariable Long id, Model model,HttpSession session) {
		Project project = freelanceSer.getOneProject(id);
		if (result.hasErrors()) {
			if (session.getAttribute("user_type").equals("freelancer")) {
				model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", false);
			} else {
				model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
				model.addAttribute("isClient", true);
			}
			model.addAttribute("project", project);
			model.addAttribute("comments",freelanceSer.getRelatedComments(project.getId()));
			return "chatRoom.jsp";
		}
		freelanceSer.leaveAComment(newComment);
		return "redirect:/freelance/projects/" + project.getId() + "/chating";
	}
}
