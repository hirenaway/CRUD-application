<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
	<head>
		<title> Customer List </title>
		<meta http-equiv = "Content-Type" content = "text/html; charset = ISO-8859-1">
		<link href = "../../webjars/bootstrap/4.0.0/css/bootstrap.min.css" rel = "stylesheet"></link>
		<script src = "../../webjars/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<link href="/CSS/list.css" rel="stylesheet" />
	</head>
	<body>
		<form:form method = "GET" action="customer-form.jsp" cssClass="form">
			<div class="container">
				<div class="add">
					<spring:url value="/customer/addCustomer/" var="addURL" />
					<a class="btn btn-success" href="${addURL}" role="button" >Add New Customer</a>
			</div>
				<table class="table table-striped">
					<thead class="thead-dark">
						<tr>
							<th scope="row">ID</th>
							<th scope="row">Name</th>
							<th scope="row">DOB</th>
							<th scope="row">Mobile</th>
							<th scope="row">Email</th>
							<th scope="row">Age</th>
							<th scope="row">Gender</th>
							<th scope="row">Address</th>
							<th scope="row" colspan="2">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${customerlist}" var="customer">
							<tr>
								<td>${customer.id}</td>
								<td>${customer.firstName} ${customer.lastName}</td>
								<td><fmt:formatDate value="${customer.dob}" pattern="dd-MM-yyyy"/></td>
								<td>${customer.mobile}</td>
								<td>${customer.email}</td>
								<td>${customer.age}</td>
								<td>
									<c:if test="${customer.gender eq 0}">Male</c:if>
									<c:if test="${customer.gender eq 1}">Female</c:if>
								</td>	
								<td>${customer.address1}, ${customer.address2}</td>
								<td>
									<spring:url value="/customer/editCustomer/${customer.id}" var="editURL" />
									<a class="btn btn-info" href="${editURL}" role="button" id="" >Edit</a>
								</td>
								<td>
									<spring:url value="/customer/deleteCustomer/${customer.id}" var="deleteURL" />
									<a class="btn btn-danger" href="${deleteURL}" role="button">Delete</a>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</form:form>
	</body>
</html>