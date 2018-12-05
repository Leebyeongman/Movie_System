<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	int number = Integer.parseInt(request.getParameter("id"));
	String title = request.getParameter("title");
	String director = request.getParameter("director");
	String actors = request.getParameter("actor");
	String rank = request.getParameter("rank");
	String rtime = request.getParameter("running");
	String poster = request.getParameter("poster");
	int open = Integer.parseInt(request.getParameter("open"));
	String info = request.getParameter("info");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);   
		
		String sql = "update 영화 set 제목=?, 감독=?, 출연=?, 등급=?, 러닝타임=?, 포스터=?, 상영중=?, 주요정보=? where 영화_아이디=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, director);
		pstmt.setString(3, actors);
		pstmt.setString(4, rank);
		pstmt.setString(5, rtime);
		pstmt.setString(6, poster);
		pstmt.setInt(7, open);
		pstmt.setString(8, info);
		pstmt.setInt(9, number);
		pstmt.executeUpdate();
		str = "영화가 수정 되었습니다.";
	} catch (Exception e) {
		e.printStackTrace();
		str = "등록 실패";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script>
	alert("영화가 수정 되었습니다.");
	location.href = "movieList.jsp";
</script>
</head>
</html>