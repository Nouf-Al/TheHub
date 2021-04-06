<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet"href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/style/style.css" />
	<link rel="stylesheet" href="/style/registerAndLogin/style.css" /> 
    <title>Freelancer login</title>
</head>
<body>
    <div class="background">
        <div class="yellow"></div>
    </div>

    <div class="nav-container">
        <nav>
            <div class="row p-0 m-0">
                <div class="col p-0 left-nav">
                    <div id="logo"><h1><a href="/">The Hub</a></h1></div>
                </div>
                <div class="col p-0 right-nav">
                    <span>
						<a href="/client/login">Client</a>
                        <a href="/freelancer/login">Freelancer</a>
                    </span>
                </div>
            </div>
        </nav>
    </div>

    <section>
        <div class="content-container">
            <div class="row p-0 m-0">
                <div class="col-sm-6 p-0 left-section">
                    <h1>Login As a <span>Freelancer.</span></h1>
                </div>
                <div class="col p-0 right-section px-3">
					<form:form class="shadow" action="/freelancer/login" method="post" modelAttribute="newLogin">
                        <div class="form-group">
							<form:input path="email" class="form-control" placeholder="Email" />
							<form:errors path="email" class="text-danger" />
                        </div>
                        <div class="form-group">
							<form:password path="password" class="form-control" placeholder="Password" />
							<form:errors path="password" class="text-danger" />
                        </div>
                        <input type="submit" class="form-control submit my-5" value="Login">
                        <p>Don't have an account? <a href="/freelancer/register">Register</a></p>
					</form:form>
                </div>
            </div>
        </div>
    </section>
</body>
</html>