<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<body>
<div class="container">
<% String x=session.getAttribute("sess").toString(); %>
<b><center>List of students under <%= x %></b>
<%@page import="java.sql.*" %>
<%
int ssid=0,id=0,ic=0; 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement asd=con.createStatement();
String os="select clg_id from colleges where clg_name='"+x+"'";
ResultSet asdr=asd.executeQuery(os);
while(asdr.next())
{
id=asdr.getInt(1);
}
Statement st=con.createStatement();
String s="select studid,registration_no,fname,mname,lname,phone,email from student where clg_id="+id+"";
ResultSet rs=st.executeQuery(s);
%>
<table class="table table-hover" width="100%">
<tr>
<th>Student ID
<th>Registration No
<th>First Name
<th>Middle Name
<th>Last Name
<th>Phone
<th>E-mail
<th>Session
<th>Status
</tr>
<%
while(rs.next())
{
ssid=rs.getInt(1);
%>
<tr>
<td><%= ssid%>

<td><%= rs.getString(2)%>
<td><%= rs.getString(3)%>
<td><%= rs.getString(4)%>
<td><%= rs.getString(5)%>
<td><%= rs.getString(6)%>
<td><%= rs.getString(7)%>
<%
Statement ss=con.createStatement();
ResultSet ss1=ss.executeQuery("select session_,status from student_details where studid="+ssid+"");
while(ss1.next())
{
%>
<td><%= ss1.getString(1)%>
<td><%= ss1.getString(2)%>
<%
}
}
%>
</tr>
</table>
<%
}
catch(SQLException e)
{
response.sendRedirect("error.html");
}
%> 
</tr>
</table>
<p><font color="red">Null Fields are not filled up by the respective student yet<br>N - Not Verified , V - Verified</p>
<br><a href="college_panel.jsp">back</a>
</body>
</html>



