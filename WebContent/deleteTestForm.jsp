<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������ ����</title>
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
	<form method="post" action="deleteTestPro.jsp">
		<div>
			<h3>ȸ������ ����</h3>
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
		</div>
		<div>
			<button class="button" type="submit">����</button>
			<button class="button" type="submit">�ʱ�ȭ</button>
		</div>
	</form>
</body>
</html>