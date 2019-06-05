<%-- 
    Document   : bookedflights
    Created on : 28 Nov, 2018, 8:01:17 AM
    Author     : bharath
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<!DOCTYPE html>
<%@ page language="java" %>
<HEAD>
    <link rel="SHORTCUT ICON" href="logo.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
    <title>Your bookings</TITLE>
    <STYLE>
    ul {
    list-style-type: none;
    margin: 0;
    padding: 0;
    overflow: hidden;
    background-color: #141212;
    position: -webkit-sticky;
    position: sticky;
    top: 0;
    margin-bottom: 40px;
}

#logoutsm,#profile{
    float: right;
}
li a{
    float:left;
}

#profile{
    display:block;
    color: white;
    padding:16px 16px;
}


li a {
    display: block;
    color: white;
    font-size: 15px;
    top:10px;
    font-family:"Comic Sans MS", cursive, sans-serif;
    text-align: center;
    padding: 18px 16px;
    text-decoration: none;
}
li a:hover{
    color:#fff!important;background-color:#f44336!important
}
li c:hover{
   color:#fff!important;background-color:#f44336!important 
}
    </style>

</HEAD>
<BODY class='SC'style="background:url(vincent-versluis-240048-unsplash.jpg);background-attachment: fixed;background-size: cover;background-position: center">
<img src="logo" width="70" height="70" style="position:absolute">

    <h1 align=center style="color:#fff;font-family: sans-serif;font-size: 36px;margin-bottom: 40px;margin-top: 20px;">Booked Flights</h1>
    <ul class="navbar">
  <li><a id="home" class="active" href="Homepage.html">Home</a></li>
  <li><a id="bflights" href="bookedflights.jsp">Booked Flights</a></li>
  
  <li><a id="profile" class="material-icons" href="profile.jsp">person</a></li>
  <li><a id="logoutsm" href="login.html" onclick="session.inValidate()">Logout</a></li>
</ul>
<table align=center>

<%

	Connection con=null;
	ResultSet rs=null;
        ResultSet rs1=null;
        ResultSet rs2=null;
        PreparedStatement psm=null;
        PreparedStatement psm1=null;
        PreparedStatement psm2=null;
        String uname=session.getAttribute("username").toString();
        
       
        
                 try{
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline?useSSL=false","root","linuxconfig.org");
                        
                       
			String Query = "select * from Transactions where Passenger=?";
                        psm=con.prepareStatement(Query);
			psm.setString(1, uname);
                        
			rs=psm.executeQuery();
                        %>
			<table align="center" width="100%" class="tablerowcol" style="table-layout:auto;width:100%;margin-left: 30px">
			<%
                        int flightcount=0;
 
			while(rs.next())
			{   
                            String bookingdate=rs.getString(2);
                            String flightscheduleid=rs.getString(4);
                           
                            String query1="select * from Flight_Schedule where FlID=?";
                            psm1=con.prepareStatement(query1);
                            psm1.setString(1,flightscheduleid);
                            rs1=psm1.executeQuery();
                            
                           while(rs1.next()){
                            String flightdate=rs1.getString(2);
                            String departure=rs1.getString(3);
                            String from=rs1.getString(4);
                            String arrival=rs1.getString(5);
                            String to=rs1.getString(6);
                            String ac_id=rs1.getString(7);
                            
                            String query2="select * from Aircrafts where AcID=?";
                            psm2=con.prepareStatement(query2);
                            psm2.setString(1,ac_id);
                            rs2=psm2.executeQuery();
                            
                            while(rs2.next()){
                                
                            String aircraftno=rs2.getString(2);
                           
                            %>
                        
                            <TR class= "row_even1">
                        <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>Flight Date</B></td>
                        <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>AirCraft Number</B></td>
                        <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>From</B></td>
			<td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>Departure</B></td>
                        <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>To</B></td>
			<td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>Arrival</B></td>
                        <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 18px"><B>Booking Date</B></td></tr>
                            <tr class= "row_even">
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=flightdate%></td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=aircraftno%></td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=from%></td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=departure%> hrs</td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=to%></td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=arrival%> hrs</td>
                                <td align="left" colspan=2 style="color: #fff;font-family: sans-serif;font-size: 15px"><%=bookingdate%></td></tr>
			
                            
                            <TR class= "row_even1">
                        <td align="left" colspan=2></td>
                        <td align="left" colspan=2></td>
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
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td></tr>
                            <TR class= "row_even1">
                        <td align="left" colspan=2></td>
                        <td align="left" colspan=2></td>
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
                                <td align="left" colspan=2></td>
                                <td align="left" colspan=2></td></tr>
			

		<%
				flightcount++;
			
			
}}}
if( flightcount == 0)	{%><P align=center><h1 align=center style="color:#fff">No Bookings Found.Try Booking one!</h1><% }
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
                       
		}
		
	
%>
                        </TABLE>
</body>
</html>