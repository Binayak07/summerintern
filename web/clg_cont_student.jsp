<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<body>
<%@page import="java.sql.*" %>
<%
 String x=session.getAttribute("sess").toString();
 int id=0;
 String sn1="",sn2="",sn3="",fin;
 %>
<div class="container">
<form action="clg_cont_stud_resp.jsp" method="get">
<b><p>College to Student Contact Form </p><br>
 <font>Sender: <input type="text" name="via" value= "<%= x %>" readonly><br><br>
Receiver: <select name="rcv"> <font color="red">* Select</font>
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select fname,mname,lname from student where clg_id=(select clg_id from colleges where clg_name='"+x+"')";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
sn1=rs.getString(1);
sn2=rs.getString(2);
sn3=rs.getString(3);
fin=sn1+" "+sn2+" "+sn3;
%>
<option><%= fin %>
<%
}
}
catch(SQLException e){}
%>
</select><br><br>
Subject: <input type="text" name="sub"><font color="red">*</font><br><br>
Message:</font><br> <textarea name="msg" rows="5px" cols="40px"> </textarea><br><br>
</b>
<input type="submit" value="Send" class="btn btn-success"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="college_panel.jsp">Back</a>
</form>
</div>
</body>
</html>
