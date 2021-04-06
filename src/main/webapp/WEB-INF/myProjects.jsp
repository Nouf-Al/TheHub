<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<title>My Projects</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/projects/myprojects.css" />
	<link rel="stylesheet" href="/style/menu.css" />
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
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
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
						<a href="/freelance/projects/new"><button class="post-project">+ New Project</button></a>
					</c:if>

					<c:if test="${isClient eq false }">
						<div class="dropdown-right" style="float:right;">
							<div class="dropbtn-right">
								<span class="user-info">
									<span>Hello, </span>${user.firstname }
									<img src="/images/user_pic.svg" id="user-img" alt="user" />
									<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
										<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
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
		<div class=" row p-0 m-0">
			<div class="left-col col-sm-3">
				<c:if test="${isClient eq true}">
					<div class="row">
						<div class="col p-0 m-0 mb-4">
							<a href="/freelance/projects/new" class="btn btn-block form-btn p-3">+ New Project</a>
						</div>
					</div>
				</c:if>

				<div class="row">
					<div class="col p-0 box shadow-sm mb-4">
						<h3 class="box-title">Categories</h3>
						<div class="span box-content">
							<a href="/freelance/myprojects">
								<p class="p-3 mb-3 w-100 shadow-sm">All Projects</p>
							</a>
							<c:forEach items="${categories }" var="category">
								<a href="/freelance/myprojects/category/${category.id}">
									<p class="p-3 mb-3 w-100 shadow-sm">${category.title }</p>
								</a>
							</c:forEach>
						</div>
					</div>					
				</div>
			</div>

			<div class="right-col col-sm p-0 shadow-sm">
				<h3 class="box-title">Projects (${projects.size()})</h3>
				<div class="box-content">
					<c:forEach items="${projects}" var="project">
						<div class="row m-0">
							<div class="col-sm mb-3 section rounded">
								<div class="row m-0 p-0">
									<div class="col m-0 p-0">
										<a href="/freelance/projects/${project.id}"><h3>${project.title}</h3></a>
									</div>
									<div class="col m-0 p-0">
										<div class="float-right">
											<c:choose>
												<c:when test="${project.status eq null }">
													<c:choose>
														<c:when test="${project.isOfferEndDate() eq true}">
															<div class="btn btn-outline-danger">Close</div>
														</c:when>
														<c:otherwise>
															<div class="btn btn-outline-success">Open</div>
														</c:otherwise>
													</c:choose>
												</c:when>
												<c:otherwise>
													<div class="btn btn-outline-primary">${project.status}</div>
												</c:otherwise>
											</c:choose>
										</div>
									</div>
								</div>
				
								<div class="row m-0 p-0 mt-3">
									<div class="col-sm m-0 p-0">
										<p>Submitted offers: ${project.freelancersOffers.size()}</p>
										<p>Posted on:
											<fmt:formatDate value="${project.createdAt }" type="date" pattern="MMM dd, yyyy" />
										</p>
										<p>Duration: ${project.duration} day</p>
									</div>
									<div class="col-sm m-0 p-0">
										<p>Category: ${project.category.title}</p>
										<p>Estimated Budget: ${project.price} SR</p>
										<p>Offer End Date: <fmt:formatDate value="${project.offerEnd }" type="date" pattern="MMM dd, yyyy" /></p>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
</body>
</html>