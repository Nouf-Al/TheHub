<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form:form action="/freelance/category/create" method="post"
		modelAttribute="newCategory">
		<div class="form-group">
			<label>title:</label>
			<form:input path="title" class="form-control" />
			<form:errors path="title" class="text-danger" />
		</div>

		<input type="submit" value="create" class="btn btn-block" />
	</form:form>
</body>
</html>