<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Client</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/navbar.css" />
<link rel="stylesheet" href="/style/registerAndLogin/content.css" />



</head>
<body>
	<div class="nav-container ">
		<div class="nav-row row">
			<div class="col-6 left p-0">
				<a href="/"><h1 id="logo">Freelance</h1></a>
			</div>
			<div class="col-6 right p-0">
				<div class="float-right menu-items">
					<div class=" mr-5">
						<a href="/client/register"><button class="signup">Client</button></a>
					</div>

					<div>
						<a href="/freelancer/register"><button class="signup">Freelancer</button></a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="row p-0 m-0">
		<div class="left-side col-6 m-0">
			<p class="caption">Login as a client</p>
			<form:form action="/client/login" method="post" modelAttribute="newLogin">
				<div class="form-group">
					<label>Email:</label>
					<form:input path="email" class="form-control" />
					<form:errors path="email" class="text-danger" />
				</div>
				<div class="form-group">
					<label>Password:</label>
					<form:password path="password" class="form-control" />
					<form:errors path="password" class="text-danger" />
				</div>
				<input type="submit" value="Login" class="btn btn-block" />
			</form:form>
			<p class="float-right">
				Don't have an account? <a href="/client/register">Register</a>
			</p>
		</div>
		<div class="col-6 p-0 m-0">
			<div class="line"></div>
			<img src="/images/img9.svg" alt="freelance" />
			<div class="line"></div>
		</div>
	</div>
</body>
</html>