<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%
	int id = Integer.parseInt(request.getParameter("id"));

	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;

	try {
		String jdbcUrl = "jdbc:mysql://localhost:3306/moviedb";
		String dbId = "root";
		String dbPass = "dlqudaks12";

		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(jdbcUrl, dbId, dbPass);

		String sql = "delete from 영화 where 영화_아이디 = ?"; // ex) 3번째 삭제
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, id);
		pstmt.executeUpdate();

		stmt = conn.createStatement();
		sql = "select count(*) from 영화";
		rs = stmt.executeQuery(sql);
		rs.next();
		int total_movieId = rs.getInt(1); // 4가 나옴

		for (int i = id; i <= total_movieId; i++) {
			sql = "update 영화 set 영화_아이디=? where 영화_아이디=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, i); // 3로
			pstmt.setInt(2, i + 1); // 3+1를 , 4+1를 ....
			pstmt.executeUpdate();
		}
%>

<script>
	location.href = "movieList.jsp";
	alert("영화 삭제가 완료되었습니다.");
</script>
<%
	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException sqle) {
			}
		if (pstmt != null)
			try {
				pstmt.close();
			} catch (SQLException sqle) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (SQLException sqle) {
			}
	}
%>
