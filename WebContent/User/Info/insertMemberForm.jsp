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

		String searchid = "select 고객_아이디 from 고객 where 고객_아이디='" + id + "'";
		pstmtsearch = conn.prepareStatement(searchid);
		search = pstmtsearch.executeQuery();
		ArrayList<String> idlist = new ArrayList<String>();
		while (search.next()) {
			idlist.add(search.getString("고객_아이디"));
		}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
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
					if (idlist.contains(id)) {
				%>
				<li><a href="./User/Info/mypageForm.jsp?id=<%=id%>">My
						Account</a></li>
				<li><a href="./User/Info/userlogout.jsp">Logout</a></li>
				<%
					} else {
				%>
				<li><a href="./User/Info/insertMemberForm.jsp">Sign Up</a></li>
				<li><a href="./User/Info/login.jsp">Login</a></li>
				<%
					}
				%>
			</ul>
		</div>

	</div>
	</nav>

	<div class="basicform">
		<form action="./insertMemberPro.jsp" method="post">
			<div>
				<h3>회원가입 양식</h3>
				<div class="register_form">
					<input type="text" id="id" name="id" required value="ID"
						onBlur="if(this.value=='')this.value='ID'"
						onFocus="if(this.value=='ID')this.value='' ">
				</div>

				<div class="register_form">
					<input type="password" id="passwd" name="passwd" required
						value="default" onBlur="if(this.value=='')this.value='default'"
						onFocus="if(this.value=='default')this.value='' ">
				</div>

				<div class="register_form">
					<input type="text" id="name" name="name" required value="이름"
						onBlur="if(this.value=='')this.value='이름'"
						onFocus="if(this.value=='이름')this.value='' ">
				</div>

				<div class="register_form">
					<input type="date" id="birth" name="birth">
				</div>

				<div class="register_form">
					<input type="text" id="address" name="address" required value="주소"
						onBlur="if(this.value=='')this.value='주소'"
						onFocus="if(this.value=='주소')this.value='' ">
				</div>

				<div class="register_form">
					<input type="text" id="phone" name="phone" required
						value="전화번호 (-는 생략해주세요)"
						onBlur="if(this.value=='')this.value='전화번호 (-는 생략해주세요)'"
						onFocus="if(this.value=='전화번호 (-는 생략해주세요)')this.value='' ">
				</div>

				<p>
					<small>모든 항목은 필수사항입니다</small>
				</p>
			</div>
			<div>
				<input type="submit" value="회원가입"> <input type="reset"
					value="다시입력">
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