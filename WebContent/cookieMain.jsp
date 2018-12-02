<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인 성공</title>
</head>
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

.login_success {
	height: 50px;
	font-family: inherit;
	font-size: 17px;
	outline: none;
	padding: 0px 10px;
	width: 260px;
	margin: 5px 0px;
}
</style>
<body>
	<%
		String id = "";
		try {
			Cookie[] cookies = request.getCookies();
			if (cookies != null) {
				for (int i = 0; i < cookies.length; ++i) {
					if (cookies[i].getName().equals("id")) {
						id = cookies[i].getValue();
						response.sendRedirect("main.jsp");
					}
				}
				if (id.equals("")) {
					response.sendRedirect("login.jsp");
				}
			} else {
				response.sendRedirect("login.jsp");
			}
		} catch (Exception e) {
		}
	%>
</body>
</html>