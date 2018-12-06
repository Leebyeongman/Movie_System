<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String theater_name = request.getParameter("theater_name");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String total_num = request.getParameter("total_num");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);   
		
		String sql = "update 영화관 set 주소=?, 전화번호=?, 총상영관=? where 영화관_이름=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, address);
		pstmt.setString(2, phone);
		pstmt.setString(3, total_num);
		pstmt.setString(4, theater_name);
		pstmt.executeUpdate();
		str = "영화관이 수정 되었습니다.";
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
	alert("영화관이 수정 되었습니다.");
	location.href = "theaterList.jsp";
</script>
</head>
</html>