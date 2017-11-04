<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
<body bgcolor="aqua"><center>
<p> <font size="4">Its free, but not always be</p></font></br>
<form action="clgsignup_resp.jsp" method="get">
Enter College Name: <input type="text" name="cn"><br>
<%@page import="java.sql.*" %>
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select clg_type_name from clg_type";
ResultSet rs=st.executeQuery(s);
%>
Select College type:
<select name="ct">
<%
while(rs.next())
{
%>
<option><%= rs.getString(1)%>
<%
}
%>
</select><br>
Select Location:
<select name="lc">
<%
Statement st1=con.createStatement();
String s2="select location from location";
ResultSet rs2=st1.executeQuery(s2);
while(rs2.next())
{
%>
<option><%= rs2.getString(1) %>
<% }
}
catch(SQLException e){} 
 %>
</select><br>
<input type="submit" value="Sign Up"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="reset">
</form>
</body>
</html>