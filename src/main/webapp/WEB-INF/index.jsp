<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Freelance</title>
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/style/style.css" />
<link rel="stylesheet" href="/style/navbar.css" />
<link rel="stylesheet" href="/style/index/content.css" />



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
                <div class="left col-6 p-0 m-0">
                    <p class="caption">Find the perfect freelance services for your business</p>

                    <div class="block">
                        <div class="statistics">
                            <div class="numbers">
                                25,667
                        </div>
                            <div class="desc">
                                freelancers
                        </div>
                        </div>

                        <div class="statistics">
                            <div class="numbers">
                                55,667
                        </div>
                            <div class="desc">
                                Projects
                        </div>
                        </div>
                    </div>

                    <div class="categories">
                        <div class="category shadow">
                            <div class="icon">
                                <img src="/images/icons/programming&tech.png" alt="programming&tech" />
                            </div>
                            <div class="title">
                                <p>Software Development</p>
                            </div>
                        </div>

                        <div class="category shadow">
                            <div class="icon">
                                <img src="/images/icons/creativity.png" alt="creativity" />
                            </div>
                            <div class="title">
                                <p>Graphic & Design</p>
                            </div>
                        </div>

                        <div class="category shadow">
                            <div class="icon">
                                <img src="/images/icons/translate.png" alt="translation" />
                            </div>
                            <div class="title">
                                <p>Writing & Translation</p>
                            </div>
                        </div>

                        <div class="category shadow">
                            <div class="icon">
                                <img src="/images/icons/music.png" alt="music" />
                            </div>
                            <div class="title">
                                <p>Music & Audio</p>
                            </div>
                        </div>
                    </div>

                    </div>
                    <div class="col-6 p-0 m-0">
                        <div class="line"></div>
                        <img src="/images/img2.svg" alt="freelance" />
                        <div class="line"></div>
                    </div>
                </div>
</body>
</html>