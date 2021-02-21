package com.kgn.FreelanceProject.models;
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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.FutureOrPresent;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "projects")
public class Project {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

//	@NotEmpty(message = "Title is required.")
	@Size(min=3, message = "Title must be at least 3 characters.")
	private String title;

//	@NotEmpty(message = "Description is required.")
	@Size(min=3,message = "Description must be at least 3 characters.")
	private String description;

	@NotNull(message = "Offer end date is required.")
	@FutureOrPresent(message="Offer end date must be in future.")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date offerEnd;

	@NotNull(message = "Duration is required.")
	@Min(value = 2, message="Duration must be at least 2 days.")
	private int duration;

	@NotNull(message = "Price is required.")
	@Min(value = 1, message = "Price must be more than 0.")
	private double price;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	private Category category;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "client_id")
	private Client client;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "freelancer_id")
	private Freelancer freelancer;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "likes", joinColumns = @JoinColumn(name = "project_id"), inverseJoinColumns = @JoinColumn(name = "freelancer_id"))
	private List<Freelancer> freelancers_like;

	

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "offers", joinColumns = @JoinColumn(name = "project_id"), inverseJoinColumns = @JoinColumn(name = "freelancer_id"))
	private List<Freelancer> freelancers_offer;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "questions", joinColumns = @JoinColumn(name = "project_id"), inverseJoinColumns = @JoinColumn(name = "freelancer_id"))
	private List<Freelancer> freelancers_questions;

	@OneToMany(mappedBy = "project", fetch = FetchType.LAZY)
	private List<Comment> comments;
	public Project() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getOfferEnd() {
		return offerEnd;
	}

	public void setOfferEnd(Date offerEnd) {
		this.offerEnd = offerEnd;
	}

	public int getDuration() {
		return duration;
	}

	public void setDuration(int duration) {
		this.duration = duration;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Client getClient() {
		return client;
	}

	public void setClient(Client client) {
		this.client = client;
	}

	public Freelancer getFreelancer() {
		return freelancer;
	}

	public void setFreelancer(Freelancer freelancer) {
		this.freelancer = freelancer;
	}

	public List<Freelancer> getFreelancers_like() {
		return freelancers_like;
	}

	public void setFreelancers_like(List<Freelancer> freelancers_like) {
		this.freelancers_like = freelancers_like;
	}
	// public List<Client> getClients_like() {
	// 	return clients_like;
	// }

	// public void setClients_like(List<Client> clients_like) {
	// 	this.clients_like = clients_like;
	// }

	public List<Freelancer> getFreelancers_offer() {
		return freelancers_offer;
	}

	public void setFreelancers_offer(List<Freelancer> freelancers_offer) {
		this.freelancers_offer = freelancers_offer;
	}

	public List<Freelancer> getFreelancers_questions() {
		return freelancers_questions;
	}

	public void setFreelancers_questions(List<Freelancer> freelancers_questions) {
		this.freelancers_questions = freelancers_questions;
	}

	@PrePersist
	protected void onCreate() {
		this.createdAt = new Date();
	}

	@PreUpdate
	protected void onUpdate() {
		this.updatedAt = new Date();
	}

	public Boolean isContain(Long id) {
		for (Freelancer u : freelancers_like) {
			if(u.getId() == id) {
				return true;
			}
		}
		return false;
	}
	
	public Boolean isOffer(Long id) {
		for (Freelancer u : freelancers_offer) {
			if(u.getId() == id) {
				return true;
			}
		}
		return false;
	}
	
	public int count(Long p_id) {
		int count = 0 ;
		for (Freelancer u : freelancers_offer) {
			if(getId() == p_id) {
				count++;
			}
		}
		return count;
	}

	public List<Comment> getComments() {
		return comments;
	}

	public void setComments(List<Comment> comments) {
		this.comments = comments;
	}
	
}