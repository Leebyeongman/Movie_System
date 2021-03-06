<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String id = (String) request.getSession().getAttribute("고객_아이디");
	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt1 = null;
	PreparedStatement pstmtsearch = null;
	Statement stmt = null;
	ResultSet rs = null;
	ResultSet search = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		stmt = conn.createStatement();
		// rating
		String sql = "select * from 영화";
		pstmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>CNU MOVIE</title>
<link rel="stylesheet" href="./CSS/main.css">
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
			<a href="./main.jsp">
				<div class="navbar-brand">CNU Movie</div>
			</a>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="./Movie/insertMovieForm.jsp">Movie</a></li>
				<li><a href="./Theater/theaterList.jsp">Theater</a></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			<% 
				try {
					String searchid = "select 고객_아이디 from 고객 where 고객_아이디='" + id + "'";
					pstmtsearch = conn.prepareStatement(searchid);
					search = pstmtsearch.executeQuery();
					ArrayList<String> idlist = new ArrayList<String>();
					while (search.next()) {
						idlist.add(search.getString("고객_아이디"));
					}
					if (idlist.contains(id)) {
			%>
				<li><a href="./User/Info/mypageForm.jsp?id=<%=id%>">My Account</a></li>
				<li><a href="./User/Info/userlogout.jsp">Logout</a></li>
			<%			
					}
					else {
			%>
				<li><a href="./User/Info/insertMemberForm.jsp">Sign Up</a></li>
				<li><a href="./User/Info/login.jsp">Login</a></li>
			<%
					}
				}catch (Exception e) {
					e.printStackTrace();
				}
			%>
			</ul>
		</div>

	</div>
	</nav>
	<h3>Movie Chart</h3>

	<div id="root">
		<div class="App">
			<%
				while (rs.next()) {
						String number = rs.getString("영화_아이디");
						String title = rs.getString("제목");
						String running = rs.getString("러닝타임");
						String poster = rs.getString("포스터");
						String rank = rs.getString("등급");
						String info = rs.getString("주요정보");
			%>
			<div class="movie"
				onclick="location.href='reserveMovieForm.jsp?id=<%=number%>'">
				<div class="movie__Column">
					<img src=<%=poster%>>
				</div>
				<div class="movie__Column">
					<h1><%=title%></h1>
					<div class="movie__Genres">
						러닝 타임 :
						<%=running%>
						분 <br /> 등급 :
						<%=rank%><br />
					</div>
					<p class="movie__Synopsis">
						<%=info%>
					</p>
				</div>
			</div>
			<%
				}
			%>
		</div>
	</div>
</body>

</html>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} 
%>