<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	int number = Integer.parseInt(request.getParameter("id"));
	String title = "";
	String director = "";
	String info = "";
	String actors = "";
	String rank = "";
	String rtime = "";
	String poster = "";
	int open;
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		stmt = conn.createStatement();

		// rating
		String sql = "select * from 영화 where 영화_아이디=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, number);

		rs = pstmt.executeQuery();
		rs.next();

		title = rs.getString("제목");
		director = rs.getString("감독");
		info = rs.getString("주요정보");
		actors = rs.getString("출연");
		rank = rs.getString("등급");
		rtime = rs.getString("러닝타임");
		poster = rs.getString("포스터");
		open = rs.getInt("상영중");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 수정</title>
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
.movie_edit {
	width: 80%;
	margin: auto;
}

input {
	border: 1px solid gray;
	border-radius: 3px;
	color: black;
	font-family: inherit;
	font-size: 14px;
	height: 50px;
	outline: none;
	padding: 0px 10px;
	width: 280px;
	margin: 5px 0px;
}

.button {
	border: 1px solid gray;
	border-radius: 3px;
	width: 140px;
	height: 50px;
	margin: 10px 4px;
	font-family: inherit;
	font-size: 14px;
	outline: none;
	padding: 0px 10px;
}
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
					<li><a href="insertMovieForm.jsp">Movie Register</a></li>
					<li><a href="movieList.jsp">Movie Modify</a></li>
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
									if (id == "") {
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
	<div class="movie_edit">
		<form method="post" action="updateMoviePro.jsp?id=<%=number%>">
			<h3>영화 수정 양식</h3>
			<div class="register_form">
				<input type="text" name="title" value="<%=title%>">
			</div>
			<div class="register_form">
				<input type="text" name="director" value="<%=director%>">
			</div>

			<div class="register_form">
				<input type="text" name="actor" value="<%=actors%>">
			</div>

			<div class="register_form">
				<input type="text" name="rank" value="<%=rank%>">
			</div>

			<div class="register_form">
				<input type="text" name="running" value="<%=rtime%>">
			</div>

			<div class="register_form">
				<input type="text" name="poster" value="<%=poster%>">
			</div>
			
			<div class="register_form">
				<input type="text" name="open" value="<%=open%>">
			</div>

			<div class="register_form">
				<textarea name="info" cols=37 rows=8><%=info%></textarea>
			</div>
			
			<div>
				<button class="button" type="submit">Edit</button>
				<button class="button" onclick="location.href='movieList.jsp'">Back</button>
			</div>
		</form>
	</div>
</body>
</html>

<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>