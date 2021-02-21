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
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Size;
import javax.xml.bind.Marshaller.Listener;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name = "reviewsOnFreelancers")
public class ReviewOnFreelancer {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	private int rating;

	private String text;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "client_id")
	private Client clientReviewer;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "freelancer_id")
	private Freelancer reviewedFreelancer;

	@Column(updatable = false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date updatedAt;

	public ReviewOnFreelancer() {
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public Client getClientReviewer() {
		return clientReviewer;
	}

	public void setClientReviewer(Client clientReviewer) {
		this.clientReviewer = clientReviewer;
	}

	public Freelancer getReviewedFreelancer() {
		return reviewedFreelancer;
	}

	public void setReviewedFreelancer(Freelancer reviewedFreelancer) {
		this.reviewedFreelancer = reviewedFreelancer;
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

	
	
}




















