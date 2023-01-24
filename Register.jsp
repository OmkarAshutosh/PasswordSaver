<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<%!
	Connection con = null;
	Statement smt=null;
	public void jspInit(){
		try{
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","omkar");
			smt = con.createStatement();
		}catch(Exception ee){
			ee.printStackTrace();
		}
	}
	
	public void jspDestroy(){
		try{
			smt.close();
			con.close();
		}catch(Exception ee){
			ee.printStackTrace();
		}
	}
%>
<%
	String n=null;
	String name = request.getParameter("userName");
	long mob = Long.parseLong(request.getParameter("ph"));
	String pass = request.getParameter("pass");
	String id="sqps.nextval";
	
	String qry = "INSERT INTO PS_user VALUES("+id+",'"+name+"',"+mob+",'"+pass+"')";
	//String qry2="INSERT Into PS_passlist values("+mob+",'"+n+"','"+n+"')";
	int i = smt.executeUpdate(qry);
	
	if(i>0){
		%>
	<h1>User Added</h1>
			<a href="Register.html">Go Back</a>
		<%
	}else{
		%>
			<h1>Error !!!</h1>
			<a href="Register.html">Go Back</a>
		<%
		
	}
%>
</body>
</html>