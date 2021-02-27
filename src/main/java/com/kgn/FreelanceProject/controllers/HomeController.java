package com.kgn.FreelanceProject.controllers;

import java.text.DecimalFormat;
import java.util.Date;
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
	public String index(Model model) {
		model.addAttribute("newUser", new Client());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}

//    register freelancer
	@RequestMapping(value = "/freelancer/register", method = RequestMethod.POST)
	public String registerFreelancer(HttpSession session, @Valid @ModelAttribute("newUser") Freelancer newUser,
			BindingResult result, Model model) {
		userSer.registerFreelancer(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register_f.jsp";
		} else {
			session.setAttribute("user_id", newUser.getId());
			session.setAttribute("user_type", "freelancer");
			return "redirect:/freelancer/login";
		}
	}

	@RequestMapping("/freelancer/register")
	public String registerFreelancerPage(HttpSession session, Model model) {
		model.addAttribute("newUser", new Client());
		model.addAttribute("newLogin", new LoginUser());
		return "register_f.jsp";
	}

//   register client 
	@RequestMapping(value = "/client/register", method = RequestMethod.POST)
	public String registerClient(HttpSession session, @Valid @ModelAttribute("newUser") Client newUser,
			BindingResult result, Model model) {
		userSer.registerClient(newUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "register_c.jsp";
		} else {
			session.setAttribute("user_id", newUser.getId());
			session.setAttribute("user_type", "client");
			return "redirect:/client/login";
			
		}
	}

	@RequestMapping("/client/register")
	public String registerClientPage(HttpSession session, Model model) {
		model.addAttribute("newUser", new Client());
		model.addAttribute("newLogin", new LoginUser());
		return "register_c.jsp";
	}

// login freelancer
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

//    login client
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

//    @RequestMapping("/home")
//	public String home(HttpSession session, Model model) {
//		// if we're logged in we get back a user
//    	Client loggedInUser = userSer.findById((Long) session.getAttribute("user_id"));
//		if(loggedInUser == null) {
//			// if the user is null return them to the login form
//			return "redirect:/";
//		}
//		model.addAttribute("user", loggedInUser);
//    	System.out.print(session.getAttribute("user_type"));
//		return "home.jsp";
//	}

	@RequestMapping("/freelance/freelancers")
	public String allFreelancers(Model model, HttpSession session) {
		if (userSer.findFreelancerById((Long) session.getAttribute("user_id")) == null && userSer.findClientById((Long) session.getAttribute("user_id")) == null) {
			return "redirect:/";
		} else {
			model.addAttribute("freelancers", freelanceSer.getAllFreelancers());
			if (session.getAttribute("user_type").equals("freelancer")) {
				model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
				model.addAttribute("isFreelancer", true);
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
			model.addAttribute("isFreelancer", false);
			model.addAttribute("isClient", false);
			if (session.getAttribute("user_type").equals("freelancer")) {
				model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
				model.addAttribute("isFreelancer", true);
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
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
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
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		return "projects.jsp";
	}

	@RequestMapping("/freelance/projects/new")
	public String newProjectPage(@ModelAttribute("newProject") Project newProject, HttpSession session, Model model) {
		Client u = userSer.findClientById((Long) session.getAttribute("user_id"));
		model.addAttribute("user", u);
		List<Category> c = freelanceSer.getAllCategories();
		model.addAttribute("categories", c);
		model.addAttribute("isClient", true);
		return "newProject.jsp";
	}

	@RequestMapping(value = "/freelance/projects/create", method = RequestMethod.POST)
	public String createProject(Model model, @Valid @ModelAttribute("newProject") Project newProject,
			BindingResult result, HttpSession session) {
		if (result.hasErrors()) {
			List<Category> c = freelanceSer.getAllCategories();
			model.addAttribute("categories", c);
			return "newProject.jsp";
		}
		Project p = freelanceSer.createProject(newProject);
		return "redirect:/freelance/projects/" + p.getId();
	}

	@RequestMapping("/freelance/projects/{id}")
	public String viewProject(Model model, HttpSession session, @PathVariable(value = "id") Long id,
			@ModelAttribute(name = "newQuestion") Question newQuestion, @ModelAttribute(name = "newAnswer") Answer newAnswer) {
		model.addAttribute("project", freelanceSer.getOneProject(id));
		model.addAttribute("questions", freelanceSer.getAllQuestions());
		model.addAttribute("answers", freelanceSer.getAllAnswers());
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		model.addAttribute("isClose", false);
		model.addAttribute("user_id", session.getAttribute("user_id"));

		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		Date date = new Date();
		if (date.compareTo(freelanceSer.getOneProject(id).getOfferEnd()) > 0) {
			model.addAttribute("isClose", true);
		} else {
			model.getAttribute("isClose");
		}
		return "viewProject.jsp";
	}

//	@RequestMapping("/freelance/projects/{id}/edit")
//	public String editProjectPage(@PathVariable("id") Long id, @ModelAttribute("editProject") Project editProject, HttpSession session, Model model) {
//		if (session.getAttribute("user_id") == null) {
//			return "redirect:/";
//		}
//		Client u = userSer.findClientById((Long) session.getAttribute("user_id"));
//		model.addAttribute("project", freelanceSer.getOneProject(id));
//		model.addAttribute("user", u);		
//		Map<Long,String> category = new LinkedHashMap<Long,String>();
//		List<Category> c = freelanceSer.getAllCategories();
//		for(int i=0; i<c.size();i++) {
//			category.put(c.get(i).getId(), c.get(i).getTitle());
//		}
//	    model.addAttribute("categoriesList", category);
//		model.addAttribute("isClient", true);
//		return "editProject.jsp";
//	}
	
	@RequestMapping("/freelance/projects/{id}/edit")
	public String editProjectPage(@PathVariable(value = "id") Long id, Model model, HttpSession session) {
		if (session.getAttribute("user_id") == null) {
			return "redirect:/";
		}
		Client u = userSer.findClientById((Long) session.getAttribute("user_id"));
		model.addAttribute("project", freelanceSer.getOneProject(id));
		model.addAttribute("user", u);
		List<Category> c = freelanceSer.getAllCategories();
		model.addAttribute("categories", c);
		model.addAttribute("isClient", true);
		return "editProject.jsp";
	}
	
	@RequestMapping(value = "/freelance/projects/{id}/update", method = RequestMethod.POST)
	public String updateProject(Model model, @Valid@ModelAttribute("project") Project project, BindingResult result, HttpSession session,
			@PathVariable("id") Long id) {
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());			
			model.addAttribute("project", freelanceSer.getOneProject(id));
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			List<Category> c = freelanceSer.getAllCategories();
			model.addAttribute("categories", c);
			model.addAttribute("isClient", true);
			return "editProject.jsp";
		} else {
			freelanceSer.updateProject(project);
			return "redirect:/freelance/projects/" + id;
		}
	}

	@RequestMapping(value = "/freelance/projects/{id}/delete")
	public String deleteProject(@PathVariable(name = "id") Long id) {
		freelanceSer.deleteProject(id);
		return "redirect:/freelance/projects";
	}

	@GetMapping("/freelance/favorites")
	public String favorites(Model model, HttpSession session) {		
		// model.addAttribute("projects", freelanceSer.getAllProjects());
		// model.addAttribute("categories", freelanceSer.getAllCategories());
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		return "favorites.jsp";
		
	}

	@GetMapping("/freelance/myprojects")
	public String myProjects(Model model, HttpSession session) {		
		model.addAttribute("categories", freelanceSer.getAllCategories());
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			Client user = userSer.findClientById((Long) session.getAttribute("user_id"));
			model.addAttribute("user", user);
			model.addAttribute("isClient", true);
			model.addAttribute("projects", freelanceSer.findByClientId(user.getId()));

		}
		return "myProjects.jsp";
		
	}

	@RequestMapping(value = "/freelance/myprojects/category/{id}")
	public String filterMyProjectsByCategory(Model model, HttpSession session, @PathVariable Long id) {
		model.addAttribute("categories", freelanceSer.getAllCategories());
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			Client user = userSer.findClientById((Long) session.getAttribute("user_id"));
			model.addAttribute("user", user);
			model.addAttribute("isClient", true);
			model.addAttribute("projects", freelanceSer.filterMyProjectsByCategory(user.getId(), id));
		}
		return "myProjects.jsp";
	}

//	question
	@RequestMapping(value = "/freelance/projects/{id}/create/question", method = RequestMethod.POST)
	public String createQuestion(Model model, @PathVariable(value = "id") Long id,
			@Valid @ModelAttribute("newQuestion") Question newQuestion, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("project", freelanceSer.getOneProject(id));
			return "viewProject.jsp";
		}
		Question q = freelanceSer.createQuestion(newQuestion);
		return "redirect:/freelance/projects/" + id;
	}
	
	@RequestMapping(value = "/freelance/projects/{pId}/{qId}/delete")
	public String deleteQuestion(@PathVariable(name = "pId") Long pId, @PathVariable(name = "qId") Long qId) {
		freelanceSer.deleteQuestion(qId);
		return "redirect:/freelance/projects/"+pId;
	}
	
//	answer
	@RequestMapping(value = "/freelance/projects/{id}/create/answer", method = RequestMethod.POST)
	public String createAnswer(Model model, @PathVariable(value = "id") Long id,
			@Valid @ModelAttribute("newAnswer") Answer newAnswer, BindingResult result) {
		if (result.hasErrors()) {
			model.addAttribute("project", freelanceSer.getOneProject(id));
			return "viewProject.jsp";
		}
		Answer a = freelanceSer.createAnswer(newAnswer);
		return "redirect:/freelance/projects/" + id;
	}
	
	@RequestMapping(value = "/freelance/projects/{pId}/{qId}/{aId}/delete")
	public String deleteAnswer(@PathVariable(name = "pId") Long pId, @PathVariable(name = "qId") Long qId, @PathVariable(name = "aId") Long aId) {
		freelanceSer.deleteAnswer(aId);
		return "redirect:/freelance/projects/"+pId;
	}
	
//  not needed
//    @RequestMapping("/api/freelance/category/new")
//	public String newCat(@ModelAttribute("newCategory") Category newCategory, Model model) {
//		return "category.jsp";
//	}
//    
//    @RequestMapping(value="/api/freelance/category/create",method=RequestMethod.POST)
//	public String category(@Valid @ModelAttribute("newCategory") Category newCategory, BindingResult result) {
//		if(result.hasErrors()) {
//			return "category.jsp";
//		}
//		freelanceSer.createCategory(newCategory);
//		return "redirect:/api/freelance/category/new";
//	}

//    like and unlike
	@RequestMapping(value = "/freelance/projects/{id}/like")
	public String like(@PathVariable(value = "id") Long id, HttpSession session) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.like(u, p);
		return "redirect:/freelance/projects";
	}

	@RequestMapping(value = "/freelance/projects/{id}/unlike/{page}")
	public String unlike(@PathVariable(value = "id") Long id,@PathVariable(value = "page") String page, HttpSession session) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.unlike(u, p);
		return "redirect:/freelance/"+page;
	}
	@RequestMapping(value = "/freelance/projects/{id}/client/like")
	public String clientlike(@PathVariable(value = "id") Long id, HttpSession session) {
		Client u = userSer.findClientById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.clientLike(u, p);
		return "redirect:/freelance/projects";
	}

	@RequestMapping(value = "/freelance/projects/{id}/client/unlike/{page}")
	public String clientunlike(@PathVariable(value = "id") Long id,@PathVariable(value = "page") String page, HttpSession session) {
		Client u = userSer.findClientById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.clientUnlike(u, p);
		return "redirect:/freelance/"+page;
	}

	@RequestMapping(value = "/freelance/projects/{id}/likeFromViewProject")
	public String likeFromViewProject(@PathVariable(value = "id") Long id, HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		model.addAttribute("project", p);
		freelanceSer.like(u, p);
		return "redirect:/freelance/projects/" + id;
	}

	@RequestMapping(value = "/freelance/projects/{id}/unlikeFromViewProject")
	public String unlikeFromViewProject(@PathVariable(value = "id") Long id, HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		model.addAttribute("project", p);
		freelanceSer.unlike(u, p);
		return "redirect:/freelance/projects/" + id;
	}

//  offer and withdraw
	@RequestMapping(value = "/freelance/projects/{id}/offer")
	public String offer(@PathVariable(value = "id") Long id, HttpSession session) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.offer(u, p);
		return "redirect:/freelance/projects";
	}

	@RequestMapping(value = "/freelance/projects/{id}/withdraw")
	public String withdraw(@PathVariable(value = "id") Long id, HttpSession session) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		freelanceSer.withdraw(u, p);
		return "redirect:/freelance/projects";
	}

	@RequestMapping(value = "/freelance/projects/{id}/offerFromViewProject")
	public String offerFromViewProject(@PathVariable(value = "id") Long id, HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		model.addAttribute("project", p);
		freelanceSer.offer(u, p);
		return "redirect:/freelance/projects/" + id;
	}

	@RequestMapping(value = "/freelance/projects/{id}/withdrawFromViewProject")
	public String withdrawFromViewProject(@PathVariable(value = "id") Long id, HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById((Long) session.getAttribute("user_id"));
		Project p = freelanceSer.getOneProject(id);
		model.addAttribute("project", p);
		freelanceSer.withdraw(u, p);
		return "redirect:/freelance/projects/" + id;
	}

//  accept and reject offers
	@RequestMapping(value = "/freelance/projects/{pId}/offer/accept/{fId}")
	public String accept(@PathVariable(value = "pId") Long pId, @PathVariable(value = "fId") Long fId, HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById(fId);
		Project p = freelanceSer.getOneProject(pId);
		freelanceSer.accept(u, p);
		model.addAttribute("project", p);
		return "redirect:/freelance/projects/" + pId;
	}

	@RequestMapping(value = "/freelance/projects/{pId}/offer/reject/{fId}")
	public String reject(@PathVariable(value = "pId") Long pId, @PathVariable(value = "fId") Long fId,
			HttpSession session, Model model) {
		Freelancer u = userSer.findFreelancerById(fId);
		Project p = freelanceSer.getOneProject(pId);
		freelanceSer.reject(p);
		freelanceSer.withdraw(u, p);
		model.addAttribute("project", p);
		return "redirect:/freelance/projects/" + pId;
	}

	@RequestMapping("/freelancer/profile/{id}")
	public String freelancerProfile(@PathVariable Long id, HttpSession session, Model model) {
		Freelancer freelancer = userSer.findFreelancerById(id);
		model.addAttribute("newReview", new ReviewOnFreelancer());
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		model.addAttribute("user_id", session.getAttribute("user_id"));
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		model.addAttribute("freelancer", freelancer);
		model.addAttribute("rating", new DecimalFormat("#").format(freelanceSer.findFreelancerAvgRating(id)));
		// System.out.println(freelanceSer.findFreelancerAvgRating(id));
		return "profile_f.jsp";
	}

	@RequestMapping("/freelancer/profile/{idx}/edit")
	public String freelancerEditPage(@PathVariable Long idx, HttpSession session, Model model) {
		Freelancer freelancer = userSer.findFreelancerById(idx);
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		model.addAttribute("user_id", session.getAttribute("user_id"));

		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		model.addAttribute("freelancer", freelancer);
		model.addAttribute("editFreelancer", new Freelancer());
		return "edit_f.jsp";
	}

	@PostMapping("/freelancer/profile/{id}/update")
	public String freelancerEdit(@Valid @ModelAttribute("editFreelancer") Freelancer editFreelancer, BindingResult result,
			@PathVariable Long id, HttpSession session, Model model) {
		Freelancer freelancer = userSer.findFreelancerById(id);
		model.addAttribute("freelancer", freelancer);
		System.out.println("here");
		if (result.hasErrors()) {
			model.addAttribute("freelancer", freelancer);
			System.out.println(result);
			return "edit_f.jsp";
		}
		freelanceSer.editFreelancer(editFreelancer);
		return "redirect:/freelancer/profile/" + id;

	}

	@RequestMapping("/client/profile/{id}")
	public String clientProfile(@PathVariable Long id, HttpSession session, Model model) {
		Client client = userSer.findClientById(id);
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		model.addAttribute("user_id", session.getAttribute("user_id"));
		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		model.addAttribute("newReview", new ReviewOnClient());
		model.addAttribute("client", client);
		model.addAttribute("rating", new DecimalFormat("#").format(freelanceSer.findClientAvgRating(id)));
		System.out.println(freelanceSer.findClientAvgRating(id));
		return "profile_c.jsp";
	}

	@RequestMapping("/client/profile/{id}/edit")
	public String cEditPage(@PathVariable Long id, HttpSession session, Model model) {
		Client client = userSer.findClientById(id);
		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);
		model.addAttribute("user_id", session.getAttribute("user_id"));

		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}
		model.addAttribute("client", client);
		model.addAttribute("editClient", new Client());
		return "edit_c.jsp";
	}

	@PostMapping("/client/profile/{id}/update")
	public String cEdit(@Valid @ModelAttribute("editClient") Client editClient, BindingResult result,
			@PathVariable Long id, HttpSession session, Model model) {
		Client client = userSer.findClientById(id);
		model.addAttribute("client", client);

		if (result.hasErrors()) {
			model.addAttribute("client", client);
			return "edit_c.jsp";
		}
		freelanceSer.EditClient(editClient);
		return "redirect:/client/profile/" + id;

	}

	@PostMapping("/freelancer/profile/{freelancerId}/review/create")
	public String reviewf(@Valid @ModelAttribute("newReview") ReviewOnFreelancer newReview, BindingResult result,
			@PathVariable Long freelancerId, HttpSession session, Model model) {
		freelanceSer.reviewFreelancer(newReview);
		return "redirect:/freelancer/profile/" + freelancerId;
	}

	@PostMapping("/client/profile/{clientId}/review/create")
	public String reviewc(@Valid @ModelAttribute("newReview") ReviewOnClient newReview, BindingResult result,
			@PathVariable Long clientId, HttpSession session, Model model) {
		freelanceSer.reviewClient(newReview);
		return "redirect:/client/profile/" + clientId;
	}

	@RequestMapping("/freelance/projects/{id}/chating")
	public String chatPage(HttpSession session, @PathVariable Long id, Model model) {

		model.addAttribute("isFreelancer", false);
		model.addAttribute("isClient", false);

		if (session.getAttribute("user_type").equals("freelancer")) {
			model.addAttribute("user", userSer.findFreelancerById((Long) session.getAttribute("user_id")));
			model.addAttribute("isFreelancer", true);
		} else {
			model.addAttribute("user", userSer.findClientById((Long) session.getAttribute("user_id")));
			model.addAttribute("isClient", true);
		}

		Project project = freelanceSer.getOneProject(id);
		model.addAttribute("newComment", new Comment());
		model.addAttribute("project", project);
		System.out.println(project.getFreelancer().getId());
		model.addAttribute("comments", freelanceSer.getProperComments(project.getFreelancer(), project.getClient()));
		return "chatRoom.jsp";
	}

	@RequestMapping(value = "/freelance/projects/{id}/chating/create", method = RequestMethod.POST)
	public String comment(@Valid @ModelAttribute("newComment") Comment newComment, BindingResult result,
			@PathVariable Long id, HttpSession session, Model model) {
		Project project = freelanceSer.getOneProject(id);
		if (result.hasErrors()) {
			model.addAttribute("project", project);
			model.addAttribute("comments",
					freelanceSer.getProperComments(project.getFreelancer(), project.getClient()));
			return "chatRoom.jsp";
		}
		freelanceSer.leaveAComment(newComment);
		return "redirect:/freelance/projects/" + project.getId() + "/chating";
	}
}
