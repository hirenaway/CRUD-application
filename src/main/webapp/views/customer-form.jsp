<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ page isELIgnored="false" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>
			<c:choose>
				<c:when test="${customerform.id eq customer.id}">Add Customer</c:when>
				<c:otherwise>Edit Customer</c:otherwise>
			</c:choose>
		</title>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.0/jquery.min.js"> </script> 
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.19.0/jquery.validate.min.js"> </script>
		<link href="../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
		<script src="../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script> 
		<script type="text/javascript" src="/JS/validation.js"></script>
		<link href="/CSS/form.css" rel="stylesheet" />
	</head>
	<body>
		<div class="container">
		<spring:url value="/customer/save" var="addURL" />
			<h2>
				<c:choose>
					<c:when test="${customerform.id eq customer.id}">Add Customer</c:when>
					<c:otherwise>Edit Customer</c:otherwise>
				</c:choose>
			</h2>
			<form:form id="CustomerForm" modelAttribute="customerform" method="POST" action="${addURL}" cssClass="form">
				<form:hidden path="id" />
				<div class="form-group">
					<label class="required"><strong>First Name:</strong></label>
					<form:input path="firstName" type="text" style="text-transform:capitalize;" cssClass="form-control" name="firstName" />
				</div>
				<div class="form-group">
					<label class="required"><strong>Last Name:</strong></label>
					<form:input path="lastName" type="text" style="text-transform:capitalize;" cssClass="form-control" name="lastName" />
				</div>
				<div class="row">
					<div class="col-md-4 form-group">
						<label class="required"><strong>Date Of Birth:</strong></label>
						<form:input path="dob" type="date" cssClass="form-control" name="dob" required="required" />
					</div>
				</div>
				<div class="form-group">
					<label class="required"><strong>Mobile:</strong></label>
					<form:input path="mobile" type="tel" cssClass="form-control" id="mobile" name="mobile" required="required" />
					<span id="mobileMsg"></span>
				</div>
				<div class="form-group">
					<label class="required"><strong>Email:</strong></label>
					<form:input path="email" type="email" cssClass="form-control" id="email" name="email" required="required" />
					<span id="emailMsg"></span>
				</div>
				<div class="form-group">
					<label class="required"><strong>Age:</strong></label>
					<form:input path="age" type="text" cssClass="form-control" name="age" required="required" />
				</div>
				<div class="form-group">
					<label class="required"><strong>Gender:</strong></label>
				<div class="form-check">
					<form:radiobutton path="gender" class="form-check-input" name="gender" id="male" value="0" />
					<label class="form-check-label" for="male">Male</label>
				</div>
				<div class="form-check">
					<form:radiobutton path="gender" class="form-check-input" name="gender" id="female" value="1" />
					<label class="form-check-label" for="female">Female</label>
				</div>
				</div> 
				<div class="form-group">
					<label class="required"><strong>Address 1:</strong></label>
					<form:input path="address1" type="text" id="cap"  cssClass="form-control" name="address1" required="required" />
				</div>
				<div class="form-group">
					<label><strong>Address 2:</strong></label>
					<form:input path="address2" type="text" id="cap" cssClass="form-control" name="address2" />
				</div>
				<button type="submit" class="btn btn-success" id="Button">
					<c:choose>
						<c:when test="${customerform.id eq customer.id}">Add Customer</c:when>
						<c:otherwise>Save changes</c:otherwise>
					</c:choose>
				</button>
			</form:form>
		</div>
	</body>
</html>