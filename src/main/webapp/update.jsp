<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allCss.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<%
	int id = Integer.parseInt(request.getParameter("id"));
	Session session1 = FactoryProvider.getFactory().openSession();
	Note note = (Note) session1.get(Note.class, id);
	%>
	<p class="text-center  fs-2">Edit Note</p>
	<div class="container p-2">
		<form action="update_notes" method="post">
			<div class="mb-3">
				<label class="form-label fw-bold">Note Title </label> <input
					type="text" required class="form-control" name="title"
					placeholder="Type here title" value="<%= note.getTitle()%>">

			</div>
			<div class="mb-3">
				<label class="form-label fw-bold">Note Content</label>
				<textarea class="form-control" name="content" required 
					placeholder="Enter your content here" style="height: 300px;" ><%=note.getContent().trim() %>	
				</textarea>
			</div>
			<div class="text-center">
				<button type="submit" class="btn btn-primary col-md-4">Update
					Note</button>
			</div>
			<input type="hidden" name="id" value="<%= note.getId()%>"/>
		</form>
	</div>
</body>
</html>