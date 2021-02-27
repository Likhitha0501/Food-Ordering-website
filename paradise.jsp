<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Paradise</title>
        <link rel="stylesheet" type="text/css" href="navbar.css">
    </head>
    <body>
        <header>
<div class="topnav">
<nav>
<b>
<a href="index.html">Home</a>
<a href="likki.html">Restaurants</a>
<a href="orders.jsp">My Orders</a>
<a href="logout.jsp">Logout</a>
</b>
</nav>
</div>
        <%
            int rate=0;
            String bc=request.getParameter("panner");
            if(bc!=null){
            if(bc.compareTo("on")==0){
            int bcq=Integer.parseInt(request.getParameter("pannerq"));
            rate=rate+180*bcq;
            }}
            String c=request.getParameter("chickendum");
            if(c!=null){
            if(c.compareTo("on")==0){
            int cq=Integer.parseInt(request.getParameter("chickendumq"));
            rate=rate+240*cq;
            }}
            String dc=request.getParameter("mugali");
            if(dc!=null){
            if(dc.compareTo("on")==0){
            int dcq=Integer.parseInt(request.getParameter("mugaliq"));
            rate=rate+360*dcq;
            }}
            String s=request.getParameter("prawns");
            if(s!=null){
            if(s.compareTo("on")==0){
            int sq=Integer.parseInt(request.getParameter("prawnsq"));
            rate=rate+150*sq;
            }}
            if(rate==0)
                response.sendRedirect("A.html");
            else
            {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minorproject","root","");
            PreparedStatement stmt=con.prepareStatement("insert into orders values(?,?,?);");
            
            String uname=session.getAttribute("uname").toString();
            stmt.setString(1,uname);
            stmt.setString(2,"Paradise");
            stmt.setInt(3,rate);
            stmt.executeUpdate();
            con.close();
            }
            %>
            <center><h1>Order has been accepted</h1></center>
        </header>
    </body>
</html>
