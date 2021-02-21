<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${client.firstname } ${client.lastname }</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/profile/profile.css" />
<link rel="stylesheet" href="/style/menu.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<div class="nav-container ">
		<div class="row p-0 menu-row">
			<div class="col p-0 left-menu">
				<h1 id="logo"><a href="/">Freelance</a></h1>
				<div class="items mr-4">
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
						<a href="/freelance/projects/new"><button class="post-project">+ Project</button></a>
						<div class="dropdown-right" style="float:right;">
							<div class="dropbtn-right">
								<span class="user-info">
									${user.firstname } ${user.lastname }
									<img src="/images/user_pic.svg" id="user-img" alt="user" />
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
					</c:if>

					<c:if test="${isClient eq false }">
						<div class="dropdown-right" style="float:right;">
							<div class="dropbtn-right">
								<span class="user-info">
									${user.firstname } ${user.lastname }
									<img src="/images/user_pic.svg" id="user-img" alt="user" />
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
		<div class="row my-4 mx-0 p-5 rounded shadow-sm border">
			<div class="col-sm-3 p-0 d-flex justify-content-center">
				<img class="user-profile-pic m-3" src="/images/icons/user.png" alt="profile" />
			</div>
			<div class="col-sm-2 p-0">
				<div class="row mx-0">
					<div class="col-sm p-0">
						<div class="h3 text-center">${client.firstname } ${client.lastname }</div>
					</div>
				</div>
				<div class="row mx-0">
					<div class="col-sm p-0 py-2 h-50 text-center ">
						<div class="h2 m-0">*****</div>
						<div class="h5 m-0">Rating</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm p-0">
				<div class="row mx-0">
					<div class="col-sm p-0 d-flex user-loc">
						<img class="location" alt="location" src="/images/icons/location.png">
						<div class="h4">${client.city}</div>
					</div>
				</div>
				
				<div class="row mx-0">
					<div class="col-4 p-0 text-center ">
						<div class="h2">4</div>
						<div class="h5">Completed</div>
					</div>
					<div class="col-4 p-0 text-center ">
						<div class="h2">2</div>
						<div class="h5">Open</div>
					</div>
					<div class="col-4 p-0 text-center ">
						<div class="h2">8</div>
						<div class="h5">In Progress</div>
					</div>
				</div>
			</div>
			
			<div class="col-sm-1 p-0 text-center">
				<div class="row mx-0">
					<div class="col-sm p-0 py-2 h-50 text-center ">
						<c:if test="${isClient eq true && client.id eq user.id }">
							<a href="/client/profile/${client.id}/edit" class="btn btn-success px-4">Edit</a>
						</c:if>
					</div>
				</div>
			</div>
		</div>
		
		<div class="row mx-0">
			<c:if test="${isClient eq true && client.id eq user.id }">
				<div class="col-sm-3 mb-4 p-0 bg-light rounded shadow-sm border left-section">
					<div class="col py-3">
						<div class="h4">Personal Information</div>
						<hr>
						<div class="personal-info d-flex mb-2">
							<p class="h5">Email</p>
							<p class="h5">:  ${client.email }</p>
						</div>
						<div class="personal-info d-flex mb-2">
							<p class="h5">Gender</p>
							<p class="h5">:  ${client.gender }</p>
						</div>
						
						<div class="personal-info d-flex mb-2">
							<p class="h5">Nationality</p>
							<p class="h5">:  ${client.country }</p>
						</div>
						
						<div class="personal-info d-flex mb-2">
							<p class="h5">City</p>
							<p class="h5">:  ${client.city }</p>
						</div>
					</div>
				</div>
			</c:if>
			<div class="col-sm p-0 mb-4 right-section">
				<div class="row p-0 m-0 mb-4 rounded shadow-sm border">
					<div class="col py-3">
						<div class="h4">Projects (${client.projects.size() })</div>
						<hr>
						
						<div class="row p-0 m-0">
							<c:forEach items="${client.projects }" var="project">
								<div class="col-sm-6 p-2">
									<div class="card">
										<div class="card-body">
											<h5 class="card-title"><a href="/freelance/projects/${project.id }">${project.title }</a><span class="h6 float-right"><fmt:formatDate value="${project.createdAt }" type="date" pattern="MMMM dd, yyyy" /></span></h5>
											<p class="card-text"></p>
											<div class="footer">
												<a href="/freelance/projects/${project.id }" class="btn btn-outline-success">Open</a>
												<c:if test="${isClient eq true && user.id eq project.client.id }">
													<img src="/images/icons/like.png" alt="like" class="ml-4 mr-2"/> <p class="m-0">${project.freelancers_like.size() }</p>
													<p class="m-0 ml-4">${project.freelancers_offer.size() }/30</p>
												</c:if>
											</div>
											<c:if test="${isClient eq true && project.freelancer.id ne null && project.client.id == user.id}">
												<div class="float-right">
													<a href="/freelance/projects/${project.id }/chating" class="btn btn-primary">Chat with the freelancer</a>
												</div>
											</c:if>
											<c:if test="${isClient eq false && project.freelancer.id == user.id}">
												<div class="float-right">
													<a href="/freelance/projects/${project.id }/chating" class="btn btn-primary">Chat with the client</a>
												</div>
											</c:if>
										</div>
									</div>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="row p-0 m-0 mt-4 rounded shadow-sm border">
					<div class="col py-3">
						<div class="h4">Freelancers reviews</div>
						<hr>
						<div class="row p-0 m-0">
							<div class="col-12 p-2">
								<form:form action="/freelance/projects/${client.id }/review/client" method="post" modelAttribute="newReview">
									<c:choose>
										<c:when test="${isClient eq true }">
										<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<form:textarea path="text" class="form-control" readonly="true" />
														<form:errors path="text" class="text-danger" />
													</div>
												</div>
											</div>
											<select class="form-control" name="rating" readonly="true" >
												<option value="1">&#9733;&#9734;&#9734;&#9734;&#9734;</option>
												<option value="2">&#9733;&#9733;&#9734;&#9734;&#9734;</option>
												<option value="3">&#9733;&#9733;&#9733;&#9734;&#9734;</option>
												<option value="4">&#9733;&#9733;&#9733;&#9733;&#9734;</option>
												<option value="5">&#9733;&#9733;&#9733;&#9733;&#9733;</option>
											</select>
											<input type="submit" value="Send Your Review" class="btn btn-dark btn-block mt-3" disabled="true" />											
										</c:when>
										<c:otherwise>
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
											<input type="hidden" name="reviewedClient" value="${client.id }" />
											<input type="hidden" name="freelancerReviewer" value="${user.id }" />
											<input type="submit" value="Send Your Review" class="btn btn-dark btn-block mt-3" />
										</c:otherwise>
									</c:choose>
								</form:form>
							</div>
						</div>
						
						<div class="h4 mt-5">Reviews (${client.freelancerReviewers.size()})</div>
						<hr>
						<div class="row p-0 m-0">
							<div class="col-12 p-2">
								<c:forEach items="${client.reviewsOnClient }" var="rev">
									<div class="col-sm-12 p-2">
										<div class="card">
											<div class="card-body">
												<h5 class="card-title">
													<a href="/freelancer/profile/${rev.freelancerReviewer.id}">${rev.freelancerReviewer.firstname} ${rev.freelancerReviewer.lastname}</a>
													<span class="h6 float-right"><fmt:formatDate value="${rev.createdAt }" type="date" pattern="MMMM dd, yyyy" /></span>
												</h5>
												<c:choose>
													<c:when test="${rev.rating == 1 }">
														<h5>&#9733;&#9734;&#9734;&#9734;&#9734;</h5>
													</c:when>
													<c:when test="${rev.rating == 2 }">
														<h5>&#9733;&#9733;&#9734;&#9734;&#9734;</h5>
													</c:when>
													<c:when test="${rev.rating == 3 }">
														<h5>&#9733;&#9733;&#9733;&#9734;&#9734;</h5>
													</c:when>
													<c:when test="${rev.rating == 4 }">
														<h5>&#9733;&#9733;&#9733;&#9733;&#9734;</h5>
													</c:when>
													<c:otherwise>
														<h5>&#9733;&#9733;&#9733;&#9733;&#9733;</h5>
													</c:otherwise>
												</c:choose>
												<p class="card-text">${rev.text }</p>
											</div>
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