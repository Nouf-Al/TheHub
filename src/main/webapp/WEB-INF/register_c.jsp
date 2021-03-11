<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
   <meta charset="UTF-8">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link rel="stylesheet" href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
   <script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
   <script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
   <link rel="stylesheet" href="/style/style.css" />
   <link rel="stylesheet" href="/style/registerAndLogin/style.css" />
   <title>Client registration</title>
</head>

<body>
   <div class="background">
      <div class="yellow"></div>
   </div>

   <div class="nav-container">
      <nav>
         <div class="row p-0 m-0">
            <div class="col p-0 left-nav">
               <div id="logo">
                  <a href="/">
                     <h1>The Hub</h1>
                  </a>
               </div>
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
               <h1>Create An Account <span>As a Client.</span></h1>
            </div>
            <div class="col p-0 right-section px-3">
               <form:form class="shadow" action="/client/register" method="post" modelAttribute="newUser">
                  <div class="form-group">
                     <form:input path="firstname" class="form-control" placeholder="First Name" />
                     <form:errors path="firstname" class="text-danger" />
                  </div>
                  <div class="form-group">
                     <form:input path="lastname" class="form-control" placeholder="Last Name" />
                     <form:errors path="lastname" class="text-danger" />
                  </div>
                  <div class="form-group">
                     <form:input path="email" class="form-control" placeholder="Email" />
                     <form:errors path="email" class="text-danger" />
                  </div>
                  <div class="row">
                     <div class="col-sm col-md">
                        <form:password path="password" class="form-control" placeholder="Password" />
                        <form:errors path="password" class="text-danger" />
                     </div>
                     <div class="col-sm col-md">
                        <form:password path="confirm" class="form-control" placeholder="Confirm Password" />
                        <form:errors path="confirm" class="text-danger" />
                     </div>
                  </div>
                  <input type="submit" class="form-control submit" value="Register" />
                  <p>Already have an account? <a href="/client/login">Login</a></p>
               </form:form>
            </div>
         </div>
      </div>
   </section>
</body>
</html>