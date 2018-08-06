<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Adding Page</title>
</head>
<body>
	<h1>Add Offer Page</h1>
	<form:form method="post" action="save">
		<table>
			<tr>
				<td>Name :</td>
				<td><form:input path="name" /></td>
			</tr>
			<tr>
				<td>Surname :</td>
				<td><form:input path="surname" /></td>
			</tr>
			<tr>
				<td>Age :</td>
				<td><form:input path="age" /></td>
			</tr>
			<tr>
				<td>Gender :</td>
				<td><form:radiobutton path="Gender" value="Male" />Male <form:radiobutton
						path="Gender" value="Female" />Female</td>
			</tr>
			<tr>
				<td>Address :</td>
				<td><form:input path="address" /></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="Save" /></td>	
			</tr>
		</table>
	</form:form>
		<input type="submit" value="Listele" onclick="window.location.href='show'" />
<input type="button" value="Home Page" onclick="window.location.href='/users/'" />
</body>
</html>