<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Projects</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/freelancers/freelancers.css" />
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
					</c:if>
					<span class="user-info"> <a href="/client/profile/${user.id}">${user.firstname } ${user.lastname }</a>
						<img src="/images/user_pic.svg" alt="user" />
					</span>
				</span>
			</div>
		</div>
	</div>
	<div class="dashboard-container">
		<div class="projects-container">
			<div class=" row p-0 m-0">
			
				<div class=" col p-0 m-0">
					<div class="freelancers">
						<c:forEach items="${freelancers }" var="freelancer">
							<div class="freelancer">
								<div class="card">
								<img src="/images/user_pic.svg" alt="freelance" />
									<div class="header">
										<p>${freelancer.firstname } ${freelancer.lastname }</p>
									</div>
									<div class="body">
										<p>Projects : 4</p>
										<p>&#9733;&#9733;&#9733;&#9733;&#9733;</p>
										<p>Views: 33</p>
									</div>
									<div class="footer p-3">
										<a href="#" class="btn btn-block btn-primary">View Profile</a>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>