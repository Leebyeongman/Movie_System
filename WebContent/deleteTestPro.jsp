<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>

<% request.setCharacterEncoding("euc-kr"); %>

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
      String sql = "select ��_���̵�, ��й�ȣ from �� where ��_���̵�=?";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1,id);
      rs = pstmt.executeQuery();
      
      if(rs.next()) {
    	  String rId = rs.getString("��_���̵�");
    	  String rPasswd = rs.getString("��й�ȣ");
      	if(id.equals(rId) && passwd.equals(rPasswd)) {
      		sql = "delete from �� where ��_���̵� = ?";
      		pstmt = conn.prepareStatement(sql);
      		pstmt.setString(1, id);
      		pstmt.executeUpdate();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset = EUC-KR">
<title>���ڵ� ����</title>
</head>
<body>
   ȸ�������� �����߽��ϴ�.
</body>
</html>
<%
      	}else{
      		out.println("�н����尡 Ʋ�Ƚ��ϴ�.");
      	}
      }else{
    		out.println("���̵� Ʋ�Ƚ��ϴ�.");
    	}
   }catch(Exception e) {
	   out.print("�� �ȵ�");
	   e.printStackTrace();
   }finally{
	   if(rs != null) try{rs.close();}catch(SQLException sqle){}
	   if(pstmt != null) try{pstmt.close();}catch(SQLException sqle){}
	   if(conn != null) try{conn.close();}catch(SQLException sqle){}
   }
%>
