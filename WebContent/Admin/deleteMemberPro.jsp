<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
   String id = request.getParameter("id");
   String passwd = request.getParameter("passwd");
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   try{
	  System.out.println(id);
      String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
      String dbId = "root";
      String dbPass = "dlqudaks12";
      
      Class.forName("com.mysql.jdbc.Driver");
      conn = DriverManager.getConnection(jdbcUrl,dbId,dbPass);
      String sql = "select 고객_아이디, 비밀번호 from 고객 where 고객_아이디=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,id);
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
    	  String rId = rs.getString("고객_아이디");
    	  String rPasswd = rs.getString("비밀번호");
      	if(id.equals(rId) && passwd.equals(rPasswd)) {
      		sql = "delete from 고객 where 고객_아이디 = ?";
      		pstmt = conn.prepareStatement(sql);
      		pstmt.setString(1, id);
      		pstmt.executeUpdate();
%>

<script>
	alert("회원 탈퇴가 완료되었습니다.");
	location.href="../main.jsp";
</script>
<%
      	}else{
      		out.println("패스워드가 틀렸습니다.");
      	}
      }else{
    		out.println("아이디가 틀렸습니다.");
    	}
   }catch(Exception e) {
	   e.printStackTrace();
   }finally{
	   if(rs != null) try{rs.close();}catch(SQLException sqle){}
	   if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	   if(conn != null) try{conn.close();}catch(SQLException sqle){}
   }
%>
