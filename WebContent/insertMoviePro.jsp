<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");

	String title = request.getParameter("title");
	String director = request.getParameter("director");
	String actor = request.getParameter("actor");
	String rank = request.getParameter("rank");
	String rtime = request.getParameter("running");
	String poster = request.getParameter("poster");
	int on = Integer.parseInt(request.getParameter("상영중"));
	String info = request.getParameter("info");

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

		stmt = conn.createStatement();
		String sql = "select count(*) from 영화";
		rs = stmt.executeQuery(sql);
		rs.next();
		int id = rs.getInt(1) + 1;

		pstmt = conn.prepareStatement("insert into 영화 values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
		pstmt.setInt(1, id);
		pstmt.setString(2, title);
		pstmt.setString(3, director);
		pstmt.setString(4, actor);
		pstmt.setString(5, rank);
		pstmt.setString(6, rtime);
		pstmt.setString(7, poster);
		pstmt.setInt(8, 1);
		pstmt.setString(9, info);
		pstmt.setInt(10, 0);
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
	location.href = "movieList.jsp";
</script>
</head>
</html>