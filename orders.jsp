<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>My Orders</title>
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
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/minorproject","root","");
            Statement stmt=con.createStatement();
            String uname=session.getAttribute("uname").toString();
            ResultSet rs=stmt.executeQuery("select * from orders where uname='"+uname+"';");
            %>
            <table cellspacing="20" align="center">
                <tr>
                    <th><h1>Restaurant Name</h1></th><th><h1>Amount</h1></th>
                </tr>
                <%
            while(rs.next())
            {
            %>
            <tr>
                <td><h3><%=rs.getString(2)%></h3></td><td><h3><%=rs.getInt(3)%></h3></td>
            </tr>
            <%}%>
            </table>
            <a href="payment.html"><input type="button" class=button value="CHECK OUT FOR PAYMENT"></a>
           
    </body>
</html>
