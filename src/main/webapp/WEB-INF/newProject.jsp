<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>New Project</title>
<link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/menu.css" />

<link rel="stylesheet" href="/style/registerAndLogin/content.css" />


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
	
	<div class="row p-0 m-0">
		<div class="left-side col-6 m-0">
			<p class="caption">Create new project</p>
			<form:form action="/freelance/projects/create" method="post" modelAttribute="newProject">
				<div class="row">
					<div class="col-sm-12">
						<div class="form-group">
							<label>Title:</label>
							<form:input path="title" class="form-control" />
							<form:errors path="title" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label>Description:</label>
							<form:textarea path="description" class="form-control" />
							<form:errors path="description" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label>Offer end:</label>
							<form:input type="date" path="offerEnd" class="form-control" />
							<form:errors path="offerEnd" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label>How Long project will take? (Day)</label>
							<form:input path="duration" class="form-control" />
							<form:errors path="duration" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label>Price:</label>
							<form:input path="price" class="form-control" />
							<form:errors path="price" class="text-danger" />
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<form:label path="category">Category:</form:label>
							<select name="category" class="form-control">
							<c:forEach items="${ categories}" var="category">
								<option value="${ category.id}">${ category.title}</option>
							</c:forEach>
							</select>
						</div>
					</div>
				</div>
				<input type="hidden" name="client" value="${user.id }" />
				<input type="submit" value="Create" class="btn btn-block" />
			</form:form>
			<a href="/freelance/projects" class="btn btn-block btn-dark mt-2">Cancel</a>
		</div>
		<div class="col-6 p-0 m-0">
			<div class="line"></div>
			<img src="/images/newProject (2).svg" alt="freelance" />
			<div class="line"></div>
		</div>
	</div>
</body>
</html>