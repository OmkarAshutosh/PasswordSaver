function validate(){
const name = document.getElementById("userName").value;
const mob = document.getElementById("ph").value;
const password = document.getElementById("pass").value;
if(name==""){
alert("Please enter your name");
return false;
}
if(mob==""){
alert("Please enter your mobile number");
return false;
} else if(isNaN(mob)|| mob.length !=10){
alert("Please enter a valid 10 digit mobile number");
return false;
}
if(password.length<6 || password.length>15){
alert("Please enter a password of 6 - 15 character")
return false;
}

}

