<%-- 
    Document   : aftersearchflights
    Created on : 27 Nov, 2018, 4:51:50 AM
    Author     : bharath
--%>

<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page language="java" %>
<HEAD>
    <title>Search results</title>
<link rel="SHORTCUT ICON" href="logo.ico">
</HEAD>
<BODY class='SC'style="background:url(vincent-versluis-240048-unsplash.jpg);background-attachment: fixed;background-size: cover;background-position: center">
<img src="logo" width="70" height="70" style="position:absolute">
    <h1 align=center style="color:#fff;font-family: sans-serif;font-size: 36px;margin-bottom: 30px;margin-top: 20px;">Flight Details</h1>
<table align=center>

<%

	Connection con=null;
	ResultSet rs=null;
        ResultSet rs1=null;
        ResultSet rs2=null;
        PreparedStatement psm=null;
        PreparedStatement psm1=null;
        PreparedStatement psm2=null;
        String from=request.getParameter("from");
        String to=request.getParameter("to");
        String radiobtn=request.getParameter("radiobtn");
        String departure=request.getParameter("departure");
        String arrival=(String)request.getParameter("arrival");
        
        
       
        
                 try{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline?useSSL=false","root","linuxconfig.org");
                        
                       
			String Query = "select * from Flight_Schedule where Fromcityname=? and Tocityname=? and FlightDate=?";
                        psm=con.prepareStatement(Query);
			System.out.println(Query);
                        
                        psm.setString(1,from);
                        psm.setString(2,to);
                        psm.setString(3,departure);
			rs=psm.executeQuery();
                        %>
			<table align="center" width="80%" class="tablerowcol" style="table-layout:auto;width:100%">
			<%
                        int flightcount=0;
 
			while(rs.next())
			{   
                            String flightdate=rs.getString(2);
                            String departuretime=rs.getString(3);
                            String fromcity=rs.getString(4);
                            String arrivaltime=rs.getString(5);
                            String tocity=rs.getString(6);
                            String aircraft_no=rs.getString(7);
                            String netfare=rs.getString(8);
                           
                            String query1="select AcNumber from Aircrafts where AcID=?";
                            psm1=con.prepareStatement(query1);
                            psm1.setString(1,aircraft_no);
                            rs1=psm1.executeQuery();
                            
                           while(rs1.next()){
                            String Aircraftno=rs1.getString(1);
                            
                            
                            String query2="select Fare from AirFare where AfID=?";
                            psm2=con.prepareStatement(query2);
                            psm2.setString(1,netfare);
                            rs2=psm2.executeQuery();
                            
                            while(rs2.next()){
                                
                           String netfareamt=rs2.getString(1);
                            %>
                        
                            <TR class= "row_even1">
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>AirCraft Number</B></td>
                        <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>Flight Date</B></td>
			<td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>Departure</B></td>
			<td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>Arrival</B></td>
                        <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>Netfare</B></td></tr>
                            <tr class= "row_even">
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=Aircraftno%></td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=flightdate%></td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=departuretime%>hrs</td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=arrivaltime%>hrs</td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px">Rs.<%=netfareamt%></td>
                            <td align="left" colspan=2><a href ="booknow0.jsp?Aircraftno=<%=Aircraftno%>&Flightdate=<%=flightdate%>&Departure=<%=departuretime%>&Arrival=<%=arrivaltime%>&Netfare=<%=netfareamt%>&FromCity=<%=from%>&ToCity=<%=to%>"><input type="button" value="BOOK" id="bookbtn" style="width: 100%;padding:5px;border:none;background-color: #000;color: #fff;"></a></td></tr>
			
                            
                            <TR class= "row_even1">
                                <td align="left" colspan=2></td>
                        <td align="left" colspan=2></td>
			<td align="left" colspan=2></td>
			<td align="left" colspan=2></td>
                        <td align="left" colspan=2></td></tr>
                            <tr class= "row_even">
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td></tr>
                            <TR class= "row_even1">
                                <td align="left" colspan=2></td>
                        <td align="left" colspan=2></td>
			<td align="left" colspan=2></td>
			<td align="left" colspan=2></td>
                        <td align="left" colspan=2></td></tr>
                            <tr class= "row_even">
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td></tr>
                            <tr><a style="border-bottom: 2px solid black"></a></tr>
			

		<%
				flightcount++;
			}
			}
}
			if( flightcount == 0)	{%><P align=center><h1 align=center>No Flights found!!!Try again Later!</h1><% }
			rs.close();
                        rs1.close();
			psm.close();
                        psm1.close();
			con.close();
		
        
}
                       catch(Exception e){
			rs.close();
			psm.close();
			con.close();
			%><%=e%><%
		}
		
	
%>	

	
                            
</table>
</BODY>