<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");

	String theater_name = request.getParameter("theater_name");
	String theater_address = request.getParameter("theater_address");
	String theater_phone = request.getParameter("theater_phone");
	int theater_auditorium = Integer.parseInt(request.getParameter("theater_auditorium"));

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
		pstmt.setString(1, theater_name);
		pstmt.setString(2, theater_address);
		pstmt.setString(3, theater_phone);
		pstmt.setInt(4, theater_auditorium);
		pstmt.executeUpdate();
		
		request.getSession().setAttribute("theater_name", theater_name);
		request.getSession().setAttribute("theater_auditorium", Integer.toString(theater_auditorium));
		response.sendRedirect("insertAuditoriumForm.jsp");

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
	location.href = "theaterList.jsp";
</script>
</head>
</html>