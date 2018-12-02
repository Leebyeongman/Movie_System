<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String id = request.getParameter("고객_아이디");
	String pw = request.getParameter("비밀번호");
	String name = request.getParameter("이름");
	String address = request.getParameter("주소");
	String birth = request.getParameter("생년월일");
	String ph = request.getParameter("전화번호");
	out.print(id);
	out.print(pw);
	out.print(name);
	out.print(address);
	out.print(birth);
	out.print(ph);
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	out.print("응 왔어");
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "update 고객 set 비밀번호=?, 이름=?, 주소=?, 전화번호=? where 고객_아이디 = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, pw);
		pstmt.setString(2, name);
		pstmt.setString(3, address);
		pstmt.setString(4, ph);
		pstmt.setString(5, id);
		pstmt.executeUpdate();
		out.print("응 업데이트 했어");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원정보 수정</title>
</head>
<body>
	<div id="header">
		수정완료
	</div>
</body>
</html>
<script>
	alert("회원정보가 변경되었습니다.");
	location.href="mypageForm.jsp?id=<%=id%>";
</script>
<%
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs != null) try{rs.close();}catch(SQLException sqle){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
		if(conn != null) try{conn.close();}catch(SQLException sqle){}
	}
%>