<%-- 
    Document   : login
    Created on : 24 Nov, 2018, 5:21:12 PM
    Author     : bharath
--%>
<html>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<body>


<!DOCTYPE html>
<%
    
    String username=request.getParameter("username");
    String password=request.getParameter("password");
    Class.forName("com.mysql.jdbc.Driver").newInstance();
                        Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline?useSSL=false","root","linuxconfig.org");
                            String Query="select username,password from Passenger where username=? and password=?";
                            PreparedStatement psm=conn.prepareStatement(Query);
                            psm.setString(1,username);
                            psm.setString(2,password);
                            ResultSet rs=psm.executeQuery();
                            
                            if(rs.next()){
                                request.getSession().setAttribute("username",username);
                                response.sendRedirect("Homepage.html");
                            }
                            else{
                                response.sendRedirect("login.html");
                            }
                            
    %>

 
 
</body>
</html>