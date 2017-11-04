<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<% String x=session.getAttribute("sess").toString(); %>
<body>
<div class="container">
<br><br><br>
<p><u><b>Hello <i><%= x %></i> ,Edit your profile here.</b></u></p>
<%@page import="java.sql.*" %>
<% 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select * from colleges where clg_name='"+x+"'";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
%>
<form action="update_clg.jsp" method="get">
College ID: 
<input type="text" name="clgid" value="<%= rs.getInt(1)%>" readonly><br>
College Name:
<input type="text" name="clgn" value="<%= rs.getString(2)%>"><br>
Address 1
<input type="text" name="cadd1" value="<%= rs.getString(5)%>"><br>
Address 2
<input type="text" name="cadd2" value="<%= rs.getString(6)%>"><br>
City
<input type="text" name="ct" value="<%= rs.getString(7)%>"><br>
State
<input type="text" name="cst" value="<%= rs.getString(8)%>"><br>
Country
<input type="text" name="ccount" value="<%= rs.getString(9)%>"><br>
Phone 1
<input type="text" name="clgph1" value="<%= rs.getString(10)%>"><br>
Phone 2
<input type="text" name="clgph2" value="<%= rs.getString(11)%>"><br>
Website
<input type="text" name="clgweb" value="<%= rs.getString(12)%>"><br>
E-Mail
<input type="text" name="clgem" value="<%= rs.getString(13)%>"><br>
Cont. Person
<input type="text" name="clgcp" value="<%= rs.getString(14)%>"><br>
Cont. No.
<input type="text" name="clgcno" value="<%= rs.getString(15)%>"><br>
Person Email
<input type="text" name="clgpem" value="<%= rs.getString(16)%>"><br>
Status
<input type="text" name="clgs" value="<%= rs.getString(17)%>"><br>
<%}
}
catch(SQLException e){}

%>
<input type="submit" value="Update">
 &nbsp;&nbsp;&nbsp;<a href="college_panel.jsp">back</a>
</form>
 </div>
</body>
</html>