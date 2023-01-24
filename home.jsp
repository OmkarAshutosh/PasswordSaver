<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Home</title>
  <link rel="stylesheet" href="home.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>

<body>
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
  <!-- <a href=logout>Logout </a>||<a href="savedpass.jsp">View Saved passwords</a><hr> -->


  <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">PasswordSaver</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="#">Home</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link" href="/PasswordSaver/about.html">About Us</a>
        </li>
      
      </ul>
      <!-- redirect to log in page -->
      <form class="d-flex" role="search" action="logout">
       
        <button class="btn btn-outline-success" type="submit">Log Out</button>
      </form>
      <form class="d-flex" role="search" id="extrabtn" action="savedpass.jsp" >
        <!-- redirect to Home in page -->
         <button class="btn btn-outline-success" type="submit" onclick="myFunction()">View passwords</button>
       </form>
    </div>
  </div>
</nav>
  



  <div class="container">


    



    <div class="title">Home</div>
    <div class="content">
      <form action="savedpassreg.jsp" method="post">
        <div class="user-details">

          <div class="input-box">
            <span class="details">Social media handle</span>
            <input type="text" placeholder="social media handle" name="socialName" id="socialM" required autocomplete="off">
          </div>


          <div class="input-box">
            <span class="details">Password</span>
            <input type="password" placeholder="Enter your password" name="spass" id="spass" required autocomplete="off">
          </div>

        </div>

        <div class="button">
          <input type="submit" value="Save" >
        </div>
      </form>
    </div>
  </div>
  </div>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script> 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
    <script>
    
      function myFunction() {
    	  //swal("Warning!!!","This page contains personal infromation Make sure no one is around you ","error"); 
        alert("This page contains personal infromation Make sure no one's around you ");
      }
      </script>
    
</body>

</html>