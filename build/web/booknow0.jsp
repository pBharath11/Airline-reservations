<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<html>
<head>
    <title>
    Payment
    </title>
    <link rel="SHORTCUT ICON" href="logo.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>
        function validate()
  {   
    if(document.getElementById("cname").value =="")
     {
	alert("One or more Fields are empty!!!");
        document.getElementById("cname").focus();
	return false;
     }
    
    if(document.getElementById("ccnum").value =="")
     {
	alert("One or more Fields are empty!!!");
        document.getElementById("ccnum").focus();
	return false;
     }
     if(document.getElementById("expmonth").value =="")
     {
	alert("One or more Fields are empty!!!");
        document.getElementById("expmonth").focus();
	return false;
     
  }
  if(document.getElementById("expyear").value =="")
     {
	alert("One or more Fields are empty!!!");
        document.getElementById("expyear").focus();
	return false;
    }
    if(document.getElementById("cvv").value =="")
     {
	alert("One or more Fields are empty!!!");
        document.getElementById("cvv").focus();
	return false;
    }
}
  
 
    </script>
    
    <style>


.container {
  background-color: #141212;
  padding: 15px 20px 15px 20px;
  width: 900px;
  margin-top:40px;
  margin-left:190px;
  border-radius: 25px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: none;
    background: #141212;
    border-bottom: 2px solid #fff;
}

label {
  margin-bottom: 10px;
  display: block;
    color: #fff;
    font-family: sans-serif;
    font-style: normal;
    font-size: 16px;
        }

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (and change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}

    </style>
</head><body style="background: url(vincent-versluis-240048-unsplash.jpg);
    background-size:cover;
    background-position: center;
    background-attachment: fixed;
    background-repeat: no-repeat;
    font-family: sans-serif;">
	         
    <div class="container">
      <form method="post">

        
		
            <h2 align=center style="font-family: sans-serif;font-size: 24px;color: #fff; margin-bottom: 50px" >Payment</h2>
            
            <p style="color:#fff;font-family: sans-serif;font-size:16px">Aircraft_Number:<%=request.getParameter("Aircraftno")%></p>
            <p style="color:#fff;font-family: sans-serif;font-size:16px"> FlightDate:<%=request.getParameter("Flightdate")%></p>
            <p style="color:#fff;font-family: sans-serif;font-size:16px">From:<%=request.getParameter("FromCity")%></p>
            <p style="color:#fff;font-family: sans-serif;font-size:16px">Departure:<%=request.getParameter("Departure")%></p>
            <p style="color:#fff;font-family: sans-serif;font-size:16px">To:<%=request.getParameter("ToCity")%></p>
            <p style="color:#fff;font-family: sans-serif;font-size:16px">Arrival:<%=request.getParameter("Arrival")%></p>
            <p style="color:#fff;font-family: sans-serif;font-size:16px">Duration:<%="1:40:00hrs"%></p>
            <p style="color:#fff;font-family: sans-serif;font-size:16px">Netfare:Rs.<%=request.getParameter("Netfare")%></p>
            
            
            
            <br>
            <br>
            <label for="fname">Accepted Cards</label>
            <div class="icon-container">
              <i class="fa fa-cc-visa" style="color:navy;"></i>
              <i class="fa fa-cc-amex" style="color:blue;"></i>
              <i class="fa fa-cc-mastercard" style="color:red;"></i>
              <i class="fa fa-cc-discover" style="color:orange;"></i>
            </div>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="Enter name" pattern="[a-zA-Z]" required>
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444" pattern="[0-9]{13,16}" required>
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="months" pattern="[0-9]{2}" required>

           
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="year of expire" pattern="[0-9]{4}" required>
             
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="3 digit CVV code" pattern="[0-9]{3}" required>
                <%
                    try{
                    String aircraft_no=request.getParameter("Aircraftno");
                    String fdate=request.getParameter("Flightdate");
                    String fromcity=request.getParameter("FromCity");
                    String departure=request.getParameter("Departure");
                    String tocity=request.getParameter("ToCity");
                  String arrival= request.getParameter("Arrival");
                   String netfare=request.getParameter("Netfare");
                   
                   
                  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/airline?useSSL=false","root","linuxconfig.org");
                  String query="select FlID from Flight_Schedule where FlightDate=? and Departure=? and Fromcityname=? and Arrival=? and Tocityname=? and aircraft_number=(select AcID from Aircrafts where AcNumber=?)";
                  PreparedStatement psm=con.prepareStatement(query);
                            psm.setString(1,fdate);
                            psm.setString(2,departure);
                            psm.setString(3,fromcity);
                            psm.setString(4,arrival);
                            psm.setString(5,tocity);
                            psm.setString(6,aircraft_no);
                            ResultSet rs=psm.executeQuery();
                            
                            while(rs.next()){
                                
                           String Flightid=rs.getString(1);
                            
                %>
                
                <a href="bookedsuccessfullycheck.jsp?flightid=<%=Flightid%>"><input type="button" value="Continue to checkout" onclick="return(validate());" class="btn"></a>
             <%  }
}
                    catch(Exception e){
                        System.out.println("<h1>"+e+"</h1>");
                    }%>
      </form>
    </div>
    </body>
</html>