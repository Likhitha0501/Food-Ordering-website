<%--
    Document   : payment
    Created on : 11 Dec, 2020, 11:16:53 AM
    Author     : ADMIN
--%>

<%--
    Document   : bikes
    Created on : 1 Dec, 2020, 10:30:37 PM
    Author     : ADMIN
--%>

<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="nav.css">
    </head>
    <body>
       
       
<%
   
    String amount="", cardname="",cardnumber="",expirydate="",pincode="";
   
            amount=request.getParameter("text1");
            cardname=request.getParameter("text2");
            cardnumber=request.getParameter("text3");
            expirydate=request.getParameter("text4");
            pincode=request.getParameter("text5");
             try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost/minorproject","root","");
         
            PreparedStatement st=con.prepareStatement("insert into payment values(?,?,?,?,?)");
           
           
           
         
            st.setString(1,amount);
           st.setString(2,cardname);
           st.setString(3,cardnumber);
           st.setString(4,pincode);
     
           st.setString(5,expirydate);
           
           int i=st.executeUpdate();
           
           con.close();}
            catch(Exception e)

            {
                out.print(e.getMessage());
            }
           
           response.sendRedirect("booked.html");
                 
         
    %>
    </body>
</html>

   



           
           
           
           

