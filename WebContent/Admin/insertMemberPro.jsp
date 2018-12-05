<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "login.LogonDBBean" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="member" class="login.LogonDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>

<%
	LogonDBBean logon = LogonDBBean.getInstance();
	logon.insertMember(member);
%>

<script>
	location.href="../main.jsp";
</script>
