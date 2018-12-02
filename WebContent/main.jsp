<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		stmt = conn.createStatement();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>CNU MOVIE</title>
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
<style>
</style>
</head>
<body>
	<nav class="navbar navbar-default" id="nav_bar">
	<div class="container">
		<div class="navbar-header">
			<a href="main.jsp">
				<div class="navbar-brand">CNU Movie</div>
			</a>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="">Reservation</a></li>
				<li><a href="insertMovieForm.jsp">Movie Register</a></li>
				<li><a href="insertTheaterForm.jsp">Theater Register</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<%
				String id = "";
					try {
						Cookie[] cookies = request.getCookies();
						if (cookies != null) {
							for (int i = 0; i < cookies.length; ++i) {
								if (cookies[i].getName().equals("id")) {
									id = cookies[i].getValue();
			%>
			<li><a href="mypageForm.jsp?id=<%=id%>">My Account</a></li>
				<li><a href="cookieLogout.jsp">Logout</a></li>
			<%
								}
							}
							/* 아이디가 없으면 */
							if (id=="") {
			%>
				<li><a href="insertMemberForm.jsp">Sign Up</a></li>
				<li><a href="login.jsp">Login</a></li>
			<%
							}
						/* 쿠키 값이 없으면 */	
						} else {
			%>
				<li><a href="insertMemberForm.jsp">Sign Up</a></li>
				<li><a href="login.jsp">Login</a></li>
			<%
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
			%>
			</ul>
		</div>
		
	</div>
	</nav>

	<div id="header">
		<ul>
			<b><%=id%></b>님이 로그인 하셨습니다.
		</ul>
	</div>
</body>

</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null) {
			try { rs.close(); } 
			catch (SQLException sqle) {}
		}
		if (conn != null) {
			try { conn.close(); } 
			catch (SQLException sqle) {}
		}
	}
%>