
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>

<head>
    <title>Airline Reservations-Register</title>
    <link rel="SHORTCUT ICON" href="logo.ico">
    <link rel="stylesheet" type="text/css" href="register.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css">

<body>
    <div class="loginbox">
        <img src="avatar.png" class="avatar">
        <h1>Register</h1>
        <form action="registerbackend.jsp" name="regF">
        <table>
                <tr>
                    <td>
                        <p>First Name</p>
                        <input type="text" name="fname" id="fname" placeholder="Enter FirstName" required>
                    </td>
                    <td>
                        <p>Last Name</p>
                        <input type="text" name="lname" id="lname" placeholder="Enter LastName" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Date of Birth</p>
                        <input type="text" name="dob" id="dob" placeholder="yyyy-mm-dd" required>
                    </td>
                    <td>
                        <p>Phone:</p>
                        <input type="text" name="phoneno" id="phoneno" placeholder="Enter your Phone-Number" required>
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Address:</p>
                        <input type="text" name="address" id="address" placeholder="Enter the Address" required>
                    </td>
                    
                    <td>
                        <%@ page import="java.sql.*" %>
                 <%@ page import="javax.sql.*" %>
                 <% 
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline?useSSL=false","root","linuxconfig.org");
                            String Query="select CityName from City";
                            PreparedStatement psm=conn.prepareStatement(Query);
                            ResultSet rs=psm.executeQuery();
                            %>
                            <select id="CityName" name="CityName" required placeholder="Select City">
                            <%
                            while(rs.next())
                            {
                                out.println("<option value='"+rs.getString("CityName")+"'>"+rs.getString("CityName")+"</option>");
                              
                            }
                            
                            
                %> 
                           </select></td></tr> 
        <tr>
            <td>
                <p>Email</p>
                        <input type="email" name="Email" id="Email" placeholder="Enter Email-id" required>
            </td>
            
        </tr>
               
                <tr><td>
                        <p>UserName</p>
                        <%/* 
                            out.print("<input type='text' name='' id='username' placeholder='Enter a UserName' required>");
                        Class.forName("com.mysql.jdbc.Driver").newInstance();
                        String uname=request.getParameter("username");
                            String query="select username from Passenger where username=?";
                            
                            PreparedStatement prepsm=conn.prepareStatement(query);
                            prepsm.setString(1,uname);
                            ResultSet res=prepsm.executeQuery();
                            
                            if(res.first()){
                                out.print("<j>Username already Exists</j>");
                            }else{
                                out.print("<k>Username available</k>");
                            }
                            
                       */ %>
                        <input type="text" name="username" id="username" placeholder="Enter a UserName" onchange="checkExist();" required>
                    </td>
                    <td><span id="isE"></span></td>
                </tr>
                <tr>
                    <td>
                    <p>Password</p>
                    <input type="password" name="password" id="password" placeholder="Enter Password" onkeyup="check();" required>
                    </td>
                <td>
                    <p>Re-Enter Password</p>
                    <input type="password" name="password" id="password1" placeholder="Re-enter Password" onkeyup="check();" required>
                </td></tr>
                <tr><td></td>
                    <td><p><span id='message'></span></p></td>
                </tr>
                <script>
var check = function() {

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
  
  function togglepassword() {
    var x = document.getElementById("password");
    var y = document.getElementById("password1");
    if ((x.type && y.type) === "password") {
        x.type = "text";
        y.type = "text";
    } else {
        x.type = "password";
        y.type = "password";
    }
}

function checkstatus(){
    var a = document.getElementById("submit");
    if(a.disabled !== true)
    {
        response.sendRedirect("reg.jsp");
    }
}

                /*function viewPassword()
{
  var passwordInput = document.getElementById('password');
  var passwordInput1 = document.getElementById('password1');
  var passStatus = document.getElementById('pass-status');
 
  if (passwordInput.type == 'password' && passwordInput1.type == 'password1'){
    passwordInput.type='text';
    passwordInput1.type='text';
    passStatus.className='fa fa-eye-slash';
    
  }
  else{
    passwordInput.type='password';
    passwordInput1.type='password';
    passStatus.className='fa fa-eye';
  } */
                </script>
            
        </table>
                            <input type="submit" id="register" name="register" value="Register">
                            <a href="login.html" id="alreadyhaveanaccount">Already have an account?</a>
    </form>
    </div>

</body>
</head>

</html>