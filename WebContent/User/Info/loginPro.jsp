<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("passwd");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "select * from 고객 where 고객_아이디=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next() && password.equals(rs.getString("비밀번호"))) {
			request.getSession().setAttribute("고객_아이디", id);
		}
		else {
			response.sendRedirect("./loginfail.jsp");
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
%>

<script>
	alert("반갑습니다. CNU Movie 입니다");
	location.href = "../../main.jsp";
</script>
