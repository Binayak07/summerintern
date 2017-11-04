<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<title>Student Panel</title>
<body>
<% String n=session.getAttribute("np").toString(); %>
<% int x=Integer.parseInt(session.getAttribute("sess").toString()); %>
<% int c=0; %>
<center><font color="#8A084B"><b>Welcome <%= n %></b><br><br>
<%@page import="java.sql.*" %>
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select count(*) from message where status='N' and receiver="+x+"";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
c=rs.getInt(1);
}
}
catch(SQLException e){}
%>
<div class="container">
<form action="clg_end_sess.jsp" method="get">
<a href="stud_view_profile.jsp">View Your Profile</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="edit_stud_profile.jsp">Edit Your Profile</a> &nbsp;&nbsp;|&nbsp;&nbsp;<a href="stud_msg.jsp">Messages <span class="badge"><%=c%></span></a><br>&nbsp;&nbsp;&nbsp;&nbsp; <a href="stud_change_pass.jsp">Change Your Password</a><br><br>
<input type="submit" class="btn btn-info" value="logout">
</form>
</div>
</body>
</html>