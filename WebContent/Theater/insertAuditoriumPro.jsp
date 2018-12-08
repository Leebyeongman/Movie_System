<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%
	String theater_name = (String) request.getSession().getAttribute("theater_name");
	int auditorium_count = Integer.parseInt((String) request.getSession().getAttribute("theater_auditorium"));
	int[] seat_cnt = new int[auditorium_count];
	
	for (int i = 0; i < auditorium_count; i++) {
		String num = Integer.toString(i+1);
		seat_cnt[i] = Integer.parseInt(request.getParameter("auditorium"+num));
		System.out.println(seat_cnt[i]);
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	String str = "";
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "select * from 상영관";
		
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		int last_number = 1;
		
		if (rs.last()) {
			last_number = Integer.parseInt(rs.getString("상영관_아이디")) + 1;
		}
		
		for (int i = 0; i < auditorium_count; i++) {
			String num = Integer.toString(last_number + i);
			String sql2 = "insert into 상영관 values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql2);
			
			pstmt.setString(1, num);
			pstmt.setString(2, theater_name);
			pstmt.setInt(3, seat_cnt[i]);
			pstmt.setInt(4, 1);
			pstmt.executeUpdate();
			System.out.println("sucess");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>


<head>
<meta charset="UTF-8">
<script>
	alert("영화관이 등록 되었습니다.");
	location.href = "theaterList.jsp";
</script>
</head>
</html>