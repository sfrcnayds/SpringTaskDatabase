<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th><b>ID</b></th>
			<th><b>Firstname</b></th>
			<th><b>Lastname</b></th>
			<th><b>Age</b></th>
			<th><b>Gender</b></th>
			<th><b>Adress</b></th>
		</tr>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.getId()}</td>
				<td>${user.getName()}</td>
				<td>${user.getSurname()}</td>
				<td>${user.getAge()}</td>
				<td>${user.getGender()}</td>
				<td>${user.getAddress()}</td>
			</tr>
		</c:forEach>
	</table>
	<br />
	<form method="get" action="${pageContext.request.contextPath}/doDelete">
		Silinecek ID : <input type="number" name="id" /> 
		<input type="submit" value="Delete" />
	</form>
	<br/>
	<input type="button" value="Home Page" onclick="window.location.href='/users/'" />
</body>
</html>