<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allCss.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container p-3 ">
		<h1 class="text-center fs-2 ">All Notes</h1>
		<c:if test="${ not empty succMsg }">
			<p class="text-center fs-3 text-success">${ succMsg }</p>
			<c:remove var="succMsg" scope="session"/>
		</c:if>
		<c:if test="${ not empty errorMsg }">
			<p class="text-center fs-3 text-danger">${ errorMsg }</p>
			<c:remove var="errorMsg" scope ="session"/>
		</c:if>
		<%
		Session s = FactoryProvider.getFactory().openSession();
		Query query = s.createQuery("from Note");
		List<Note> list = query.list();
		for (Note note : list) {
		%>
		<div class="card mb-4 offset-md-3" style="width: 50%">
			<div class="card-body">
				<h5 class="card-title"><%=note.getTitle()%></h5>
				<p class="card-text"><%=note.getContent()%></p>
				<a href="delete_notes?id=<%=note.getId()%>" class="btn btn-danger">Delete</a>
				<a href="update.jsp?id=<%=note.getId()%>" class="btn btn-primary">Update</a>
			</div>
		</div>
		<%
		}
		%>
	</div>
</body>
</html>