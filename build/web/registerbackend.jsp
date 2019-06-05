<%-- 
    Document   : registerbackend
    Created on : 24 Nov, 2018, 10:39:51 PM
    Author     : bharath
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>
    </head>
    
        <%@ page import="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
        <% 
            String firstname=request.getParameter("fname");
            String lastname=request.getParameter("lname");
            String phone=request.getParameter("phoneno");
            String address=request.getParameter("address");
            String CityName=request.getParameter("CityName");
            String email=request.getParameter("Email");
            String username=request.getParameter("username");
            String password=request.getParameter("password");
            String dob=request.getParameter("dob");
            
            
            String substr=dob.substring(0,4);
            int age1=Integer.parseInt(substr);
            int age=2018-age1;
            
            
            
            out.println(firstname);
            out.println(lastname);
            out.println(phone);
            out.println(address);
            out.println(email);
            out.println(username);
            out.println(password);
            out.println(dob);
            out.println(CityName);
            out.println(substr);
            out.println(age1);
            out.println(age);
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection conn1=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","linuxconfig.org");
                out.println("<h1>Connection established</h1>");
                CallableStatement calstat=conn1.prepareCall("{call register(?,?,?,?,?,?,?,?,?,?)}");
                
                calstat.setString(1,firstname);
                calstat.setString(2,lastname);
                calstat.setString(3,dob);
                calstat.setString(4,phone);
                calstat.setString(5,address);
                calstat.setString(6,CityName);
                calstat.setString(7,email);
                calstat.setString(8,username);
                calstat.setString(9,password);
                calstat.setInt(10,age);
                
                ResultSet rs=calstat.executeQuery();
                calstat.close();
                conn1.close();
                out.println("Successfully Registered!!!");
                
                response.sendRedirect("login.html");
               
                      
       %>
                
    </body>
</html>