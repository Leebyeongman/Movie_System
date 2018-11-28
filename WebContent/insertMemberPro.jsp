<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import = "java.sql.*" %>
<%@ page import = "login.LogonDBBean" %>
<% request.setCharacterEncoding("euc-kr"); %>

<jsp:useBean id="member" class="login.LogonDataBean">
	<jsp:setProperty name="member" property="*"/>
</jsp:useBean>

<%
	LogonDBBean logon = LogonDBBean.getInstance();
	logon.insertMember(member);
%>

<jsp:getProperty property="id" name="member"/>님 회원가입을 축하합니다.
<!-- 
<button type="button" onclick="location.href='login.jsp'">로그인</button>
<button type="button" onclick="location.href='main.jsp'">메인페이지로 이동</button>
 -->