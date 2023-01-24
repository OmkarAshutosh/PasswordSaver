<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*" %>
<!DOCTYPE html>

<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <link rel="stylesheet" href="login.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
</head>
<body>

  <div class="wrapper">
    <header>Login</header>
    <form method="post" action="login" onsubmit="return validate()" >
      <div class="field email">
        <div class="input-area">
          <input type="text" placeholder="Phone number" name="ph" id="ph" autocomplete="off">
          <i class="icon fas fa-envelope"></i>
          <i class="error error-icon fas fa-exclamation-circle"></i>
        </div>
        <div class="error error-txt">Phone number can't be blank</div>
      </div>
      <div class="field password">
        <div class="input-area">
          <input type="password" placeholder="Password" name="pass" id="pass">
          <i class="icon fas fa-lock"></i>
          <i class="error error-icon fas fa-exclamation-circle"></i>
        </div>
        <div class="error error-txt">Password can't be blank</div>
      </div>
     
      <input type="submit" value="Login">
    </form>
    <div class="sign-txt">Not yet member? <a href="/PasswordSaver/Register.html">Signup now</a></div>
  </div>
  
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@7.12.15/dist/sweetalert2.all.min.js"></script> 
  <script>
 
  function validate(){
    
    const mob = document.getElementById("ph").value;
    const password = document.getElementById("pass").value;
  
    if(mob==""){
    swal("Sorry|","Phone number cannot be blank","error");
    
    return false;
    } else if(isNaN(mob)|| mob.length !=10){
    swal("Sorry|","Please enter a valid 10 digit mobile number","error");
    return false;
    }
    if(password.length<6 || password.length>15){
    	swal("Sorry|","Please enter a password of 6 - 15 character","error");
    /* alert("Please enter a password of 6 - 15 character") */
    return false;
    }
    

    }

  </script>


</body>
</html>