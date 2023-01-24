 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Your saved passwords</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="sp.css">
  </head>
  <body>
   <%!
	Connection con = null;
	Statement smt = null;
	ResultSet rs= null;
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
	request.getSession(true);
	Long mob=(long)0;
		if(session.getAttribute("number")!= null){
		mob=(Long)session.getAttribute("number");  		
		}
	
		if(mob==0){
		response.sendRedirect("login.jsp");
	}
	%>

<%
	String qry = "SELECT * FROM PS_passlist pp,PS_user pu where pp.mob=pu.mob  and pu.mob="+mob;
	rs = smt.executeQuery(qry);
	%>
	
	

    <nav class="navbar navbar-expand-lg bg-light">
      <div class="container-fluid">
        <a class="navbar-brand" href="home.jsp">PasswordSaver</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="home.jsp">Home</a>
            </li>
           
            <li class="nav-item">
              <a class="nav-link" href="/PasswordSaver/about.html">About Us</a>
            </li>
          
          </ul>
          <!-- redirect to log in page -->
          <form class="d-flex" role="search" action="logout" >
           
            <button class="btn btn-outline-success" type="submit">Log Out</button>
          </form>
          <form class="d-flex" role="search" id="extrabtn" action="home.jsp" >
           <!-- redirect to Home in page -->
            <button class="btn btn-outline-success" type="submit">Go back</button>
          </form>
        </div>
      </div>
    </nav>
      
    <div class="container">
        <div class="content">
    <table class="table" style="color: purple;">
        <thead>
          <tr>
            <th scope="col">User ID</th>
            <th scope="col">Social media handle</th>
            <th scope="col">Password</th>
         
          </tr>
        </thead>
        <tbody>
        <%
	while(rs.next()){
		

		%>
          <tr>
				<td> <%= rs.getInt("user_id") %> </td>
				<td> <%= rs.getString("shandle") %> </td>
				<td> <%= rs.getString("socpass") %> </td>
				
				
			</tr>
			<%
	}
%>
          
        </tbody>
      </table>
    </div>
    <!-- <div class="button">
        <input type="submit" value="back">
      </div> -->
</div>





    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>



