<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<% String x=session.getAttribute("sess").toString(); %>
<body>
<div class="container">
<form action="clg_add_student_response.jsp" method="get">
<%@page import="java.sql.*" %>
<% 
int fill=0;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select clg_id from colleges where clg_name='"+x+"'";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
fill=rs.getInt(1);
}
}
catch(SQLException e){}
%>
<p>Hello <b><%= x%></b>, <i>Add Student`s Course ID Here</i></p>
Your College ID : 
<input type="text" name="scid" value="<%= fill%>" readonly><br>
Registration No: 
<input type="text" name="rrr" placeholder="Enter Registration No."><font color="red">*</font><br>
First Name: 
<input type="text" name="sfn" ><font color="red">*</font><br>
Middle Name:
<input type="text" name="sbn"><font color="red">*</font><br>
Last Name:
<input type="text" name="sln"><font color="red">*</font><br>
Select Course :
<select name="crse_n">
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select course_name from course";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
%>
<option><%= rs.getString(1)%>
<%
}
}
catch(SQLException e){}
%>
</select><br>
<input type="submit" value="Add Student">&nbsp;&nbsp;&nbsp;
<input type="reset"><br><br>
<p> <font color="red">* Mandatory Field</p>
</form>
<a href="college_panel.jsp">back</a>
</div>
</body>
</html>