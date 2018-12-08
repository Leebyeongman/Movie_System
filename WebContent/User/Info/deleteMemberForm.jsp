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
<title>회원정보 삭제</title>
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
		<form method="post" action="./deleteMemberPro.jsp">
			<div>
				<h3>회원정보 삭제</h3>
				<div class="register_form">
					<input type="text" id="id" name="id" required value="ID" value=""
						onBlur="if(this.value=='')this.value='ID'"
						onFocus="if(this.value=='ID')this.value='' ">
				</div>

				<div class="register_form">
					<input type="password" id="passwd" name="passwd" required
						value="default" value=""
						onBlur="if(this.value=='')this.value='default'"
						onFocus="if(this.value=='default')this.value='' ">
				</div>
			</div>
			<div>
				<button class="button" type="submit">삭제</button>
				<button class="button" type="submit">초기화</button>
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