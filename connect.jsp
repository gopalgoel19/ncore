<%@ page import="java.sql.*" %>
<%@ page import="java.math.*" %>
<%
	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	
	Connection  con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncore", "root", "y0l0g0d?");
%>