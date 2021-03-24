<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<title>${project.title }</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/projects/viewProject.css" />
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
		<div class="projects-container">
			<div class="row m-0 p-0">
				<div class="col mb-4 p-0">
					<a href="/freelance/projects" class="back-link">Back to projects</a>
				</div>
			</div>

			<div class="row p-0 m-0 mb-4 mt-3">
				<div class="col-12 m-0 project shadow-sm">
					<div class="project-info">
						<div class="row p-0 m-0">
							<div class="col-sm p-0 left-col">
								<div class="row m-0 p-0">
									<div class="col-sm p-0">
										<h3 style=" font-size: 1.8rem; margin-bottom: 7px; ">${project.title }</h3>
									</div>
								</div>
								<div class="row m-0 p-0 mt-2">
									<div class="col d-flex p-0 sub-info">
										<c:choose>
											<c:when test="${project.freelancer ne null }">
												<button class="btn btn-outline-primary">${project.status}</button>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${isClose eq true }">
														<button class="btn btn-outline-danger">Close</button>
													</c:when>
													<c:otherwise>
														<button class="btn btn-outline-success">Open</button>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										<p class="mx-4">${project.category.title}</p>
										<p><fmt:formatDate value="${project.createdAt }" type="date" pattern="MMM dd, yyyy - h:m a" /></p>
									</div>
								</div>

								<div class="row p-0 m-0 mt-5 py-2">
									<div class="col-sm-4 text-center">
										<h3>${project.price } SR</h3>
										<p id="p">Estimated Budget (SR)</p>
									</div>
									<div class="col-sm-4 border border-dark text-center border-top-0 border-bottom-0">
										<h3>${project.duration }</h3>
										<p id="p">Duration (Day)</p>
									</div>
									<div class="col-sm-4 text-center">
										<h3> <fmt:formatDate value="${project.offerEnd }" type="date" pattern="MMM dd, yyyy" /> </h3>
										<p id="p">Offer End Date</p>
									</div>
								</div>
							</div>
							<c:choose>
								<c:when test="${isFreelancer eq false }">
									<c:if test="${project.client.id eq user.id }">
										<div class="col-sm-3 px-5 right-col">
											<a href="/freelance/projects/${project.id }/edit" class="btn btn-outline-success btn-block py-3">Edit</a>
											<a href="/freelance/projects/${project.id }/delete" class="btn btn-outline-danger my-3 btn-block py-3">Delete</a>
										</div>
									</c:if>
								</c:when>
								<c:otherwise>
									<div class="col-sm-3 px-5 right-col">
										<c:choose>
											<c:when test="${project.isOffer(user.id) }">
												<a href="/freelance/projects/${project.id }/withdrawFromViewProject" class="btn btn-outline-danger btn-block py-3">Cancel Offer</a>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${project.freelancer.id ne null }">
														<a href="/freelance/projects/${project.id }/offerFromViewProject" class="btn btn-outline-success btn-block py-3 disabled">Send Offer</a>
													</c:when>
													<c:otherwise>
														<a href="/freelance/projects/${project.id }/offerFromViewProject" class="btn btn-outline-success btn-block py-3">Send Offer</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${project.isContain(user.id) }">
												<a href="/freelance/projects/${project.id }/unlikeFromViewProject" class="btn btn-danger my-3 btn-block py-3">Unfavorite</a>
											</c:when>
											<c:otherwise>
												<a href="/freelance/projects/${project.id }/likeFromViewProject" class="btn btn-outline-danger my-3 btn-block py-3">Favorite</a>
											</c:otherwise>
										</c:choose>
									</div>
								</c:otherwise>
							</c:choose>
						</div>
					</div>
				</div>
			</div>

			<div class="row p-0 m-0">
				<div class="col-sm p-0 pr-4 left-section">
					<div class="row p-0 m-0">
						<div class="col p-0 mb-4 box shadow-sm">
							<h5 class="font-weight-bold box-title">Description</h5>
							<h5 class="box-content m-0">${project.description }</h5>
						</div>
					</div>
					<c:choose>
						<c:when test="${isFreelancer eq false }">
							<c:if test="${user.id eq project.client.id }">
								<div class="row p-0 m-0">
									<div class="col p-0 mb-4 box shadow-sm">
										<h5 class="font-weight-bold box-title">Answer Questions</h5>
										<div class="box-content">
											<h5>You can answer the freelancer's questions, your answer
												will appear to all freelancers and clients and their
												questions will be available also.</h5>
											<c:if test="${questions.size() == 0 }">
												<h5>No Questions Yet!</h5>
												<form:form action="/freelance/projects/${project.id}/create/answer" method="post" modelAttribute="newAnswer">
													<div class="row p-0 m-0">
														<div class="col-sm-12 p-0">
															<form:label path="question">Question by:
															</form:label>
															<select disabled="true" name="question"
																class="form-control mb-3">
																<c:forEach items="${ questions}" var="question">
																	<c:if test="${project.id eq question.project.id }">
																		<option value="${ question.id}">${question.freelancer.firstname} ${question.freelancer.lastname}</option>
																	</c:if>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="row p-0 m-0">
														<div class="col-sm-12 p-0">
															<div class="form-group">
																<form:textarea disabled="true" path="text" class="form-control" />
																<form:errors path="text" class="text-danger" />
															</div>
														</div>
													</div>
													<input type="submit" value="Send your answer" class="btn btn-block form-btn" disabled="true" />
												</form:form>
											</c:if>
											<c:if test="${questions.size() != 0 }">
												<form:form action="/freelance/projects/${project.id}/create/answer" method="post" modelAttribute="newAnswer">
													<div class="row p-0 m-0">
														<div class="col-sm-12 p-0">
															<form:label path="question">Question by: </form:label>
															<select name="question" class="form-control mb-3">
																<c:forEach items="${ questions}" var="question">
																	<c:if test="${project.id eq question.project.id }">
																		<option value="${ question.id}">${question.freelancer.firstname} ${question.freelancer.lastname}</option>
																	</c:if>
																</c:forEach>
															</select>
														</div>
													</div>
													<div class="row p-0 m-0">
														<div class="col-sm-12 p-0">
															<div class="form-group">
																<form:textarea path="text" class="form-control" />
																<form:errors path="text" class="text-danger" />
															</div>
														</div>
													</div>
													<input type="submit" value="Send your answer" class="btn btn-block form-btn" />
												</form:form>
											</c:if>
										</div>
									</div>
								</div>
							</c:if>
						</c:when>
						<c:otherwise>
							<div class="row p-0 m-0">
								<div class="col p-0 mb-4 box shadow-sm">
									<h5 class="font-weight-bold box-title">Freelancer Questions</h5>
									<div class="box-content">
										<h5>You can ask the client about the project detail's that are
											not clear to you, your question will appear to all
											freelancers and their questions will be available also.</h5>
										<form:form action="/freelance/projects/${project.id}/create/question" method="post" modelAttribute="newQuestion">
											<div class="row p-0 m-0">
												<div class="col-sm-12 p-0">
													<div class="form-group">
														<form:textarea path="text" class="form-control" />
														<form:errors path="text" class="text-danger" />
													</div>
												</div>
											</div>
											<input type="hidden" name="project" value="${project.id }" />
											<input type="hidden" name="freelancer" value="${user_id }" />
											<input type="submit" value="Ask the client" class="btn btn-block form-btn" />
										</form:form>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="row p-0 m-0">
						<div class="col p-0 mb-4 box shadow-sm">
							<h5 class="font-weight-bold box-title">All Questions</h5>
							<div class="box-content">
								<c:forEach items="${questions }" var="question">
									<c:if test="${project.id eq question.project.id }">
										<div class="questions">
											<div class="question-header p-3 rounded-top">
												<p class="h6">${question.freelancer.firstname } ${question.freelancer.lastname }</p>
												<p class="h6">
													<fmt:formatDate value="${question.createdAt }" type="date" pattern="MMM dd, yyyy - h:m a" />
												</p>
											</div>
											<div class="question-body p-3 rounded-bottom">
												<p style="font-size: 14px;">${question.text }</p>
												<c:if test="${ isFreelancer eq true}">
													<c:if test="${user.id eq question.freelancer.id }">
														<div class="text-right">
															<a class="btn btn-light" href="/freelance/projects/${project.id}/${question.id}/delete"><img style="width: 16px;" src="/images/icons/delete.png" alt="delete question"></a>
														</div>
													</c:if>
												</c:if>
											</div>
										</div>
									</c:if>
									<c:forEach items="${answers }" var="answer">
										<c:if test="${project.id eq answer.question.project.id }">
											<c:if test="${answer.question.id eq question.id }">
												<div class="answers mt-4 ml-5">
													<div class="answer-header p-3 rounded-top">
														<p class="h6">${project.client.firstname } ${project.client.lastname }</p>
														<p class="h6">
															<fmt:formatDate value="${answer.createdAt }" type="date" pattern="MMM dd, yyyy - h:m a" />
														</p>
													</div>
													<div class="answer-body p-3 rounded-bottom">
														<p style="font-size: 14px;">${answer.text }</p>
														<c:if test="${ isFreelancer eq false}">
															<c:if test="${user.id eq question.project.client.id }">
																<div class="text-right">
																	<a class="btn btn-light" href="/freelance/projects/${project.id}/${question.id}/${answer.id}/delete"><img style="width: 16px;" src="/images/icons/delete.png" alt="delete question"></a>
																</div>
															</c:if>
														</c:if>
													</div>
												</div>
											</c:if>
										</c:if>
									</c:forEach>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="col-sm-3 p-0">
					<div class="row p-0 m-0">
						<div class="col p-0 mb-4 box shadow-sm statistics">
							<h5 class="font-weight-bold box-title">Project Statistics</h5>
							<div class="box-content">
								<div class="row p-0 m-0">
									<div class="col p-0">
										<p>Offers Count</p>
									</div>
									<div class="col-2 p-0">
										<p>${project.freelancersOffers.size()}</p>
									</div>
								</div>
								<div class="row p-0 m-0">
									<div class="col p-0">
										<p>Users Views</p>
									</div>
									<div class="col-2 p-0">
										<p>7</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<c:if test="${ isFreelancer ne true}">
						<c:if test="${ project.client.id eq user.id}">
							<div class="row p-0 m-0">
								<div class="col p-4 mb-4 box shadow-sm offers">
									<h5 class="font-weight-bold">Offers</h5>
									<hr />
									<c:forEach items="${project.freelancersOffers}" var="freelancer">
										<div class="row p-0 m-0">
											<div class="col p-0">
												<a href="/freelancer/profile/${freelancer.id}">
													<p>${freelancer.firstname } ${freelancer.lastname }</p>
												</a>
											</div>
											<div class="col p-0 text-right">
												<c:choose>
													<c:when test="${project.freelancer.id eq null }">
														<a href="/freelance/projects/${project.id }/offer/accept/${freelancer.id}" class="btn btn-success mr-1">Accept</a>
														<a href="/freelance/projects/${project.id }/offer/reject/${freelancer.id}" class="btn btn-danger">Reject</a>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${project.freelancer.id eq freelancer.id }">
																<a href="/freelance/projects/${project.id }/offer/accept/${freelancer.id}" class="btn btn-success mr-1 disabled">Accept</a>
																<a href="/freelance/projects/${project.id }/offer/reject/${freelancer.id}" class="btn btn-danger">Reject</a>
															</c:when>
															<c:otherwise>
																<a href="/freelance/projects/${project.id }/offer/accept/${freelancer.id}" class="btn btn-success mr-1 disabled">Accept</a>
																<a href="/freelance/projects/${project.id }/offer/reject/${freelancer.id}" class="btn btn-danger disabled">Reject</a>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>
											</div>
										</div>
									</c:forEach>
								</div>
							</div>
						</c:if>
					</c:if>

					<div class="row p-0 m-0">
						<div class="col p-0 mb-4 box shadow-sm client-info">
							<h5 class="font-weight-bold box-title">Client Info</h5>
							<div class="box-content">
								<div class="row p-0 m-0">
									<div class="col text-center my-3">
										<img src="/images/user_pic.svg" alt="user" />
										<a href="/client/profile/${project.client.id}">
											<p>${project.client.firstname } ${project.client.lastname }</p>
										</a>
										<c:choose>
											<c:when test="${rating == 1 }">
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rating == 2 }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rating == 3 }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rating == 4 }">
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="fas fa-star"></i>
												<i class="far fa-star"></i>
											</c:when>
											<c:when test="${rating == 5}">
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
										<span>
											<h5 class="mt-4">${project.client.isStatus(2)}</h5>
											<h5 class="mb-4">Completed Projects</h5>
											<h5>${project.client.isStatus(1)}</h5>
											<h5 class="mb-4">Active Projects</h5>
											<h5>${project.client.isStatus(0)}</h5>
											<h5 class="mb-4">Open Projects</h5>
										</span>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>