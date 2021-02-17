<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>My Projects</title>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/projects/myprojects.css" />
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
					<h3>Status</h3>
					<hr>
					<p class="p-3 mb-3 w-100 shadow-sm" >Open</p>
					<p class="p-3 mb-3 w-100 shadow-sm" >Closed</p>
				</div>

				<div class="right-col col-sm p-4 border shadow-sm rounded">
					<h3>Projects</h3>
					<hr>
					<c:forEach items="${user.projects}" var="project">
						<div class="row m-0 p-0">
							<div class="col-sm mx-2 mb-3 section rounded">
								<div class="row m-0 p-0">
                                    <div class="col m-0 p-0">
                                        <a href="/freelance/projects/${project.id}"><h4>${project.title}</h4></a>
                                    </div>
                                    <div class="col m-0 p-0">
                                        <div class="float-right">
                                            <div class="btn btn-outline-success">Open</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row m-0 p-0 mt-3">
                                    <div class="col-sm m-0 p-0">
                                        <p>Submitted offers: ${project.freelancers_offer.size()}</p>
                                        <p>Posted on: <fmt:formatDate value="${project.createdAt }" type="date" pattern="MMMM dd, yyyy" /></p>
                                        <p>Duration: ${project.duration} day</p>
                                    </div>
                                    <div class="col-sm m-0 p-0">
                                        <p>Category: ${project.category.title}</p>
                                        <p>Estimated Budget: ${project.price} SR</p>
                                        <p>Likes: ${project.freelancers_like.size()}</p>
                                    </div>
                                </div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
	</div>

</body>
</html>