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
	<form method="get" action="${pageContext.request.contextPath}/doSearch">
	Name : <input type="text" name="name"/>
	<input type="submit" value="Search" />
	</form>
	<br/>
	
	<table>
		<tr>
			<th><b>Firstname</b></th>
			<th><b>Lastname</b></th>
			<th><b>Age</b></th>
			<th><b>Gender</b></th>
			<th><b>Adress</b></th>
		</tr>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.getName()}</td>
				<td>${user.getSurname()}</td>
				<td>${user.getAge()}</td>
				<td>${user.getGender()}</td>
				<td>${user.getAddress()}</td>
			</tr>
		</c:forEach>
	</table>
	<br/>
	<input type="button" value="Home Page" onclick="window.location.href='/users/'" />
</body>
</html>