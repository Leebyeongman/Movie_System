<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
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
.userSignUp {
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
				<li><a href="../Movie/insertMovieForm.jsp">Movie</a></li>
				<li><a href="../Theater/theaterList.jsp">Theater</a></li>
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
				<li><a href="./mypageForm.jsp?id=<%=id%>">My Account</a></li>
				<li><a href="./cookieLogout.jsp">Logout</a></li>
				<%
					}
							}
							/* ���̵� ������ */
							if (id == "") {
				%>
				<li><a href="./insertMemberForm.jsp">Sign Up</a></li>
				<li><a href="./login.jsp">Login</a></li>
				<%
					}
							/* ��Ű ���� ������ */
						} else {
				%>
				<li><a href="./insertMemberForm.jsp">Sign Up</a></li>
				<li><a href="./login.jsp">Login</a></li>
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
	<div class="userSignUp">
		<form action="insertMemberPro.jsp" method="post">
			<div>
				<h3>ȸ������ ���</h3>
				<div class="register_form">
					<input type="text" id="id" name="id" required value="ID" value=""
						onBlur="if(this.value=='')this.value='ID'"
						onFocus="if(this.value=='ID')this.value='' " maxlength="10">
				</div>

				<div class="register_form">
					<input type="password" id="passwd" name="passwd" required
						value="��й�ȣ" value="" onBlur="if(this.value=='')this.value='��й�ȣ'"
						onFocus="if(this.value=='��й�ȣ')this.value='' " maxlength="10">
				</div>

				<div class="register_form">
					<input type="text" id="name" name="name" required value="�̸�"
						value="" onBlur="if(this.value=='')this.value='�̸�'"
						onFocus="if(this.value=='�̸�')this.value='' " maxlength="10">
				</div>

				<div class="register_form">
					<input type="text" id="address" name="address" required value="�ּ�"
						value="" onBlur="if(this.value=='')this.value='�ּ�'"
						onFocus="if(this.value=='�ּ�')this.value='' " maxlength="30">
				</div>

				<div class="register_form">
					<input type="text" id="phone" name="phone" required
						value="��ȭ��ȣ (-�� �������ּ���)" value=""
						onBlur="if(this.value=='')this.value='��ȭ��ȣ (-�� �������ּ���)'"
						onFocus="if(this.value=='��ȭ��ȣ (-�� �������ּ���)')this.value='' "
						maxlength="11">
				</div>

				<p>
					<small>��� �׸��� �ʼ������Դϴ�</small>
				</p>
			</div>
			<div>
				<input type="submit" value="ȸ������"> <input type="reset"
					value="�ٽ��Է�">
			</div>
		</form>
	</div>
</body>
</html>