<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>
<%
	request.setCharacterEncoding("utf-8");
%>

<%
	String theater_name = (String) request.getSession().getAttribute("theater_name");
	String auditorium_number = (String) request.getSession().getAttribute("theater_auditorium");
	int auditorium_count = Integer.parseInt(auditorium_number);

	request.getSession().setAttribute("theater_name", theater_name);
	request.getSession().setAttribute("theater_auditorium", auditorium_number);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상영관 추가</title>
<link rel="stylesheet" href="../CSS/BasicForm.css">
<!-- bootstrap -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous">
	
</script>
</head>
<body>
	<div class="basicform">
		<form action="insertAuditoriumPro.jsp">
			<h3><%=theater_name%></h3>
			<%
				for (int i = 1; i <= auditorium_count; i++) {
			%>
			<div class="register_form">
				<input type="text" name="auditorium<%=i%>"
					value="상영관 <%=i%>의 총 좌석" required
					onBlur="if(this.value=='')this.value='상영관 <%=i%>의 총 좌석'"
					onFocus="if(this.value=='상영관 <%=i%>의 총 좌석') this.value='' ">
			</div>
			<%
				}
			%>
			<input type="submit" value="Enter">
		</form>
	</div>
</body>
</html>


