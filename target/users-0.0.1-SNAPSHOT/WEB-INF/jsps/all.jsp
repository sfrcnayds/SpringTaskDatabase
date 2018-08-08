<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>Master Page</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type=”text/javascript” src=”js/bootstrap.min.js”></script>
<script type="text/javascript">
function showAddPage() {
	document.getElementById("errorMessage").style.display = "none";
	document.getElementById("hidden-add").style.display = "table";
	document.getElementById("hidden-edit").style.display = "none";
}
function findChoosenId(){
	document.getElementById("errorMessage").style.display = "none";
	var users = document.getElementsByName('radioButton');
	var userId;
	for (var i = 0; i < users.length; i++) {
		if (users[i].checked) {
			userId = users[i].id;
			return userId;
		}
	}
	document.getElementById("errorMessage").style.display = "inherit";
	return null;
	
}
function showEdit() {
	document.getElementById("hidden-add").style.display = "none";
	var userId = findChoosenId();
	if(userId == null){
		return null;
	}
	var users = JSON.parse('${data}');
	for (var i = 0; i < users.length; i++) {
		if (users[i].id == userId) {
			document.getElementById("name").value = users[i].name;
			document.getElementById("surname").value = users[i].surname;
			document.getElementById("age").value = users[i].age;
			document.getElementById("address").value = users[i].address;
			if (users[i].gender == "Male") {
				radiobtn = document.getElementById("male");
				radiobtn.checked = true;
			} else {
				radiobtn = document.getElementById("female");
				radiobtn.checked = true;
			}
			break;
		}
	}
	document.getElementById("hidden-edit").style.display = "table";
	document.getElementById("id").value = userId;
}
function search(){
	if(document.getElementById("searchName").value == ""){
		alert("Lutfen Bir Deger Giriniz.")
	}
	
}

function deleteUser(){
	var userId = findChoosenId();
	if(userId == null){
		document.getElementById("deleteId").value = -1;
		return null;
	}
	document.getElementById("deleteId").value = userId;
}

</script>
<style type="text/css">
.hidden-add, .hidden-edit {
	display: none;
}
</style>
</head>
<body>
	<div class="container bg-1">
		<h2>Kullanici Tablosu</h2>
		<table class="table table-condensed">
			<thead>
				<tr>
					<th>#</th>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Age</th>
					<th>Gender</th>
					<th>Address</th>
					<th>
						<form style="float: right" method="get"
							action="${pageContext.request.contextPath}/doSearch">
							Name : <input type="text" name="name" id="searchName"/> <input type="submit"
								value="Search" onclick="search()" />
						</form>
						<p id = "nullMessage" style="color:red;display:none">Lutfen Bir Deger Giriniz</p>
					</th>
					
				</tr>
			</thead>
			<tbody>
				<c:forEach var="user" items="${users}">
					<tr>
						<td><input type="radio" name="radioButton"
							id="${user.getId()}"></td>
						<td>${user.getName()}</td>
						<td>${user.getSurname()}</td>
						<td>${user.getAge()}</td>
						<td>${user.getGender()}</td>
						<td>${user.getAddress()}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p style="color:red;display: none" id="errorMessage">Lütfen Bir Seçim Yapınız!!</p>
	</div>
	<div class="container bg-2">
		<div class="hidden-add" id="hidden-add">
			<form:form method="post" action="save">
				<div class="form-group">
					<label for="usr">Name:</label>
					<form:input path="Name" type="text" placeholder="Name" />
				</div>
				<div class="form-group">
					<label for="usr">Surname:</label>
					<form:input path="Surname" type="text" placeholder="Surname" />
				</div>
				<div class="form-group">
					<label for="usr">Age:</label>
					<form:input path="Age" type="number" placeholder="Age"></form:input>
				</div>
				<div class="form-group">
					<label for="usr">Gender:</label>
					<form:radiobutton path="Gender" value="Male" />
					Male
					<form:radiobutton path="Gender" value="Female" />
					Female
				</div>
				<div class="form-group">
					<label for="usr">Address:</label>
					<form:input path="Address" type="text" placeholder="Address" />
				</div>
				<button type="submit" class="btn btn-primary">Add</button>
			</form:form>
		</div>
	</div>


	<div class="container bg-2">
		<div class="hidden-edit" id="hidden-edit">
			<form:form method="post" action="update">
				<form:input style="display: none" path="id" />
				<div class="form-group">
					<label for="usr">Name:</label>
					<form:input path="name" type="text" placeholder="Name" id="name" />
				</div>
				<div class="form-group">
					<label for="usr">Surname:</label>
					<form:input path="surname" type="text" placeholder="Surname"
						id="surname" />
				</div>
				<div class="form-group">
					<label for="usr">Age:</label>
					<form:input path="age" type="number" placeholder="Age" id="age"></form:input>
				</div>
				<div class="form-group">
					<label for="usr">Gender:</label>
					<form:radiobutton path="Gender" value="Male" id="male" />
					Male
					<form:radiobutton path="Gender" value="Female" id="female" />
					Female
				</div>
				<div class="form-group">
					<label for="usr">Address:</label>
					<form:input path="address" type="text" placeholder="Address"
						id="address" />
				</div>
				<button type="submit" class="btn btn-primary">Update</button>
			</form:form>

		</div>

	</div>
	<footer class="container-fluid bg-4 text-center">
		<input type="button" class="btn btn-primary" value="Add" id="add"
			onclick="showAddPage()" /> <input type="button"
			class="btn btn-primary" value="Show" onclick="showEdit()" />
		<form method="get" action="${pageContext.request.contextPath}/doDelete">
			<input style="display: none"  type="number" name="id" id = "deleteId"/> 
			<input style="margin-top:4px" class="btn btn-primary" type="submit" value="Delete" onclick="deleteUser()" />
		</form>
	</footer>
</body>
</html>