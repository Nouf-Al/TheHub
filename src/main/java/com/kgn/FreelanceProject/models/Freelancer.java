package com.kgn.FreelanceProject.models;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "freelancers")
public class Freelancer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

//	@NotEmpty(message = "First Name is required!")
	@Size(min = 3, message = "First Name must be at least 3 characters.")
	private String firstname;

//	@NotEmpty(message = "Last Name is required!")
	@Size(min = 3, message = "Last Name must be at least 3 characters.")
	private String lastname;

	@NotEmpty(message = "Email is required!")
	@Email(message = "Please enter a valid email!")
	private String email;

//	@NotEmpty(message = "Gender is required.")
	private String gender;

	@Column(nullable = true, length = 64)
	private String photos;

	private String bio;
	
	@NotEmpty(message = "City is required.")
	private String city;

	@NotEmpty(message = "Country is required.")
	private String country;

	@Size(min = 8, message = "Password must be at least 8 characters.")
	private String password;

	@Transient
	@Size(min = 8, message = "Confirm password must be at least 8 characters.")
	private String confirm;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	private String speciality;

	@OneToMany(mappedBy = "freelancer", fetch = FetchType.LAZY)
	private List<Project> projects;

	@ManyToMany(fetch = FetchType.LAZY)
    @JoinTable(
        name = "offers", 
        joinColumns = @JoinColumn(name = "freelancer_id"), 
        inverseJoinColumns = @JoinColumn(name = "project_id")
    )
    private List<Project> projectOffers;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "likes", joinColumns = @JoinColumn(name = "freelancer_id"), inverseJoinColumns = @JoinColumn(name = "project_id"))
	private List<Project> projects_likes;
	
	@OneToMany(mappedBy="freelancer", fetch = FetchType.LAZY)
    private List<Question> questions;

	@OneToMany(mappedBy = "freelancer", fetch = FetchType.LAZY)
	private List<ReviewOnFreelancer> reviewsOnFreelancer;

	@OneToMany(mappedBy = "freelancer", fetch = FetchType.LAZY)
	private List<ReviewOnClient> reviewsOnClient;
	
	@OneToMany(mappedBy = "freelancer", fetch = FetchType.LAZY)
	private List<Comment> comments;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "freelancers_skills", joinColumns = @JoinColumn(name = "freelancer_id"), inverseJoinColumns = @JoinColumn(name = "skill_id"))
	private List<Skill> skills;
	
	@Transient
	private String skillString;

	public Freelancer() {
	}

	public String getSpeciality() {
		return speciality;
	}

	public void setSpeciality(String speciality) {
		this.speciality = speciality;
	}

	public List<Project> getProjects() {
		return projects;
	}

	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}

	public List<Project> getProjects_likes() {
		return projects_likes;
	}

	public void setProjects_likes(List<Project> projects_likes) {
		this.projects_likes = projects_likes;
	}

	public List<Project> getProjectOffers() {
		return projectOffers;
	}

	public void setProjectOffers(List<Project> projectOffers) {
		this.projectOffers = projectOffers;
	}

	public List<Question> getQuestions() {
		return questions;
	}

	public void setQuestions(List<Question> questions) {
		this.questions = questions;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}

	public List<Skill> getSkills() {
		return skills;
	}

	public void setSkills(List<Skill> skills) {
		this.skills = skills;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getFirstname() {
		return firstname;
	}

	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}

	public String getLastname() {
		return lastname;
	}

	public void setLastname(String lastname) {
		this.lastname = lastname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public String getSkillString() {
		return skillString;
	}

	public void setSkillString(String skillString) {
		this.skillString = skillString;
	}

	public List<Skill> returnTheNoExistingSkill(List<Skill> allSkills) {
		ArrayList<Skill> theProperSkills = new ArrayList<Skill>();
		boolean exists = false;
		for (Skill skill0 : allSkills) {
			exists = false;
			for (Skill skill : this.skills) {
				if (skill.equals(skill0)) {
					exists = true;
				}
			}

			if (!exists) {
				theProperSkills.add(skill0);
			}
		}
		return theProperSkills;
	}

	public List<ReviewOnFreelancer> getReviewsOnFreelancer() {
		return reviewsOnFreelancer;
	}

	public void setReviewsOnFreelancer(List<ReviewOnFreelancer> reviewsOnFreelancer) {
		this.reviewsOnFreelancer = reviewsOnFreelancer;
	}

	public List<ReviewOnClient> getReviewsOnClient() {
		return reviewsOnClient;
	}

	public void setReviewsOnClient(List<ReviewOnClient> reviewsOnClient) {
		this.reviewsOnClient = reviewsOnClient;
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

}
