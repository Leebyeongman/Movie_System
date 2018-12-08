<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("passwd");
	String name = request.getParameter("name");
	String birth = request.getParameter("birth");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String vip = " ";

	Connection conn = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmtsearch = null;
	String str = "";

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String searchid = "select 고객_아이디 from 고객 where 고객_아이디='" + id + "'";
		pstmtsearch = conn.prepareStatement(searchid);
		ResultSet rs = pstmtsearch.executeQuery();
		ArrayList<String> idlist = new ArrayList<String>();
		while (rs.next()) {
			idlist.add(rs.getString("고객_아이디"));
		}
		if (!idlist.contains(id)) {
			String sql = "insert into 고객 values(?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setString(4, birth);
			pstmt.setString(5, address);
			pstmt.setString(6, phone);
			pstmt.setInt(7, 0);
			pstmt.setString(8, vip);
			pstmt.executeUpdate();
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
%>
<script>
	alert("반갑습니다. 회원가입이 성공하였습니다.");
	location.href = "../../main.jsp";
</script>
