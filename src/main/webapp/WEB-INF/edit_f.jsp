<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
	<title>Edit Profile</title>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/projects/newProject.css" />
	<link rel="stylesheet" href="/style/menu.css" />
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
					<div class="dropdown-right" style="float:right;">
						<div class="dropbtn-right">
							<span class="user-info">
								<span>Hello, </span>${freelancer.firstname }
								<img src="/images/user_pic.svg" id="user-img" alt="user" />
								<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chevron-down" viewBox="0 0 16 16">
									<path fill-rule="evenodd" d="M1.646 4.646a.5.5 0 0 1 .708 0L8 10.293l5.646-5.647a.5.5 0 0 1 .708.708l-6 6a.5.5 0 0 1-.708 0l-6-6a.5.5 0 0 1 0-.708z" />
								</svg>
							</span>
						</div>
						<div class="dropdown-content-right shadow-sm">
							<a href="/freelancer/profile/${freelancer.id}">Profile</a>
							<a href="/freelance/myprojects">My Projects</a>
							<a href="/freelance/favorites">Favorites</a>
							<a href="/logout">Logout</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<div class="dashboard-container">
		<div class="left-side m-auto shadow-sm">
			<p>Edit ${freelancer.firstname } ${freelancer.lastname }</p>
			<form:form action="/freelancer/profile/${freelancer.id}/update" method="post" modelAttribute="editFreelancer">
				<input type="hidden" name="_method" value="put">
				<div class="row my-4">
					<div class="col-sm-6 mb-3">
						<div class="form-group">
							<label>First Name:</label>
							<form:input path="firstname" value="${freelancer.firstname }" />
							<form:errors path="firstname" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="form-group">
							<label>Last Name:</label>
							<form:input path="lastname" value="${freelancer.lastname }" />
							<form:errors path="lastname" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>Email:</label>
							<form:input path="email" value="${freelancer.email }" />
							<form:errors path="email" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="form-group">
							<label>Password:</label>
							<form:password path="password" />
							<form:errors path="password" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="form-group">
							<label>Confirm Password:</label>
							<form:password path="confirm" />
							<form:errors path="confirm" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="form-group">
							<form:label path="">Gender:</form:label>
							<select name="gender">
								<option value="male">Male</option>
								<option value="female">Female</option>
							</select>
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="form-group">
							<label>Speciality:</label>
							<form:input path="speciality" value="${freelancer.speciality }" />
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<div class="form-group">
							<label>Bio:</label>
							<form:input path="bio" value="${freelancer.bio }" />
						</div>
					</div>
					<div class="col-sm-6 mb-3">
						<label>Photo:</label>
						<div class="custom-file">
							<label>Photo:</label> 
							<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01"> 
							<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
						</div>
					</div>
					<div class="col-sm-12 mb-3">
						<div class="form-group">
							<label>skills:</label>
							<form:textarea path="skillString" />
							<h6 class="text-danger">please separate by , between skill </h6>
						</div>
					</div>
				</div>
				<input type="submit" value="Update" class="btn btn-block form-btn my-3" />
			</form:form>
			<a href="/freelancer/profile/${freelancer.id}" class="btn btn-block cancel-btn">Cancel</a>
		</div>
	</div>
</body>
</html>