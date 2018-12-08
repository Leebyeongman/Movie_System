<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	String id = (String) request.getSession().getAttribute("ID");
	request.getSession().setAttribute("ID", id);
	String str = "";
	Connection conn = null;
	PreparedStatement pstmt = null;
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		String find_movie_name = "select * from 영화";
		pstmt = conn.prepareStatement(find_movie_name);
		ResultSet rs1 = pstmt.executeQuery();
		
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>select movie</title>
</head>
<body>
	<table>
	<tr>
		<td>num</td>
		<td>Title</td>
		<td>choose</td>
	</tr>
	<%
	int i=0;
	while(rs1.next()){
		int Movie_Number1 = rs1.getInt("영화_아이디");
		String Movie_title = rs1.getString("제목");
		%>
		<tr>
		<td><%=++i %></td>
		
		<form action="user_reservation_theater.jsp" method="get" >
			<td><input type="text" name="Movie_title" value="<%=Movie_title%>" /><td>
			<input type="hidden" name="Movie_Number1" value="<%=Movie_Number1%>"/>
			<td><input type="submit" value="select"><td>
		</form>
		<tr>
		
	<%
	}
	%>
	</table>
</body>
</html>
<%
}catch(Exception e) {
		e.printStackTrace();
		str = "Fail";
	}
%>