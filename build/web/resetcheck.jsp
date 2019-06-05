<%-- 
    Document   : resetcheck
    Created on : 25 Nov, 2018, 11:24:30 PM
    Author     : bharath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="javax.sql.*"%>
<%@page import="java.sql.*"%>
<html><body><form>
<!DOCTYPE html>
<%
                
            String username=request.getParameter("username");
            String email=request.getParameter("email");
            String dob=request.getParameter("dob");
            String phone=request.getParameter("phone");
         
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline?useSSL=false","root","linuxconfig.org");
            String Query="select * from Passenger where username=? and email=? and dob=? and phone=? ";
            PreparedStatement psm=conn.prepareStatement(Query);
            psm.setString(1,username);
            psm.setString(2,email);
            psm.setString(3,dob);
            psm.setString(4,phone);
%>
            
 <%           ResultSet rs=psm.executeQuery();
            if(rs.next()){
                response.sendRedirect("resetpassword1.jsp");
                
            }
                        else{
                
            response.sendRedirect("resetpassword.jsp");
            }

            %>
                
</form>
    </body></html>