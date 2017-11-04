<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<title>Student Profile</title>
<body>
<div class="container">
<% String x=session.getAttribute("np").toString(); %>
<% int id=Integer.parseInt(session.getAttribute("sess").toString());%>
<% String cn=""; %>
<b><center>Details of <%= x %></b>
<%@page import="java.sql.*" %>
<% 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement stt=con.createStatement();
String s2="select clg_name from colleges where clg_id=(select clg_id from student where studid="+id+")";
ResultSet rs2=stt.executeQuery(s2);
while(rs2.next())
{
cn=rs2.getString(1);
}
Statement st=con.createStatement();
String s="select * from student where studid="+id+"";
ResultSet rs=st.executeQuery(s);
%>
<table class="table table-hover" width="100%">
<tr>
<th>Student ID
<th>Student Name
<th>Registration No.
<th>College Name
<th>DOB
<th>Address1
<th>Address2
<th>City
<th>Phone
<th>E-mail
<th>Session
<th>Status
</tr>
<%
while(rs.next())
{
%>
<tr>
<td><%= rs.getInt(1)%>
<td><%= x %>
<td><%= rs.getString(2)%>
<td><%= cn %>
<td><%= rs.getString(7)%>
<td><%= rs.getString(8)%>
<td><%= rs.getString(9)%>
<td><%= rs.getString(10)%>
<td><%= rs.getString(11)%>
<td><%= rs.getString(12)%>
<%
}
Statement stf=con.createStatement();
String ccc="select session_,status from student_details where studid="+id+"";
ResultSet cc2=stf.executeQuery(ccc);
while(cc2.next())
{%>
<td><%= cc2.getString(1)%>
<td><%= cc2.getString(2)%>
<%
}
%> 
</tr>
</table>
<p> <b><u>Skills are:</u>&nbsp;&nbsp;
<%
Statement asd=con.createStatement();
String tp="select skill from stud_skills where studid="+id+"";
ResultSet rsx=asd.executeQuery(tp);
while(rsx.next())
{
%>
<%=rsx.getString(1)%>&nbsp;&nbsp;
<%
}
}
catch(SQLException e)
{
response.sendRedirect("serror.html");
}
%>
</b>
<br><br>
<p><font color="red">You are requested to update your credentials, to get verified by your college placement cell/ administration.<br>N - Not Verified , V - Verified</p>
<a href="student_panel.jsp">Back</a>
</body>
</html>