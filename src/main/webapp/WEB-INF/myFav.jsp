<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Favorites</title>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/favorites/favorites.css" />
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
						<a href="/freelance/projects">Projects</a> 
						<a href="/freelance/freelancers">Freelancers</a>
					</div>
				</div>
			</div>
			<div class="col p-0 m-0 ">
				<span class="float-right"> 
					<c:if test="${isClient eq true }">
						<a href="/freelance/projects/new"><button class="post-project">+ Project</button></a>
						<span class="user-info"> 
							<a href="/client/profile/${user.id}">${user.firstname } ${user.lastname }</a>
							<img src="/images/user_pic.svg" alt="user" />
						</span>
					</c:if>
					
					<c:if test="${isClient eq false }">
						<span class="user-info"> 
							<a href="/freelancer/profile/${user.id}">${user.firstname } ${user.lastname }</a>
							<img src="/images/user_pic.svg" alt="user" />
						</span>
					</c:if>
					
					<a href="/logout"><img src="/images/icons/logout (1).png" alt="logout" style="width: 21px; margin: 0 0 0 11px; " /></a>
				</span>
			</div>
		</div>
	</div>

	<div class="dashboard-container">
			<div class=" row p-0 m-0">
				<div class="left-col col-sm-3 p-4 border shadow-sm rounded mb-4">				
					<h3>My Favorite</h3>
					<hr>
					<a href="/"><p class="p-3 mb-3 w-100 shadow-sm" >Projects</p></a>
					<a href="/"><p class="p-3 mb-3 w-100 shadow-sm" >Freelancers</p></a>
				</div>

				<div class="right-col col-sm p-4 border shadow-sm rounded">
					<h3>Projects</h3>
					<hr>
					<c:forEach items="${user.projects_likes}" var="project">
						<div class="row m-0 p-0">
							<div class="col-sm mx-2 mb-3 section rounded">
								<a href="/freelance/projects/${project.id}"><p class="float-left m-0 p-0">${project.title}</p></a>
								<div class="float-right">
									<a href="/freelance/projects/${project.id }/like">
									<img src="/images/icons/like.png" alt="like" /></a>
								</div>
								
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
	</div>

</body>
</html>