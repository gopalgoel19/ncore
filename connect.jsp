<%@ page import="java.sql.*" %>
<%
	DriverManager.registerDriver(new com.mysql.jdbc.Driver());
	Connection  con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/ncore3", "root", "");
%>