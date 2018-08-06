<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<body>
<input type="button" value="Add Page" onclick="window.location.href='add'" />
<input type="button" value="Show Page" onclick="window.location.href='show'" />
<input type="button" value="Search Page" onclick="window.location.href='search'" />
<input type="button" value="Delete Page" onclick="window.location.href='delete'" />
</body>
</html>