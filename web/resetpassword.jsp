<%-- 
    Document   : resetpassword
    Created on : 25 Nov, 2018, 10:49:05 PM
    Author     : bharath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <title>Reset Password</title>
        <link rel="SHORTCUT ICON" href="logo.ico"> 
        <link rel="stylesheet" type="text/css" href="resetpassword.css">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
        <div class="loginbox">
    <img src="avatar.png" class="avatar">
        <h1>Reset Password</h1>
        <form method="post" action="resetcheck.jsp">
            <p>Username</p>
            <input type="text" name="username" placeholder="Enter your Username" required>
            <p>Email</p>
            <input type="text" name="email" placeholder="Enter Email-id" required> 
             <p>Date Of Birth</p>
             <input type="text" name="dob" placeholder="yyyy-mm-dd" required>
            <p>Phone:</p>
            <input type="text" name="phone" placeholder="Enter 10 digit Phone-Number"required>
            <input type="submit" name="reset" value="Next">
             
          </form>
        </div>
        
       
    </body>
</html>


