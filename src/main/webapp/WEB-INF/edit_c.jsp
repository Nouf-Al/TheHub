<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Edit Client</title>
	<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/profile/profile.css" />
	<link rel="stylesheet" href="/style/menu.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

	<div class="continer m-5 p-5">
	<div class="col-sm-8 offset-2 ">
	<h4 class="">Edit  <c:out value="${client.firstname }"></c:out> <c:out value="${client.lastname }"></c:out> </h4>
	<form:form action="/client/profile/${client.id}/update" method="post" modelAttribute="editClient">
	<input type="hidden" name="_method" value="put">
				<div class="row my-4">
					<div class="col-sm-6">
						<div class="form-group">
							<label>First Name:</label>
							<form:input path="firstname" class="form-control" value="${client.firstname }" />
							<form:errors path="firstname" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label>Last Name:</label>
							<form:input path="lastname" class="form-control" value="${client.lastname }" />
							<form:errors path="lastname" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label>Email:</label>
							<form:input path="email" class="form-control" value="${client.email }" />
							<form:errors path="email" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label>Password:</label>
							<form:password path="password" class="form-control" />
							<form:errors path="password" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label>Confirm Password:</label>
							<form:password path="confirm" class="form-control" />
							<form:errors path="confirm" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<form:label path="">Country:</form:label>
							<select name="country" class="form-control" >
								<option value="ca">CA</option>
								<option value="ny">NY</option>
								<option value="sa">SA</option>
							</select>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<form:label path="">City:</form:label>
							<select name="city" class="form-control">
								<option value="ca">CA</option>
								<option value="ny">NY</option>
								<option value="sa">SA</option>
							</select>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<form:label path="">Gender:</form:label>
							<select name="gender" class="form-control">
								<option value="male">Male</option>
								<option value="female">Female</option>
								
							</select>
						</div>
					</div>
					
					<div class="col-sm-6">
						<div class="form-group">
							<label>Bio:</label>
							<form:input path="bio" value="${client.bio }" class="form-control"  />
							
						</div>
					</div>
					<div class="col-sm-6">
					<label>Photo:</label>
						<div class="custom-file">
						<label>Photo:</label>
						<input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
						<label class="custom-file-label" for="inputGroupFile01">Choose file</label>
						</div>
					</div>
					
				</div>
				<input type="submit" value="Edit" class="btn col-sm-2 edit " />
			</form:form>
	</div>
	</div>

</body>
</html>