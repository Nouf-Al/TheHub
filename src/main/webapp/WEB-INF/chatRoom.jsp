<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Client Profile</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/menu.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
						<a href="/freelance/projects">Projects</a> 
						<a href="/freelance/freelancers">Freelancers</a>
					</div>
				</div>
			</div>
			<div class="col p-0 m-0 ">
				<span class="float-right"> 
					<c:if test="${isClient eq true }">
						<a href="/freelance/projects/new"><button class="post-project">+ Project</button></a>
					</c:if>
					<c:if test="${isClient eq true }">
						<span class="user-info"> <a href="/client/profile/${user.id}">${user.firstname } ${user.lastname }</a>
							<img src="/images/user_pic.svg" alt="user" />
						</span>
					</c:if> 
					<c:if test="${isFreelancer eq true }">
						<span class="user-info"> <a href="/freelancer/profile/${user.id}">${user.firstname } ${user.lastname }</a>
							<img src="/images/user_pic.svg" alt="user" />
						</span>
					</c:if> 
				</span>
			</div>
		</div>
	</div>
	<div class="dashboard-container">

		<div class="row p-0 m-0">
			<div class="col p-0 rounded border shadow-sm">
				<div class="card-body">
					<c:forEach items="${comments }" var="c">
						<c:choose>
							<c:when test="${c.writerType =='client'}">
								<p class="text-right">${c.client.firstname} says: ${c.text }</p>
							</c:when>
							<c:otherwise>
								<p class="text-left">${c.freelancer.firstname} says: ${c.text }</p>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<div class="card-body">
					<form:form action="/freelance/projects/${project.id}/chating/create" method="post" modelAttribute="newComment">
						<div class="form-group">
							<label>Write A Message: </label>
							<form:textarea path="text" class="form-control" />
							<form:errors path="text" class="text-danger" />
						</div>
						<c:choose>
							<c:when test="${isClient eq true}">
								<input type="hidden" name="writerType" value="client" />
								<input type="hidden" name="client" value="${user_id}" />
								<input type="hidden" name="freelancer" value="${project.freelancer.id}" />
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
	
</body>
</html>