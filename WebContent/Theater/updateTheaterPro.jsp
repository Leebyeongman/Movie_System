<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String theater_name = request.getParameter("theater_name");
	String theater_address = request.getParameter("theater_address");
	String theater_phone = request.getParameter("theater_phone");
	String theater_auditorium = request.getParameter("theater_auditorium");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);   
		
		String sql = "update ��ȭ�� set �ּ�=?, ��ȭ��ȣ=?, �ѻ󿵰�=? where ��ȭ��_�̸�=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, theater_address);
		pstmt.setString(2, theater_phone);
		pstmt.setString(3, theater_auditorium);
		pstmt.setString(4, theater_name);
		pstmt.executeUpdate();
		str = "��ȭ���� ���� �Ǿ����ϴ�.";
		
	} catch (Exception e) {
		e.printStackTrace();
		str = "��� ����";
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script>
	alert("��ȭ���� ���� �Ǿ����ϴ�.");
	location.href = "theaterList.jsp";
</script>
</head>
</html>