<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${project.title }</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/projects/viewProject copy.css" />
<link rel="stylesheet" href="/style/menu.css" />
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
		<div class="projects-container">
			<div class="row m-0 p-0">
				<div class="col mb-3 p-0">
					<a href="/freelance/projects" style="font-size: 8; font-size: 14px;">
						<img src="/images/icons/back.png" alt="back"style="width: 7; width: 14px; padding: 3px 2px;"> 
						Back to projects
					</a>
				</div>
			</div>

			<div class="row p-0 m-0 mb-5 shadow-sm border rounded">
				<div class="col-12 m-0 p-4">
					<div class="project-info">
						<div class="row p-0 m-0">
							<div class="col-sm-9 p-0 left-col">
								<div class="row m-0 p-0">
									<div class="col-sm p-0">
										<h3>${project.title }</h3>
									</div>
								</div>
								<div class="row m-0 p-0 mt-2">
									<div class="col d-flex p-0 sub-info">
										<c:choose>
											<c:when test="${project.freelancer ne null }">
												<button class="btn btn-outline-primary">${project.status}</button>
											</c:when>
											<c:otherwise>
												<button class="btn btn-outline-success">Open</button>
											</c:otherwise>
										</c:choose>
									
										<p class="mx-4">${project.category.title}</p>
									
										<p><fmt:formatDate value="${project.createdAt }" type="date" pattern="MMMM dd, yyyy - h:m a" /></h5>
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
										<h3><fmt:formatDate value="${project.offerEnd }" type="date" pattern="MMMM dd, yyyy" /></h3>
										<!-- <h3>${project.calculateDaysLeft()}</h3> -->
										<p id="p">Offer End Date</p>
									</div>
								</div>
							</div>
							<div class="col-sm px-5 right-col">
								<c:choose>
									<c:when test="${isFreelancer eq false }">
										<c:if test="${project.client.id eq user.id }">
											<a href="/freelance/projects/${project.id }/edit" class="btn btn-primary btn-block py-3">Edit</a> 
											<a  href="/freelance/projects/${project.id }/delete" class="btn btn-outline-danger text-danger my-3 btn-block py-3">Delete</a>
										</c:if>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${project.isOffer(user.id) }">
												<a href="/freelance/projects/${project.id }/withdrawFromViewProject" class="btn btn-dark btn-block py-3">Cancel Offer</a>
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${project.freelancer.id ne null }">
														<a href="/freelance/projects/${project.id }/offerFromViewProject" class="btn btn-dark btn-block py-3 disabled">Send Offer</a>
													</c:when>
													<c:otherwise>
														<a href="/freelance/projects/${project.id }/offerFromViewProject" class="btn btn-dark btn-block py-3">Send Offer</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>

										<c:choose>
											<c:when test="${project.isContain(user.id) }">
												<a href="/freelance/projects/${project.id }/unlikeFromViewProject" class="btn btn-outline-danger text-danger my-3 btn-block py-3">Unlike</a>
											</c:when>
											<c:otherwise>
												<a href="/freelance/projects/${project.id }/likeFromViewProject" class="btn btn-outline-danger text-danger my-3 btn-block py-3">Like</a>
											</c:otherwise>
										</c:choose>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
			</div>








			<div class="row p-0 m-0">
				<div class="col-sm p-0 pr-4 left-section">
					<div class="row p-0 m-0">
						<div class="col p-4 mb-4 border rounded shadow-sm">
							<h5 class="font-weight-bold">Description</h5>
							<hr>
							<h5>${project.description }</h5>
						</div>
					</div>

					<c:choose>
						<c:when test="${isFreelancer eq false }">
							<c:if test="${user.id eq project.client.id }">
								<div class="row p-0 m-0">
									<div class="col p-4 mb-4 border rounded shadow-sm">
											<h4 class="font-weight-bold">Answer Questions</h4>
											<hr>
											<h5>You can answer the freelancer's questions, your answer will appear to all freelancers and clients and their questions will be available also.</h5>
											<c:if test="${questions.size() == 0 }">
											<h5>No Questions Yet!</h5>
											<form:form action="/freelance/projects/${project.id}/create/answer" method="post" modelAttribute="newAnswer">
												<div class="row p-0 m-0">
													<div class="col-sm-12 p-0">
														<form:label path="question">Question by:</form:label>
														<select disabled="true" name="question" class="form-control mb-3">
															<c:forEach items="${ questions}" var="question">
																<c:if test="${project.id eq question.project.id }">
																	<option value="${ question.id}">${ question.freelancer.firstname} ${ question.freelancer.lastname}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="row p-0 m-0">
													<div class="col-sm-12 p-0">
														<div class="form-group">
															<form:textarea  disabled="true" path="text" class="form-control" />
															<form:errors path="text" class="text-danger" />
														</div>
													</div>
												</div>
													<input type="submit" style="font-size: 13px;" value="Answer the question" class="btn btn-dark btn-block" disabled="true" /> 
											</form:form>
											</c:if>
											<c:if test="${questions.size() != 0 }">
											<form:form action="/freelance/projects/${project.id}/create/answer" method="post" modelAttribute="newAnswer">
												<div class="row p-0 m-0">
													<div class="col-sm-12 p-0">
														<form:label path="question">Question by:</form:label>
														<select  name="question" class="form-control mb-3">
															<c:forEach items="${ questions}" var="question">
																<c:if test="${project.id eq question.project.id }">
																	<option value="${ question.id}">${ question.freelancer.firstname} ${ question.freelancer.lastname}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="row p-0 m-0">
													<div class="col-sm-12 p-0">
														<div class="form-group">
															<form:textarea  path="text" class="form-control" />
															<form:errors path="text" class="text-danger" />
														</div>
													</div>
												</div>
													<input type="submit" style="font-size: 13px;" value="Answer the question" class="btn btn-dark btn-block"  /> 
											</form:form>
											</c:if>
										
										
									</div>
								</div>
							</c:if>
						</c:when>
						<c:otherwise>
							<div class="row p-0 m-0">
								<div class="col p-4 mb-4 border rounded shadow-sm">
									<h5 class="font-weight-bold">Freelancer Questions</h5>
									<hr>
									<h5>You can ask the client about the project detail's that are not clear to you, your question will appear to all freelancers and their questions will be available also.</h5>
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
										<input type="submit" style="font-size: 13px;" value="Ask the client" class="btn btn-dark btn-block" />
									</form:form>
								</div>
							</div>
						</c:otherwise>
					</c:choose>

					<div class="row p-0 m-0">
						<div class="col p-4 mb-4 border rounded shadow-sm">
							<h5 class="font-weight-bold">All Questions</h5>
							<hr>
							<c:forEach items="${questions }" var="question">
								<c:if test="${project.id eq question.project.id }">
									<div class="questions mt-4">
										<div class="question-header p-3 rounded-top">
											<p class="h6">${question.freelancer.firstname } ${question.freelancer.lastname }</p>
											<p class="h6"><fmt:formatDate value="${question.createdAt }" type="date" pattern="MMMM dd, yyyy - h:m a" /></p>
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
													<p class="h6"><fmt:formatDate value="${answer.createdAt }" type="date" pattern="MMMM dd, yyyy - h:m a" /></p>
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

				<div class="col-sm-3 p-0">
					<div class="row p-0 m-0">
						<div class="col p-4 mb-4 border rounded shadow-sm statistics">
							<h5 class="font-weight-bold">Project Statistics</h5 >
							<hr />
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

					<c:if test="${ isFreelancer ne true}">
						<c:if test="${ project.client.id eq user.id}">
							<div class="row p-0 m-0">
								<div class="col p-4 mb-4 border rounded shadow-sm offers">
									<h5 class="font-weight-bold">Offers</h5>
									<hr />
									<c:forEach items="${project.freelancersOffers}" var="freelancer">
										<div class="row p-0 m-0">
											<div class="col p-0">
												<a href="http://localhost:8080/freelancer/profile/${freelancer.id}"><p>${freelancer.firstname } ${freelancer.lastname }</p></a>
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
						<div class="col p-4 mb-4 border rounded shadow-sm client-info">
							<h5 class="font-weight-bold">Client Info</h5>
							<hr />
							<div class="row p-0 m-0">
								<div class="col text-center my-3">
									<img src="/images/user_pic.svg" alt="user" /> 
									<a href="/client/profile/${project.client.id}"> 
										<p>${project.client.firstname } ${project.client.lastname }</p>
									</a>
									<p>&#9733;&#9733;&#9733;&#9733;&#9733;</p>
									<span>
										<h4>2</h4>
										<h5 class="mb-4">Completed Projects</h5>
										<h4>2</h4>
										<h5 class="mb-4">Opened Projects</h5>
										<h4>2</h4>
										<h5 class="mb-4">In Progress Projects</h5>
									</span>
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