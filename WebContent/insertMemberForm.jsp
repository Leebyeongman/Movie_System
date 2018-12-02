<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
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
	margin : 5px 0px;
}

</style>
</head>
<body>
	<form action="insertMemberPro.jsp" method="post">
		<div>
			<h3>회원가입 양식</h3>
				<div class="register_form">
					<input type="text" id="id" name="id" required value="ID" value=""
						onBlur="if(this.value=='')this.value='ID'"
						onFocus="if(this.value=='ID')this.value='' " maxlength="10">
				</div>

				<div class="register_form">
					<input type="password" id="passwd" name="passwd" required
						value="비밀번호" value=""
						onBlur="if(this.value=='')this.value='비밀번호'"
						onFocus="if(this.value=='비밀번호')this.value='' " maxlength="10">
				</div>

				<div class="register_form">
					<input type="text" id="name" name="name" required value="이름"
						value="" onBlur="if(this.value=='')this.value='이름'"
						onFocus="if(this.value=='이름')this.value='' " maxlength="10">
				</div>

				<div class="register_form">
					<input type="text" id="address" name="address" required value="주소"
						value="" onBlur="if(this.value=='')this.value='주소'"
						onFocus="if(this.value=='주소')this.value='' " maxlength="30">
				</div>

				<div class="register_form">
					<input type="text" id="phone" name="phone" required
						value="전화번호 (-는 생략해주세요)" value=""
						onBlur="if(this.value=='')this.value='전화번호 (-는 생략해주세요)'"
						onFocus="if(this.value=='전화번호 (-는 생략해주세요)')this.value='' "
						maxlength="11">
				</div>

				<p>
					<small>모든 항목은 필수사항입니다</small>
				</p>
		</div>
		<div>
			<input type="submit" value="회원가입"> 
			<input type="reset" value="다시입력">
		</div>
	</form>
</body>
</html>