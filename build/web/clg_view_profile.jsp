<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<title>College Profile</title>
<body>
<div class="container">
<% String x=session.getAttribute("sess").toString(); %>
<b><center>Details of <%= x %></b>
<%@page import="java.sql.*" %>
<% 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select * from colleges where clg_name='"+x+"'";
ResultSet rs=st.executeQuery(s);
%>
<table class="table table-hover" width="100%">
<tr>
<th>College ID
<th>College Name
<th>Address1
<th>Address2
<th>City
<th>State
<th>Country
<th>Phone1
<th>Phone2
<th>Website
<th>E-mail
<th>Contact-Person
<th>Contact-No.
<th>Person-Email
<th>Status
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%= rs.getInt(1)%>
<td><%= rs.getString(2)%>
<td><%= rs.getString(5)%>
<td><%= rs.getString(6)%>
<td><%= rs.getString(7)%>
<td><%= rs.getString(8)%>
<td><%= rs.getString(9)%>
<td><%= rs.getString(10)%>
<td><%= rs.getString(11)%>
<td><%= rs.getString(12)%>
<td><%= rs.getString(13)%>
<td><%= rs.getString(14)%>
<td><%= rs.getString(15)%>
<td><%= rs.getString(16)%>
<td><%= rs.getString(17)%>
<%
}
}
catch(SQLException e)
{}
%> 
</tr>
</table>
<br>
<a href="college_panel.jsp">back</a>
</body>
</html>