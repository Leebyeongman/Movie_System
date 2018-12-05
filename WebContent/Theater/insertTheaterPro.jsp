<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");

	String name = request.getParameter("t_name");
	String address = request.getParameter("t_address");
	String phone = request.getParameter("t_number");
	int auditorium = Integer.parseInt(request.getParameter("t_total"));
	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		pstmt = conn.prepareStatement("insert into 영화관 values (?, ?, ?, ?)");
		pstmt.setString(1, name);
		pstmt.setString(2, address);
		pstmt.setString(3, phone);
		pstmt.setInt(4, auditorium);
		pstmt.executeUpdate();

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

<head>
<meta charset="UTF-8">
<script>
	alert("영화가 등록 되었습니다.");
	location.href = "../main.jsp";
</script>
</head>
</html>