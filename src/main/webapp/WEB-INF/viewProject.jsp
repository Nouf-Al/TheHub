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
<link rel="stylesheet" href="/style/projects/project.css" />
<link rel="stylesheet" href="/style/menu.css" />
</head>
<body>
	<div class="nav-container ">
		<div class="menu-row row">
			<div class="col p-0 m-0">
				<div class="left">
					<h1 id="logo">
						<a href="/">Freelance</a>
					</h1>
					<div class="links">
						<a href="/freelance/projects">Projects</a> <a
							href="/freelance/freelancers">Freelancers</a>
					</div>
				</div>
			</div>
			<div class="col p-0 m-0 ">
				<span class="float-right"> <c:if test="${isClient eq true }">
						<a href="/freelance/projects/new"><button class="post-project">+
								Project</button></a>
					</c:if> <span class="user-info"> <a
						href="/client/profile/${user.id}">${user.firstname }
							${user.lastname }</a> <img src="/images/user_pic.svg" alt="user" />
				</span>
				</span>
			</div>
		</div>
	</div>


	<div class="dashboard-container">
		<div class="projects-container">
			<div class="row m-0 p-0">
				<div class="col mb-3 p-0">
					<a href="/freelance/projects" style="font-size: 8; ont-size: 14px;"><img
						src="/images/icons/back.png" alt="back"
						style="width: 7; width: 14px; padding: 3px 2px;"> Back to
						projects</a>
				</div>
			</div>
			<div class="row p-0 mb-5 shadow-sm">
				<div class="col-12 m-0 p-0">
					<div class="project">
						<div class="card">
							<div class="header">
								<div class="row">
									<div class="col-9">
										<div class="row m-0 p-0">
											<div class="col m-0 p-0">
												<h3>${project.title }</h3>
											</div>
										</div>

										<div class="row m-0 p-0">
											<div class="row m-0 p-0">
												<div class="col  m-0 p-0">
													<div class="sub-info">

														<c:choose>
															<c:when test="${project.freelancer ne null }">
																<button class="btn btn-outline-danger">Close</button>
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

														<p>${project.category.title }</p>
														<p>
															<fmt:formatDate value="${project.createdAt }" type="date" pattern="MMMM dd, yyyy - h:m a" />
														</p>
													</div>
												</div>
											</div>
										</div>
										<div class="row">
											<div class="blocks">
												<div class="block">
													<h3>${project.price }SR</h3>
													<p id="p">Estimated Budget</p>
												</div>
												<div class="block"
													style="border-left: 0.1px solid; border-right: 0.1px solid;">
													<h3>${project.duration }</h3>
													<p id="p">Duration</p>
												</div>
												<div class="block">
													<h3>
														<fmt:formatDate value="${project.offerEnd }" type="date"
															pattern="MMMM dd, yyyy" />
													</h3>
													<p id="p">Offer End Date</p>
												</div>
											</div>
										</div>
									</div>

									<div class="col-3 ">

										<c:choose>
											<c:when test="${isFreelancer eq false }">
												<c:if test="${project.client.id eq user.id }">
													<a href="/freelance/projects/${project.id }/edit"
														class="btn btn-dark btn-block">Edit</a>
													<a href="/freelance/projects/${project.id }/delete"
														class="btn btn-danger btn-block">Delete</a>
												</c:if>
											</c:when>
											<c:otherwise>

												<c:choose>
													<c:when test="${project.isOffer(user.id) }">
														<a
															href="/freelance/projects/${project.id }/withdrawFromViewProject"
															class="btn btn-dark btn-block">Cancel Offer</a>
													</c:when>
													<c:otherwise>
														<c:choose>
															<c:when test="${project.freelancer.id ne null }">
																<a
																	href="/freelance/projects/${project.id }/offerFromViewProject"
																	class="btn btn-dark btn-block disabled">Send Offer</a>
															</c:when>
															<c:otherwise>
																<a
																	href="/freelance/projects/${project.id }/offerFromViewProject"
																	class="btn btn-dark btn-block">Send Offer</a>
															</c:otherwise>
														</c:choose>
													</c:otherwise>
												</c:choose>

												<c:choose>
													<c:when test="${project.isContain(user.id) }">
														<a
															href="/freelance/projects/${project.id }/unlikeFromViewProject"
															class="btn btn-danger btn-block">Unlike</a>
													</c:when>
													<c:otherwise>
														<a
															href="/freelance/projects/${project.id }/likeFromViewProject"
															class="btn btn-danger btn-block">Like</a>
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
										<!-- <a href="/client/profile/${project.client.id }" class="btn btn-dark btn-block h1">View Profile</a> -->

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row p-0 m-0">
				<div class="col-9 p-0 m-0">
					<div class="row p-0 mb-5">
						<div class="col-9 p-0 m-0 ">
							<div class="description-card shadow-sm">
								<div class="header">
									<h5 class="font-weight-bold">Description</h5>
								</div>
								<hr>
								<h5>${project.description }</h5>
							</div>

						</div>
					</div>

					<c:choose>
						<c:when test="${isFreelancer eq false }">
							<c:if test="${user.id eq project.client.id }">
								<div class="row p-0 mb-5">
									<div class="col-9 p-0 m-0">
										<div class="description-card shadow-sm">
											<h5 class="font-weight-bold">Answer Questions</h5>
											<hr>
											<h5>You can answer the freelancer's questions, your answer will appear to all freelancers and clients and their questions will be available also.</h5>
											<!-- 
											<form:form action="/freelance/projects/${project.id}/create/question" method="post" modelAttribute="newQuestion">
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<form:textarea path="text" class="form-control"
															readonly="true" />
														<form:errors path="text" class="text-danger" />
													</div>
												</div>
											</div>
											<input type="hidden" name="project" value="${project.id }" />
											<input type="hidden" name="freelancer" value="${user_id }" />
											<input type="submit" value="Ask the client" class="btn btn-dark btn-block" disabled="true" />
											 </form:form>
											 -->
											<form:form action="/freelance/projects/${project.id}/create/answer" method="post" modelAttribute="newAnswer">
												<div class="row">
													<div class="col-sm-12">
														<form:label path="question">Question by:</form:label>
														<select name="question" class="form-control mb-3">
															<c:forEach items="${ questions}" var="question">
																<c:if test="${project.id eq question.project.id }">
																	<option value="${ question.id}">${ question.freelancer.firstname} ${ question.freelancer.lastname}</option>
																</c:if>
															</c:forEach>
														</select>
													</div>
												</div>
												<div class="row">
													<div class="col-sm-12">
														<div class="form-group">
															<form:textarea path="text" class="form-control" />
															<form:errors path="text" class="text-danger" />
														</div>
													</div>
												</div>
												<input type="submit" value="Answer the question" class="btn btn-dark btn-block" />
											</form:form>
										</div>
									</div>
								</div>
							</c:if>
						</c:when>
						<c:otherwise>
							<div class="row p-0 mb-5">
								<div class="col-9 p-0 m-0">
									<div class="description-card shadow-sm">
										<h5 class="font-weight-bold">Freelancer Questions</h5>
										<hr>
										<h5>You can ask the client about the project detail's
											that are not clear to you, your question will appear to all
											freelancers and their questions will be available also.</h5>
										<form:form action="/freelance/projects/${project.id}/create/question" method="post" modelAttribute="newQuestion">
											<div class="row">
												<div class="col-sm-12">
													<div class="form-group">
														<form:textarea path="text" class="form-control" />
														<form:errors path="text" class="text-danger" />
													</div>
												</div>
											</div>
											<input type="hidden" name="project" value="${project.id }" />
											<input type="hidden" name="freelancer" value="${user_id }" />
											<input type="submit" value="Ask the client" class="btn btn-dark btn-block" />
										</form:form>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
		<div class="row p-0 mb-5">
			<div class="col m-0 p-0">
				<div class="description-card shadow-sm">
					<h5 class="font-weight-bold">All Questions</h5>
					<hr>
					<c:forEach items="${questions }" var="question">
						<c:if test="${project.id eq question.project.id }">

							<div class="questions mt-4">
								<div class="question-header">
									<p class="h6">${question.freelancer.firstname }
										${question.freelancer.lastname }</p>
									<p class="h6">
										<fmt:formatDate value="${question.createdAt }" type="date"
											pattern="MMMM dd, yyyy - h:m a" />
									</p>
								</div>
								<div class="question-body">
									<p style="font-size: 15px;">${question.text }</p>
									<c:if test="${ isFreelancer eq true}">
										<c:if test="${user.id eq question.freelancer.id }">
											<div class="text-right">
												<a class="btn btn-danger"
													href="/freelance/projects/${project.id}/${question.id}/delete">Delete</a>
											</div>
										</c:if>
									</c:if>
								</div>
							</div>
						</c:if>
						<c:forEach items="${answers }" var="answer">
							<c:if test="${project.id eq answer.question.project.id }">
								<c:if test="${answer.question.id eq question.id }">
									<div class="answers mt-4">
										<div class="answer-header">
											<p class="h6">${project.client.firstname }
												${project.client.lastname }</p>
											<p class="h6">
												<fmt:formatDate value="${answer.createdAt }" type="date"
													pattern="MMMM dd, yyyy - h:m a" />
											</p>
										</div>
										<div class="answer-body">
											<p style="font-size: 15px;">${answer.text }</p>
											<c:if test="${ isFreelancer eq false}">
												<c:if test="${user.id eq question.project.client.id }">
													<div class="text-right">
														<a class="btn btn-danger"
															href="/freelance/projects/${project.id}/${question.id}/${answer.id}/delete">Delete</a>
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

	<div class="col-3 p-0 m-0">
		<div class="row mb-5">
			<div class="categories-container shadow-sm">
				<h3>Project Statistics</h3>
				<hr />
				<div class="row">
					<div class="col">
						<p>Offers Count</p>
					</div>
					<div class="col">
						<p>${project.count(project.id) }</p>
					</div>
				</div>
				<div class="row">
					<div class="col">
						<p>Users Views</p>
					</div>
					<div class="col">
						<p>7</p>
					</div>
				</div>
			</div>
		</div>


		<c:if test="${ isFreelancer ne true}">
			<c:if test="${ project.client.id eq user.id}">
				<div class="row mb-5">
					<div class="categories-container shadow-sm">
						<h3>Offers</h3>
						<hr />
						<c:forEach items="${project.freelancers_offer}" var="freelancer">
							<div class="row">
								<div class="col">
									<a
										href="http://localhost:8080/freelancer/profile/${freelancer.id}"><p>${freelancer.firstname }
											${freelancer.lastname }</p></a>
								</div>
								<div class="col">
									<c:choose>
										<c:when test="${project.freelancer.id eq null }">
											<a
												href="/freelance/projects/${project.id }/offer/accept/${freelancer.id}"
												class="btn btn-success mr-1">Accept</a>
											<a
												href="/freelance/projects/${project.id }/offer/reject/${freelancer.id}"
												class="btn btn-danger disabled">Reject</a>
										</c:when>
										<c:otherwise>
											<c:choose>
												<c:when test="${project.freelancer.id eq freelancer.id }">
													<a
														href="/freelance/projects/${project.id }/offer/accept/${freelancer.id}"
														class="btn btn-success mr-1 disabled">Accept</a>
													<a
														href="/freelance/projects/${project.id }/offer/reject/${freelancer.id}"
														class="btn btn-danger">Reject</a>
												</c:when>
												<c:otherwise>
													<a
														href="/freelance/projects/${project.id }/offer/accept/${freelancer.id}"
														class="btn btn-success mr-1 disabled">Accept</a>
													<a
														href="/freelance/projects/${project.id }/offer/reject/${freelancer.id}"
														class="btn btn-danger disabled">Reject</a>
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

		<div class="row">
			<div class="categories-container shadow-sm">
				<h3>Client Info</h3>
				<hr />
				<div class="row">
					<div class="col text-center my-3 client-info">
						<img src="/images/user_pic.svg" alt="user" /> <a
							href="/client/profile/${project.client.id}">
							<p>${project.client.firstname } ${project.client.lastname }</p>
						</a>
						<p>&#9733;&#9733;&#9733;&#9733;&#9733;</p>
						<span>
							<p class="h5">2</p>
							<p>Completed Projects</p>
							<p class="h5">2</p>
							<p>Opened Projects</p>
							<p class="h5">1</p>
							<p>In Progress Projects</p>
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