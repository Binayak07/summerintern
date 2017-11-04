<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<% int x=Integer.parseInt(session.getAttribute("sess").toString()); %>
<% String fn=session.getAttribute("np").toString();%>
<body>
<div class="container">
<br><br><br>
<%
int stid=Integer.parseInt(request.getParameter("stid"));
String sadd1 = request.getParameter("sadd1");
String sadd2 = request.getParameter("sadd2");
String sct = request.getParameter("sct");
String sph = request.getParameter("sph");
String sem = request.getParameter("sem");
String sdb = request.getParameter("sdb");
%>
<%@page import="java.sql.*" %>
<% 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="update student set add1='"+sadd1+"',add2='"+sadd2+"',city='"+sct+"',phone='"+sph+"',dob=(to_date('"+sdb+"','dd/mm/yyyy')),email='"+sem+"' where studid="+x+""; 
st.executeUpdate(s);
%>
<p><b><%= fn %></b> <i>Your profile is Successfully Updated</i></p>
<br>
<b><a href="student_panel.jsp">back</a>
<%
}
catch(SQLException e)
{
response.sendRedirect("serror.html");
}
%>
</div>
</body>
</html>