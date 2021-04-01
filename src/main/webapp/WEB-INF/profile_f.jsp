<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>${freelancer.firstname } ${freelancer.lastname }</title>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/profile/profile.css" />
	<link rel="stylesheet" href="/style/menu.css" />
	<script src="https://kit.fontawesome.com/9e73ca32ae.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="nav-container">
		<div class="row menu-row">
			<div class="col p-0 left-menu">
				<h1><a href="/">The Hub</a></h1>
				<div class="items">
					<a href="/freelance/projects">Projects</a>
					<a href="/freelance/freelancers">Freelancers</a>
				</div>
				<div class="dropdown-left" style="float:left;">
					<p class="dropbtn-left">Explore</p>
					<div class="dropdown-content-left" style="left:0;">
						<a href="/freelance/projects">Projects</a>
						<a href="/freelance/freelancers">Freelancers</a>
					</div>
				</div>
			</div>

			<div class="col p-0 right-menu">
				<div class="float-right">
					<c:if test="${isClient eq true }">
						<div class="dropdown-right">
							<div class="dropbtn-right">
								<span class="user-info">
									<span>Hello, </span>${user.firstname }
									<img src="/images/user_pic.svg" id="user-img" alt="user" />
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-chevron-down"
										viewBox="0 0 16 16">
										<path fill-rule="evenodd"
											d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
									</svg>
								</span>
							</div>
							<div class="dropdown-content-right shadow-sm">
								<a href="/freelance/projects/new" id="post-project-menu">New Project</a>
								<a href="/client/profile/${user.id}">Profile</a>
								<a href="/freelance/myprojects">My Projects</a>
								<a href="/freelance/favorites">Favorites</a>
								<a href="/logout">Logout</a>
							</div>
						</div>
						<a href="/freelance/projects/new"><button class="post-project">+ New
								Project</button></a>
					</c:if>

					<c:if test="${isClient eq false }">
						<div class="dropdown-right" style="float:right;">
							<div class="dropbtn-right">
								<span class="user-info">
									<span>Hello, </span>${user.firstname }
									<img src="/images/user_pic.svg" id="user-img" alt="user" />
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
										fill="currentColor" class="bi bi-chevron-down"
										viewBox="0 0 16 16">
										<path fill-rule="evenodd"
											d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
									</svg>
								</span>
							</div>
							<div class="dropdown-content-right shadow-sm">
								<a href="/freelancer/profile/${user.id}">Profile</a>
								<a href="/freelance/myprojects">My Projects</a>
								<a href="/freelance/favorites">Favorites</a>
								<a href="/logout">Logout</a>
							</div>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

	<div class="dashboard-container">
		<div class="row mb-4 mx-0 shadow-sm info">
			<div class="col-sm-3 p-0 d-flex justify-content-center">
				<img class="user-profile-pic" src="/images/user_pic.svg" alt="profile" />
			</div>

			<div class="col-sm p-0">
				<div class="row m-0 p-0">
					<div class="col-sm pb-3">
						<div class="h3 center">${freelancer.firstname } ${freelancer.lastname }</div>
					</div>
				</div>

				<div class="row m-0 p-0">
					<div class="col-sm py-3">
						<div class="h5 center">${freelancer.bio}</div>
					</div>
				</div>

				<div class="row m-0 p-0">
					<div class="col-sm-4 py-3 text-center">
						<div class="m-0 mb-3">
							<c:choose>
								<c:when test="${freelancer.calculateAvgRating() == 1 }">
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${freelancer.calculateAvgRating() == 2 }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${freelancer.calculateAvgRating() == 3 }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${freelancer.calculateAvgRating() == 4 }">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="far fa-star"></i>
								</c:when>
								<c:when test="${freelancer.calculateAvgRating() == 5}">
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
									<i class="fas fa-star"></i>
								</c:when>
								<c:otherwise>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
									<i class="far fa-star"></i>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="h5 m-0 text-center">Rating</div>
					</div>
					<div class="col-sm d-flex py-3">
						<div class="col p-0 text-center ">
							<div class="h2">${freelancer.isStatus(2)}</div>
							<div class="h5">Completed</div>
						</div>
						<div class="col p-0 text-center ">
							<div class="h2">${freelancer.isStatus(1)}</div>
							<div class="h5">Active</div>
						</div>
					</div>
				</div>
			</div>

			<div class="col-sm-1 p-0 text-center">
				<div class="row mx-0">
					<div class="col-sm p-0 py-2 h-50 text-center ">
						<c:if test="${isClient eq false && freelancer.id eq user.id }">
							<a href="/freelancer/profile/${freelancer.id}/edit" class="btn btn-success btn-block px-4">Edit</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>

		<div class="row mx-0">
			<c:if test="${isClient eq false && freelancer.id eq user.id }">
				<div class="col-sm-3 mb-4 p-0 left-section box shadow-sm">
					<div class="col p-0">
						<div class="h4 box-title">Personal Information</div>
						<div class="box-content">
							<div class="personal-info d-flex mb-2">
								<p class="h5">Email</p>
								<p class="h5">: ${freelancer.email }</p>
							</div>
							<div class="personal-info d-flex mb-2">
								<p class="h5">Gender</p>
								<p class="h5">: ${freelancer.gender }</p>
							</div>
							<div class="personal-info d-flex mb-2">
								<p class="h5">Skills</p>
								<p class="h5">: 
									<c:forEach items="${freelancer.skills }" var="skill">
										<span class="badge badge-secondary">${skill.title}</span>
									</c:forEach>
								</p>
							</div>
						</div>
					</div>
				</div>
			</c:if>
			<div class="col-sm p-0 mb-4 right-section">
				<div class="row p-0 m-0 mb-4 shadow-sm box">
					<div class="col p-0">
						<div class="h4 box-title">Projects (${freelancer.projects.size() })</div>
						<div class="row m-0 box-content">
							<c:forEach items="${freelancer.projects }" var="project">
								<div class="col-sm-6 p-2">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title">
												<a href="/freelance/projects/${project.id }">${project.title}</a>
												<span class="h6 float-right">
													<fmt:formatDate value="${project.createdAt }" type="date" pattern="MMM dd, yyyy" />
												</span>
											</h5>
											<p class="card-text"></p>
											<div class="footer">
												<c:choose>
													<c:when test="${project.freelancer ne null }">
														<button class="btn btn-outline-primary">${project.status}</button>
													</c:when>
													<c:otherwise>
														<button class="btn btn-outline-success">Open</button>
													</c:otherwise>
												</c:choose>
												<c:if test="${isClient eq true && user.id eq project.client.id }">
													<img src="/images/icons/like.png" alt="like" class="ml-4 mr-2" />
													<p class="m-0">${project.freelancers_like.size() }</p>
													<p class="m-0 ml-4">${project.freelancersOffers.size() }/30</p>
												</c:if>
											</div>
											<c:if test="${isClient eq true && project.freelancer.id ne null && project.client.id == user.id}">
												<div class="float-right">
													<c:choose>
														<c:when test="${project.status == 'Complete'}">
														</c:when>
														<c:otherwise>
															<a href="/freelance/projects/${project.id }/chating" class="btn btn-dark">Chat with the freelancer</a>
															<a href="/freelance/${client.id}/${project.id }/Complete" class="btn btn-warning">Complete</a>
														</c:otherwise>
													</c:choose>
												</div>
											</c:if>
											<c:if test="${isClient eq false && project.freelancer.id == user.id}">
												<div class="float-right"> 
													<c:choose>
														<c:when test="${project.status == 'Complete'}">
														</c:when>
														<c:otherwise>
															<a href="/freelance/projects/${project.id }/chating" class="btn btn-dark">Chat with the client</a>
														</c:otherwise>
													</c:choose>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<c:if test="${ isClient eq true}">
					<div class="row m-0 mb-4 shadow-sm box">
						<div class="col p-0">
							<div class="h4 box-title">Clients reviews</div>
							<div class="row m-0 box-content">
								<div class="col-12 p-2">
									<form:form action="/freelancer/profile/${freelancer.id}/review/create" method="post" modelAttribute="newReview">
										<div class="row">
											<div class="col-sm-12">
												<div class="form-group">
													<form:textarea path="text" class="form-control" />
													<form:errors path="text" class="text-danger" />
												</div>
											</div>
										</div>
										<select class="form-control" name="rating">
											<option value="1">&#9733;&#9734;&#9734;&#9734;&#9734;</option>
											<option value="2">&#9733;&#9733;&#9734;&#9734;&#9734;</option>
											<option value="3">&#9733;&#9733;&#9733;&#9734;&#9734;</option>
											<option value="4">&#9733;&#9733;&#9733;&#9733;&#9734;</option>
											<option value="5">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
										</select>
										<input type="hidden" name="freelancer" value="${freelancer.id }" />
										<input type="hidden" name="client" value="${user.id }" />
										<input type="submit" value="Send Your Review" class="btn btn-block form-btn mt-3" />
									</form:form>
								</div>
							</div>
						</div>
					</div>
				</c:if>

				<div class="row m-0 shadow-sm box">
					<div class="col p-0">
						<div class="h4 box-title">Reviews (${freelancer.reviewsOnFreelancer.size()})</div>
						<div class="row m-0 box-content">
							<div class="col-12 p-2">
								<c:forEach items="${freelancer.reviewsOnFreelancer }" var="review">
									<div class="col-sm-12 p-2">
										<h5 class="card-title box-title bg">
											<a href="/client/profile/${review.client.id}" class="text-light">${review.client.firstname} ${review.client.lastname}</a>
											<span class="h6 float-right text-light">
												<fmt:formatDate value="${review.createdAt }" type="date" pattern="MMM dd, yyyy" />
											</span>
										</h5>
										<div class="box-content bg-1">
											<c:choose>
												<c:when test="${review.rating == 1 }">
													<i class="fas fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
												</c:when>
												<c:when test="${review.rating == 2 }">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
												</c:when>
												<c:when test="${review.rating == 3 }">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="far fa-star"></i>
													<i class="far fa-star"></i>
												</c:when>
												<c:when test="${review.rating == 4 }">
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="far fa-star"></i>
												</c:when>
												<c:otherwise>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
													<i class="fas fa-star"></i>
												</c:otherwise>
											</c:choose>
											<p class="card-text mt-3">${review.text }</p>
										</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>