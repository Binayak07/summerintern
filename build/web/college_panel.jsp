<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<title>College Panel</title>
<body>
<% String x=session.getAttribute("sess").toString(); %>
<center><b>Welcome <%= x %></b><br>
<%@page import="java.sql.*" %>
<% 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select clg_type_name from clg_type where clg_type_id=(select clg_type_id from colleges where clg_name='"+x+"')";
ResultSet rs=st.executeQuery(s);
%>
<% while(rs.next()) {%>
<b>A/An <%= rs.getString(1)%> type college.</b>
<%}
}
catch(SQLException e){}
%>
<%
try{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select location from location where loc_id=(select loc_id from colleges where clg_name='"+x+"')";
ResultSet rs=st.executeQuery(s);
%>
<% while(rs.next()) {%>
<b>Located at <%= rs.getString(1)%></b><br><br>
<%}
}
catch(SQLException e){}
%>
<div class="container">
<form action="clg_end_sess.jsp" method="get">
<a href="add_clg_student.jsp">Add Student</a> &nbsp;&nbsp;|&nbsp;&nbsp;<a href="this_college_stud.jsp"> View Students</a> &nbsp;&nbsp;|&nbsp;&nbsp;<a href="clg_view_profile.jsp">View Your Profile</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="edit_clg_proflie.jsp">Edit Your Profile</a> &nbsp;&nbsp;|&nbsp;&nbsp; <a href="clg_cont_student.jsp">Message A Student</a> &nbsp;&nbsp;|&nbsp;&nbsp;<a href="#">View Received Messages</a>&nbsp;&nbsp;|<br>&nbsp;&nbsp; <a href="clg_change_pass.jsp">Change Your Password</a><br><br>
<input type="submit" value="logout" class="btn btn-danger">
</form>
</div>
</body>
</html>