<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
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
		String sql = "select * from 영화";
		pstmt = conn.prepareStatement(sql);
		rs = stmt.executeQuery(sql);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화 수정 리스트</title>
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
#root {
	height: 100%;
}

.App {
	padding: 50px;
	display: flex;
	justify-content: space-around;
	flex-wrap: wrap;
	font-size: 14px;
}

img {
	width: 170px;
	height: 258px;
	position: relative;
	top: -20px;
	box-shadow: -10px 19px 38px rgba(83, 83, 83, 0.3), 10px 15px 12px
		rgba(80, 80, 80, 0.22);
}

.movie {
	background-color: white;
	width: 40%;
	display: flex;
	justify-content: space-between;
	align-items: flex-start;
	flex-wrap: wrap;
	margin-bottom: 50px;
	text-overflow: ellipsis;
	padding: 0 20px;
	box-shadow: 0 8px 38px rgba(133, 133, 133, 0.3), 0 5px 12px
		rgba(133, 133, 133, 0.22);
}

h3 {
	height: 30px;
	padding: 0px 120px;
}

.movie__Column {
	width: 30%;
	box-sizing: border-box;
	text-overflow: ellipsis;
}

.movie__Column:last-child {
	padding: 20px 0;
	width: 60%;
}

.movie__Genres {
	display: flex;
	flex-wrap: wrap;
	margin-bottom: 20px;
	margin-right: 10px;
}

.movie h1 {
	font-size: 20px;
	font-weight: 600;
}

.movie .movie__Synopsis {
	overflow: hidden;
	display: -webkit-box;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
}

@media screen and (min-width:320px) and (max-width:667px) {
	.movie {
		width: 100%;
	}
}

@media screen and (min-width:320px) and (max-width:667px) and
	(orientation: portrait) {
	.movie {
		width: 100%;
		flex-direction: column;
	}
	.movie__Poster {
		top: 0;
		left: 0;
		width: 100%;
	}
	.movie__Column {
		width: 100% !important;
	}
}
</style>
<link />
</head>
<body>
	<nav class="navbar navbar-default" id="nav_bar">
		<div class="container">
			<div class="navbar-header">
				<a href="../main.jsp">
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
					<li><a href="../Admin/mypageForm.jsp?id=<%=id%>">My Account</a></li>
					<li><a href="../Admin/cookieLogout.jsp">Logout</a></li>
					<%
						}
									}
									/* 아이디가 없으면 */
									if (id == "") {
					%>
					<li><a href="../Admin/insertMemberForm.jsp">Sign Up</a></li>
					<li><a href="../Admin/login.jsp">Login</a></li>
					<%
						}
									/* 쿠키 값이 없으면 */
								} else {
					%>
					<li><a href="../Admin/insertMemberForm.jsp">Sign Up</a></li>
					<li><a href="../Admin/login.jsp">Login</a></li>
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
	<h3>Movie Modify List</h3>
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
				onclick="location.href='updateMovieForm.jsp?id=<%=number%>'">
				<div class="movie__Column">
					<img src=<%=poster%>>
				</div>
				<div class="movie__Column">
					<h1><%=title%></h1>
					<div class="movie__Genres">
						등급 :
						<%=rank%><br />
						러닝 타임 :
						<%=running%> 분 <br /> 
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