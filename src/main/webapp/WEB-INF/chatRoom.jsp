<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
	<title>Messages</title>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/menu.css" />
	<link rel="stylesheet" href="/style/chat/chatRoom.css" />
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
		<div class="row p-0 m-0 rounded border shadow-sm p-4 chat-box">
			<div class="col p-0">
				<div class="row p-0 m-0">
					<div class="col p-0">
						<c:forEach items="${comments }" var="c">
							<c:choose>
								<c:when test="${c.writerType =='client'}">
									<p class="text-left client">${c.client.firstname}: ${c.text }</p>
								</c:when>
								<c:otherwise>
									<p class="text-right freelancer">${c.freelancer.firstname}: ${c.text }
									</p>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
				</div>
				<hr />
				<div class="row m-0 p-0">
					<div class="col p-0">
						<form:form action="/freelance/projects/${project.id}/chating/create" method="post"
							modelAttribute="newComment">
							<div class="form-group">
								<label>Write A Message: </label>
								<form:textarea path="text" class="form-control" />
								<form:errors path="text" class="text-danger" />
							</div>
							<c:choose>
								<c:when test="${isClient eq true}">
									<input type="hidden" name="writerType" value="client" />
									<input type="hidden" name="client" value="${user_id}" />
									<input type="hidden" name="freelancer"
										value="${project.freelancer.id}" />
								</c:when>
								<c:otherwise>
									<input type="hidden" name="writerType" value="freelancer" />
									<input type="hidden" name="freelancer" value="${user_id}" />
									<input type="hidden" name="client" value="${project.client.id}" />
								</c:otherwise>
							</c:choose>
							<input type="hidden" name="project" value="${project.id}" />
							<input type="submit" value="Send message" class="btn btn-dark" />
						</form:form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>