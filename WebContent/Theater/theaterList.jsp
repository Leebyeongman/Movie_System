<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "select * from 영화관";

		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Theater List</title>
<link rel="stylesheet" href="../CSS/BasicForm.css">
<link rel="stylesheet" href="../CSS/theaterList.css">
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
					<li><a href="insertTheaterForm.jsp">Theater Register</a></li>
					<li><a href="movieList.jsp">Theater Modify</a></li>
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

		<h3>Theater List</h3>
		<table>
			<thead>
				<tr>
					<th class="th">영화관</th>
					<th class="th">주소</th>
					<th class="th">전화번호</th>
					<th class="th">총 상영관</th>
				</tr>
			</thead>

			<tbody>
				<%
					while (rs.next()) {
							String theater_name = rs.getString("영화관_이름");
							String theater_address = rs.getString("주소");
							String theater_phone = rs.getString("전화번호");
							int theater_auditorium = rs.getInt("총상영관");
				%>
				<tr>
					<td>
						<strong>
							<a href="updateTheaterForm.jsp?theater_name=<%=theater_name%>"><%=theater_name%></a>
						</strong>
					</td>
					<td><%=theater_address%></td>
					<td><%=theater_phone%></td>
					<td><%=theater_auditorium%></td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>

<%
	} catch (Exception e) {
		e.printStackTrace();
	}
%>