<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String theater_name = request.getParameter("theater_name");
	String theater_address = "";
	String theater_phone = "";
	int theater_auditorium = 0;

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
		String sql = "select * from 영화관 where 영화관_이름=?";

		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, theater_name);

		rs = pstmt.executeQuery();
		rs.next();

		theater_name = rs.getString("영화관_이름");
		theater_address = rs.getString("주소");
		theater_phone = rs.getString("전화번호");
		theater_auditorium = rs.getInt("총상영관");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>영화관 수정</title>
<link rel="stylesheet" href="../CSS/BasicForm.css">
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
				<a href="../main.jsp">
					<div class="navbar-brand">CNU Movie</div>
				</a>
			</div>

			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="theaterList.jsp">Theater List</a></li>
					<li><a href="./insertTheaterForm.jsp">Theater Register</a></li>
					<li><a href="./updateTheaterForm.jsp">Theater Modify</a></li>
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
					<li><a href="../Admin/mypageForm.jsp?id=<%=id%>">My
							Account</a></li>
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
	<div class="basicform">
		<form method="post" action="updateTheaterPro.jsp?id=<%=theater_name%>">
			<h3>영화관 수정 양식</h3>
			<div class="register_form">
				<input type="text" name="theater_name" value="<%=theater_name%>">
			</div>
			<div class="register_form">
				<input type="text" name="theater_address" value="<%=theater_address%>">
			</div>

			<div class="register_form">
				<input type="text" name="theater_phone" value="<%=theater_phone%>">
			</div>

			<div class="register_form">
				<input type="text" name="theater_auditorium" value="<%=theater_auditorium%>">
			</div>

			<div>
				<button class="button" type="submit">Edit</button>
				<button class="button" onclick="location.href='theaterList.jsp'">Back</button>
			</div>
		</form>
			<button class="button" onclick="location.href='deleteTheaterPro.jsp?id=<%=theater_name%>'">Delete</button>
	</div>
</body>
</html>

<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>