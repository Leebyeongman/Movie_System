<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>영화관 등록</title>
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
.theater_register {
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
			<a href="../main.jsp">
				<div class="navbar-brand">CNU Movie</div>
			</a>
		</div>

		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li><a href="insertTheaterForm.jsp">Theater Register</a></li>
				<li><a href="insertTheaterForm.jsp">Theater Modify</a></li>
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
	<div class="theater_register">
		<form method="post" action="insertTheaterPro.jsp">
			<h3>영화관 등록</h3>
			<div class="register_form">
				<input type="text" name="t_name" value="영화관 (ex.CGV 대전)" required
					onBlur="if(this.value=='')this.value='영화관 (ex.CGV 대전)'"
					onFocus="if(this.value=='영화관 (ex.CGV 대전)')this.value='' ">
			</div>

			<div class="register_form">
				<input type="text" name="t_address" value="주소 (ex.대전광역시 중구 계백로 1700)" required
					onBlur="if(this.value=='')this.value='주소 (ex.대전광역시 중구 계백로 1700)'"
					onFocus="if(this.value=='주소 (ex.대전광역시 중구 계백로 1700)')this.value='' ">
			</div>

			<div class="register_form">
				<input type="text" name="t_number" value="전화번호 (ex.1522-1234)" required
					onBlur="if(this.value=='')this.value='전화번호 (ex.1522-1234)'"
					onFocus="if(this.value=='전화번호 (ex.1522-1234)')this.value='' ">
			</div>
			
			<div class="register_form">
				<input type="text" name="t_total" value="총 상영관 (최대 5개)" required
					onBlur="if(this.value=='')this.value='총 상영관 (최대 5개)'"
					onFocus="if(this.value=='총 상영관 (최대 5개)')this.value='' ">
			</div>

			<div>
				<button class="button" type="submit">등록</button>
				<button class="button" type="reset">초기화</button>
			</div>
		</form>
		<button class="button" type="button" onclick="location.href='../main.jsp'">취소</button>
	</div>
</body>
</html>
