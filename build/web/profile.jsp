<%-- 
    Document   : profile
    Created on : 6 Dec, 2018, 5:15:54 PM
    Author     : bharath
--%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="SHORTCUT ICON" href="logo.ico"> 
   <link href='https://fonts.googleapis.com/css?family=Lato:300,400' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="profile.css">
</head>
<body><%
    
        Connection con=null;
	ResultSet rs=null;
        PreparedStatement psm=null;
        String uname=session.getAttribute("username").toString();
        
                        con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline?useSSL=false","root","linuxconfig.org");
                        String Query = "select * from Passenger where username=?";
                        psm=con.prepareStatement(Query);
                        psm.setString(1,uname);
			rs=psm.executeQuery();
                        while(rs.next()){
                            String fname=rs.getString(1);
                            String lname=rs.getString(2);
                            String dob=rs.getString(3);
                            String phone=rs.getString(4);
                            String address=rs.getString(5);
                            String city=rs.getString(6);
                            String email=rs.getString(7);
                            String username=rs.getString(8);
                            String age=rs.getString(10);
                            String fullname=fname+" "+lname;
                            String addr=address+" ,"+city;
                        

    %>
    
    <div class="flip-container">
        <div class="flipper">
            <div class="front">
                <img src="avatar.png" />
                <p style="font-size: 28px"><%=username%></p>
                <div class="sub">
                    <p style="font-size:20px"><%=fullname%></p>
                    <p style="margin-top: 150px">View Full Details!!!</p>
                </div>
            </div>
            <div class="back"style="text-align:center;font-family:sans-serif;font-size:18px;font-weight:400;">
                <p id="titulo"><%=fullname%></p>
                <p><b>Date of Birth:</b><%=dob%></p>
                <p><b>Age:</b><%=age%></p>
                <p><b>Phone:</b><%=phone%></p>
                <p><b>E-mail:</b><%=email%></p>
                <p><b>Address:</b><%=addr%></p>
                <p style="margin-top: 40px;">We are Happy to see you here!!!</p>
                
            </div>
        </div>
    </div>
                <%
                }
                %>

</body>
</html>
        
        
