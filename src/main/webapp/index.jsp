<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="components/allCss.jsp"%>
<style>
.shadow{
	box-shadow: rgba(0, 0, 0, 0.35) 0px 5px 15px;
}
</style>
</head>
<body>

	<%@include file="components/navbar.jsp"%>
	<div class="container p-3">
		<div class="card shadow">
			<div class="card-body">
				<div class="text-center">
					<img src="components/notes.jpg" style="width: 400px; height: 450px" />
				</div>

				<h1 class="text-center text-primary mb-3">Keep your Notes Safe
					Now</h1>
				<div class="container text-center">
					<a href="show_notes.jsp"><button
							class="btn btn-outline-primary text-center">Start here</button></a>

				</div>
			</div>
		</div>
	</div>

</body>
</html>