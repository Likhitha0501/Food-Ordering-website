<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Ice Berg</title>
        <link rel="stylesheet" type="text/css" href="navbar.css">
    </head>
    <body>
        <header>
<div class="topnav">
<nav>
<b>
<a href="home.html">Home</a>
<a href="likki.html">Restaurants</a>
<a href="orders.jsp">My Orders</a>
<a href="logout.jsp">Logout</a>
</b>
</nav>
</div>
        <%
            int rate=0;
            String bc=request.getParameter("blackcurrent");
            if(bc!=null){
            if(bc.compareTo("on")==0){
            int bcq=Integer.parseInt(request.getParameter("blackcurrentq"));
            rate=rate+170*bcq;
            }}
            String c=request.getParameter("chocolate");
            if(c!=null){
            if(c.compareTo("on")==0){
            int cq=Integer.parseInt(request.getParameter("chocolateq"));
            rate=rate+180*cq;
            }}
            String dc=request.getParameter("darkchocolate");
            if(dc!=null){
            if(dc.compareTo("on")==0){
            int dcq=Integer.parseInt(request.getParameter("darkchocolateq"));
            rate=rate+150*dcq;
            }}
            String s=request.getParameter("spider");
            if(s!=null){
            if(s.compareTo("on")==0){
            int sq=Integer.parseInt(request.getParameter("spiderq"));
            rate=rate+170*sq;
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
            stmt.setString(2,"IceBerg");
            stmt.setInt(3,rate);
            stmt.executeUpdate();
            con.close();
            }
            %>
            <center><h1>Order has been accepted</h1></center>
        </header>
    </body>
</html>
