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
<title>마이페이지</title>
<style>
body {
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

button {
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
	<div id="container">
		<%
			String point = "";
			String id = request.getParameter("id");
			String sql = "select 고객_아이디, 비밀번호, 이름, 주소, 전화번호, 포인트 from 고객 where 고객_아이디='" + id + "'";
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
		%>
		<h1>회원정보관리</h1>
		<div>
			<form method="post" action="mypagePro.jsp?id=<%=id%>">
				<div class="register_form">
					<input type="text" id="id" name="id" readonly
						value="<%=rs.getString(1)%>">
				</div>
				<div class="register_form">
					<input type="password" id="passwd" name="passwd"
						value="<%=rs.getString(2)%>">
				</div>
				<div class="register_form">
					<input type="text" id="name" name="name"
						value="<%=rs.getString(3)%>">
				</div>
				<div class="register_form">
					<input type="text" id="address" name="address"
						value="<%=rs.getString(4)%>">
				</div>
				<div class="register_form">
					<input type="text" id="phone" name="phone"
						value="<%=rs.getString(5)%>">
				</div>
				<div class="register_form">
					<input type="text" id="point" name="point"
						value="<%=rs.getString(6)%>">
				</div>
				<button type="submit">수정완료</button>
				<button type="button" onclick="check()">탈퇴</button>
			</form>

			<button type="button" onclick="location.href='../main.jsp'">메인 페이지</button>

			<div id="modal" style="display: none;">
				<form method="post" action="deleteMemberPro.jsp?table=customer">
					<input type="hidden" required name="id" value="<%=id%>">
					<ul>
						<li class="first2">비밀번호</li>
						<li><input class="second2" type="password" required
							name="passwd"></li>
					</ul>
					<input type="hidden" value="<%=id%>" name="고객_아이디">
					<ul>
						<li><button type="submit">삭제</button></li>
						<li><button type="button" onclick="cancel()">취소</button></li>
					</ul>
				</form>
			</div>
		</div>
	</div>
	<%
		}
	%>
	<script>
		function check() {
			var modal1 = document.getElementById('modal');
			modal1.style.display = "block";
		}
		function cancel() {
			var modal1 = document.getElementById('modal');
			modal1.style.display = "none";
		}
	</script>
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