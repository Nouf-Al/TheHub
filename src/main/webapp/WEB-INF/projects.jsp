<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Projects</title>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/projects/projects.css" />
	<link rel="stylesheet" href="/style/menu.css" />
	<script src="https://kit.fontawesome.com/9e73ca32ae.js" crossorigin="anonymous"></script>
</head>
<body>
	<div class="nav-container">
		<div class="row menu-row">
			<div class="col p-0 left-menu">
				<h1><a href="/">The Hub</a></h1>
				<div class="items">
					<a class="active-page" href="/freelance/projects">Projects</a>
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

	<div class="dashboard-container shadow-sm">
		<div class="projects-container">
			<div class="row p-0 m-0">
				<div class="left-col col-sm-3 px-0">
					<div class="categories-container shadow-sm">
						<h3 data-toggle="collapse" data-target="#demo">Categories</h3>
						<div id="demo" class="collapse show">
							<c:forEach items="${categories }" var="category">
								<div class="span">
									<a class="p-3 my-1 w-100" href="/freelance/projects/category/${category.id}">
										<p class="p-0 m-0">${category.title }</p>
									</a>
								</div>
							</c:forEach>
						</div>
					</div>
				</div>

				<div class="right-col col-sm p-0">
					<div class="row m-0">
						<div class="col-12 p-0">
							<div class="search-container">
								<form action="/search" method="post">
									<div class="row m-0 p-0">
										<div class="col-sm-10 pl-0 search-input">
											<input type="search" placeholder="Search for projects" class="form-control shadow-sm" name="title" />
										</div>
										<div class="col-sm-2 px-0">
											<input type="submit" class="btn btn-dark btn-block shadow-sm" value="Search" />
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>

					<div class="row m-0">
						<div class="col-12 p-0">
							<c:forEach items="${projects }" var="project">
								<div class="project mt-4">
									<div class="card shadow-sm">
										<div class="header">
											<div class="row">
												<div class="col">
													<a href="/freelance/projects/${project.id}">
														<h3>${project.title }</h3>
													</a>
												</div>
												<div class="col">
													<p class="float-right time">
														<fmt:formatDate value="${project.createdAt }" type="date" pattern="MMM dd, yyyy - h:m a" />
													</p>
												</div>
											</div>
											<div class="row">
												<div class="col">
													<p class="m-0 p-0">${project.category.title }</p>
												</div>
											</div>
										</div>
										<div class="body">
											<p>${project.description }</p>
										</div>
										<div class="footer m-0 p-0">
											<hr />
											<div class="block">
												<div class="row">
													<div class="col-3">
														<p>Deadline</p>
														<p>${project.calculateDaysLeft()} days left</p>
													</div>
													<div class="col-3">
														<p>Offers</p>
														<p>${project.freelancersOffers.size()}</p>
													</div>
													<div class="col-6">
														<span class="float-right col3">
															<c:if test="${ isClient eq false}">
																<c:choose>
																	<c:when test="${project.isContain(user.id) }"> 
																		${project.freelancers_like.size() + project.clients_like.size()}
																		<a href="/freelance/projects/${project.id }/unlike/projects">
																			<img src="/images/icons/like.png" alt="like" />
																		</a>
																	</c:when>
																	<c:otherwise>
																		${project.freelancers_like.size() + project.clients_like.size()}
																		<a href="/freelance/projects/${project.id}/like">
																			<img src="/images/icons/unlike.png" alt="unlike" />
																		</a>
																	</c:otherwise>
																</c:choose>

																<c:choose>
																	<c:when test="${project.isOffer(user.id) }">
																		<c:if test="${project.freelancer.id eq user.id}">
																			<button class="btn btn-outline-danger disabled">Cancel Offer</button>
																		</c:if>
																		<c:if test="${project.freelancer.id ne user.id}">
																			<a href="/freelance/projects/${project.id }/withdraw" class="btn btn-outline-danger">Cancel Offer</a>
																		</c:if>
																	</c:when>
																	<c:otherwise>
																		<c:choose>
																			<c:when test="${ project.isOfferEndDate() eq false}">
																				<c:if test="${project.freelancer.id ne null}">
																					<button class="btn btn-outline-success disabled">Send Offer</button>
																				</c:if>
																				<c:if test="${project.freelancer.id eq null}">
																					<a href="/freelance/projects/${project.id }/offer" class="btn btn-outline-success">Send Offer</a>
																				</c:if>
																			</c:when>
																			<c:otherwise>
																				<button class="btn btn-outline-danger disabled">Close</button>
																			</c:otherwise>
																		</c:choose>
																	</c:otherwise>
																</c:choose>
															</c:if>
															<c:if test="${isClient eq true}">
																<c:choose>
																	<c:when test="${project.isClientContain(user.id) }">
																		${project.freelancers_like.size() + project.clients_like.size() }
																		<a href="/freelance/projects/${project.id }/client/unlike/projects">
																			<img src="/images/icons/like.png" alt="like" />
																		</a>
																	</c:when>
																	<c:otherwise>
																		${project.freelancers_like.size() + project.clients_like.size()}
																		<a href="/freelance/projects/${project.id}/client/like">
																			<img src="/images/icons/unlike.png" alt="unlike" />
																		</a>
																	</c:otherwise>
																</c:choose>
															</c:if>
														</span>
													</div>
												</div>
											</div>
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
</body>
</html>