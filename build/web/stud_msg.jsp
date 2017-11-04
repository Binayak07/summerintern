<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<title>Student Messages</title>
<body>
<% String n=session.getAttribute("np").toString(); %>
<% int x=Integer.parseInt(session.getAttribute("sess").toString()); %>
<% int c=0; %>
<center>
<div class="panel panel-warning">
<div class="panel-heading">
<b><%= n %>,`s Inbox.</b></div></div></font><br><br>
<%@page import="java.sql.*" %>
<table class="table table-hover" width="100%">
<tr>
<th>
<th>Message ID
<th>Date
<th>Time
<th>Sender
<th>Subject
</tr>
<%
try
{
int snd=0;
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select msg_id,to_char(dt),to_char(dt,'hh24:mi:ss'),sender,subject from message where receiver="+x+" order by dt desc";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
c=rs.getInt(1);
%>
<tr>
<td><span class="glyphicon glyphicon-envelope"></span>
<td><%= c %>
<td><%= rs.getString(2)%>
<td><%= rs.getString(3)%>
<%
 snd=rs.getInt(4);
 Statement ff=con.createStatement();
 String pp="select clg_name from colleges where clg_id="+snd+"";
 ResultSet z=ff.executeQuery(pp);
 while(z.next())
 {
 %>
 <td><%= z.getString(1)%>
<%
 }
 %>
<td><a href="stud_view_msg.jsp?sgid=<%= c %>"> <%= rs.getString(5)%></a>
<%
}
%>
</tr>
</table>
<%
}
catch(SQLException e){}
%>
<a href="student_panel.jsp">back</a>
</body>
</html>

