<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<% int x=Integer.parseInt(session.getAttribute("sess").toString()); %>
<% String ds=session.getAttribute("np").toString();%>
<body>
<div class="container">
<br><br><br>
<p><u><b>Hello <i> <%= ds %></i> ,Edit your profile here.</b></u></p>
<%@page import="java.sql.*" %>
<% 
String cln="";
int clid=0;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement p=con.createStatement();
String cx="select clg_name from colleges where clg_id=(select clg_id from student where studid="+x+")";
ResultSet rst=p.executeQuery(cx);
while(rst.next())
{
cln=rst.getString(1);
}
Statement st=con.createStatement();
String s="select * from student where studid="+x+"";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
%>
<form action="update_stud.jsp" method="get">
Student ID: 
<input type="text" name="stid" value="<%= rs.getInt(1)%>" readonly><br>
College Name:
<input type="text" name="sclg" value="<%= cln %>" readonly><br>
Registration No.:
<input type="text" name="srn" value="<%= rs.getString(2)%>" readonly><br>
Date Of Birth :
<input type="text" name="sdb" value="<%= rs.getString(7)%>">(dd/mm/yyyy)<br>
Address 1 :
<input type="text" name="sadd1" value="<%= rs.getString(8)%>"><br>
Address 2 :
<input type="text" name="sadd2" value="<%= rs.getString(9)%>"><br>
City :
<input type="text" name="sct" value="<%= rs.getString(10)%>"><br>
Phone :
<input type="text" name="sph" value="<%= rs.getString(11)%>"><br>
E-Mail :
<input type="text" name="sem" value="<%= rs.getString(12)%>"><br>
<%
clid=rs.getInt(3);
}
Statement xcd=con.createStatement();
String z="select status,session_ from student_details where studid="+x+"";
ResultSet tt=xcd.executeQuery(z);
while(tt.next())
{
%>
Status :
<input type="text" name="stds" value="<%= tt.getString(1)%>" readonly><br>
Session :
<input type="text" name="ss" value="<%=tt.getString(2)%>" readonly><br>
<%
}
}
catch(SQLException e){}
%>
<input type="submit" value="Update" class="btn btn-info">
 &nbsp;&nbsp;&nbsp;<a href="student_panel.jsp">back</a>
</form>
 </div>
</body>
</html>