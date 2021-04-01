<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
	<title>New Project</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/menu.css" />
	<link rel="stylesheet" href="/style/projects/newProject.css" />
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
										fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
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
										fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
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
		<div class="row p-0 m-0">
			<div class="left-side m-auto shadow-sm">
				<p>Create new project</p>
				<form:form action="/freelance/projects/create" method="post" modelAttribute="newProject">
					<div class="row">
						<div class="col-sm-12 mb-3">
							<div class="form-group">
								<label>Title:</label>
								<form:input path="title" />
								<form:errors path="title" class="text-danger" />
							</div>
						</div>
						<div class="col-sm-12 mb-3">
							<div class="form-group">
								<label>Description:</label>
								<form:textarea path="description" />
								<form:errors path="description" class="text-danger" />
							</div>
						</div>
						<div class="col-sm-6 mb-3">
							<div class="form-group">
								<label>Offer end:</label>
								<form:input type="date" path="offerEnd" />
								<form:errors path="offerEnd" class="text-danger" />
							</div>
						</div>
						<div class="col-sm-6 mb-3">
							<div class="form-group">
								<label>How Long the project will take? (Day)</label>
								<form:input path="duration" />
								<form:errors path="duration" class="text-danger" />
							</div>
						</div>
						<div class="col-sm-6 mb-3">
							<div class="form-group">
								<label>Price:</label>
								<form:input path="price" />
								<form:errors path="price" class="text-danger" />
							</div>
						</div>
						<div class="col-sm-6 mb-3">
							<div class="form-group">
								<form:label path="category">Category:</form:label>
								<select name="category">
									<c:forEach items="${ categories}" var="category">
										<option value="${ category.id}">${ category.title}</option>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<input type="hidden" name="client" value="${user.id }" />
					<input type="submit" value="Create" class="btn btn-block form-btn my-3" />
				</form:form>
				<a href="/freelance/projects" class="btn btn-block cancel-btn">Cancel</a>
			</div>
		</div>
	</div>
</body>
</html>