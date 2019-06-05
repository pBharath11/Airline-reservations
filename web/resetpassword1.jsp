<%-- 
    Document   : resetpassword1
    Created on : 25 Nov, 2018, 11:13:54 PM
    Author     : bharath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
            String username=request.getParameter("username");
            %>
<!DOCTYPE html>
<html>
    <head>
       <title>Reset Password</title>
        <link rel="SHORTCUT ICON" href="logo.ico"> 
        <link rel="stylesheet" type="text/css" href="resetpassword.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <script>
function check() {

  if (document.getElementById('password').value ===
    document.getElementById('password1').value ) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'Password Matching';
    document.getElementById('submit').disabled = "false";
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'Password Not Matching';
    document.getElementById('submit').disabled = "true";
  }
  };
  </script>
    </head>
    <body>
        <div class="loginbox">
    <img src="avatar.png" class="avatar">
        <h1>Reset Password</h1>
        <form method="post" action="updatepassword.jsp">
            <p>Username</p>
            <input type="text" name="username" placeholder="Enter your Username" required>
            <p>Enter the new Password</p>
            <input type="password" name="password" placeholder="Enter Password" required>
             <p>Re-Enter new Password</p>
            <input type="password" name="password1" placeholder="Re-enter Password" onkeyup="check();" required>
            <p><span id="message"></span></p>
            <input type="submit" name="reset" value="Reset">
          </form>
        </div>
    </body>
</html>
