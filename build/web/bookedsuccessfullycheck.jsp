<%-- 
    Document   : bookedsuccessfullycheck
    Created on : 6 Dec, 2018, 9:19:43 AM
    Author     : bharath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<title>Booking successfully</title>
<%
    String uname=session.getAttribute("username").toString();
    String flightscheduleid=request.getParameter("flightid");
    
    
            out.println(flightscheduleid);
    Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline","root","linuxconfig.org");
                out.println("<h1>Connection established</h1>");
                String query="insert into Transactions(Passenger,Schedule) values(?,?)";
                PreparedStatement psm=con.prepareStatement(query);
                psm.setString(1,uname);
                psm.setString(2,flightscheduleid);
                int i=psm.executeUpdate();
                
                if(i>0){
                out.println("Successfully Registered!!!");
                response.sendRedirect("bookedsuccessfully.jsp");
                }
                
                


%>