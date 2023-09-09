<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored = "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allCss.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<p class="text-center  fs-2">Please Fill Your Note Details</p>
	<c:if test="${ not empty succMsg }">
		<p class="text-center fs-3 text-success">${	succMsg }</p>
		<c:remove var="succMsg" scope="session"/>
	</c:if>
	<div class="container p-2">
		<form action="save_notes" method="post">
			<div class="mb-3">
				<label class="form-label fw-bold">Note Title </label> <input
					type="text" required class="form-control" name="title"
					placeholder="Type here title">

			</div>
			<div class="mb-3">
				<label class="form-label fw-bold">Note Content</label>
				<textarea class="form-control" name="content" required
					placeholder="Enter your content here" style="height: 300px;"></textarea>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary col-md-4">Add
					Note</button>
			</div>
		</form>
	</div>
</body>
</html>