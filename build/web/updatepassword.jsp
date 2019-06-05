<%-- 
    Document   : updatepassword
    Created on : 26 Nov, 2018, 12:54:12 AM
    Author     : bharath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<html><body><form>
<%
                
            String username=request.getParameter("username");
            String password=request.getParameter("password");
         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline?useSSL=false","root","linuxconfig.org");
            String Query="update Passenger set password=? where username=?";
            PreparedStatement psm=conn.prepareStatement(Query);
            psm.setString(2,username);
            psm.setString(1,password);
            psm.executeUpdate();
            response.sendRedirect("resetsuccessful.html");
                

            %>
                
</form>
    </body></html>