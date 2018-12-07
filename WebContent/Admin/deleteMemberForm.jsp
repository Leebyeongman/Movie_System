<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 삭제</title>
<link rel="stylesheet" href="../CSS/BasicForm.css">
</head>
<body>
	<div class="basicform">
		<form method="post" action="deleteMemberPro.jsp">
			<div>
				<h3>회원정보 삭제</h3>
				<div class="register_form">
					<input type="text" id="id" name="id" required value="ID" value=""
						onBlur="if(this.value=='')this.value='ID'"
						onFocus="if(this.value=='ID')this.value='' " maxlength="10">
				</div>

				<div class="register_form">
					<input type="password" id="passwd" name="passwd" required
						value="비밀번호" value="" onBlur="if(this.value=='')this.value='비밀번호'"
						onFocus="if(this.value=='비밀번호')this.value='' " maxlength="10">
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