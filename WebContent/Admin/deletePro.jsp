<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<% 
	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String table = request.getParameter("table");
	String location ="movieManagement.jsp";
	String delete="";
	if(table.equals("movie")){
		location = "managementMovie.jsp";
		delete = "delete from 영화 where 영화_아이디="+request.getParameter("영화_아이디");
	}
	else if(table.equals("customer")){
		location = "main.jsp";
		delete = "delete from 고객 where 고객_아이디="+id;
	}
	else if(table.equals("theater")){
		location = "managementTheater.jsp";
		delete = "delete from 영화관 where 영화관_이름='"+request.getParameter("영화관_이름")+"'";
	}
	else
		table="상영관";

	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";
		
		
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);
		
		String sql = "select 고객_아이디, 비밀번호 from 고객 where 고객_아이디 =?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();
		
		if(rs.next()){
			String rId = rs.getString("고객_아이디");
			String rPasswd = rs.getString("비밀번호");
			
			if(id.equals(rId) && passwd.equals(rPasswd)){
				Cookie[] cookies = request.getCookies();
				if(cookies != null){
					for(int i =0; i<cookies.length; ++i){
						if(cookies[i].getName().equals("id")){
							cookies[i].setMaxAge(0);
							response.addCookie(cookies[i]);
						}
					}
				}
				
				sql = delete;
				pstmt = conn.prepareStatement(sql);
				pstmt.executeUpdate();
	%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>레코드 삭제</title>
</head>
<body>
	<script>
	alert("삭제하였습니다.");
	location.href="<%=location%>";
</script>
</body>
</html>
<%			}else{
					out.println("패스워드가 틀렸습니다.");
				}
			}else{
				out.println("아이디가 틀렸습니다.");
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null) try{rs.close();}catch(SQLException sqle){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
			if(conn != null) try{conn.close();}catch(SQLException sqle){}
		}
	%>