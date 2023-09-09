<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.query.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allCss.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
	<h1>All Notes</h1>
	<%
		Session s = FactoryProvider.getFactory().openSession();
		Query query = s.createQuery("from Note");
		List<Note> list = query.list();
		for(Note note : list){
	%>
	<h1><%= note.getTitle() %></h1>
	<p><%= note.getContent() %></p>
	<% } %>
</body>
</html>