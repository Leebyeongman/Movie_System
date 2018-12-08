<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>CNU Movie 로그인</title>
<link rel="stylesheet" href="../../CSS/BasicForm.css">
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous">
	
</script>
</head>
<body>
	<nav class="navbar navbar-default" id="nav_bar">
	<div class="container">
		<div class="navbar-header">
			<a href="../../main.jsp">
				<div class="navbar-brand">CNU Movie</div>
			</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="../../Movie/insertMovieForm.jsp">Movie</a></li>
				<li><a href="../../Theater/theaterList.jsp">Theater</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="./insertMemberForm.jsp">Sign Up</a></li>
				<li><a href="./login.jsp">Login</a></li>
			</ul>
		</div>
	</div>
	</nav>
	
	<div class="basicform">
		<form method="post" action="./loginPro.jsp">
			<div>
				<h3>로그인</h3>
				<div class="register_form">
					<input type="text" id="id" name="id" required value="ID" value=""
						onBlur="if(this.value=='')this.value='ID'"
						onFocus="if(this.value=='ID')this.value='' ">
				</div>

				<div class="register_form">
					<input type="password" id="passwd" name="passwd" required
						value="default" value="" onBlur="if(this.value=='')this.value='default'"
						onFocus="if(this.value=='default')this.value='' ">
				</div>
			</div>

			<div>
				<input class="button" type="submit" value="로그인"> 
				<input class="button" type="button" value="회원가입" onclick="location.href='./insertMemberForm.jsp'">
			</div>
		</form>
	</div>

</body>
</html>