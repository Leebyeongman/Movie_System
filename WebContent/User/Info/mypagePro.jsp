<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String id = (String) request.getSession().getAttribute("고객_아이디");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String point = request.getParameter("point");
	String vip = request.getParameter("vip");

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "update 고객 set 비밀번호=?, 이름=?, 생년월일=?, 주소=?, 전화번호=? where 고객_아이디 = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, passwd);
		pstmt.setString(2, name);
		pstmt.setString(3, birth);
		pstmt.setString(4, address);
		pstmt.setString(5, phone);
		pstmt.setString(6, id);
		pstmt.executeUpdate();
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<script>
	alert("회원정보가 변경되었습니다.");
	location.href = "mypageForm.jsp?";
</script>