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
	Long mob=(Long)session.getAttribute("number");
	String shandle = request.getParameter("socialName");
	String sopass = request.getParameter("spass");
	//long mob = Long.parseLong(request.getParameter("ph"));
	String qry = "insert into PS_passlist values("+mob+", '"+shandle+"','"+sopass+"')";
	int i = smt.executeUpdate(qry);
	
	if(i>0){
		%>
	<h1>Password saved</h1>
			<a href="home.jsp">Go Back</a>
		<%
	}else{
		%>
			<h1>Error !!!</h1>
			<a href="home.jsp">Go Back</a>
		<%
		
	}
%>
</body>
</html>