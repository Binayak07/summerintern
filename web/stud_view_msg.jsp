<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<title>Student Message View</title>
<body>
<% String n=session.getAttribute("np").toString(); %>
<% int x=Integer.parseInt(session.getAttribute("sess").toString()); %>
<% int z=Integer.parseInt(request.getParameter("sgid").toString());%>
<% String content="",send="",subj="",dt="",t="";%>
<center><font color="#8A084B"><b><%= n %>,`s Inbox.</b><br><br>
<%@page import="java.sql.*" %>
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select to_char(dt),to_char(dt,'hh24:mi:ss'),sender,subject,msg from message where msg_id="+z+"";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
dt=rs.getString(1);
t=rs.getString(2);
send=rs.getString(3);
subj=rs.getString(4);
content=rs.getString(5);
}
Statement st2=con.createStatement();
String str="update message set status='R' where msg_id="+z+"";
st2.executeUpdate(str);
}
catch(SQLException e){}
%>
</center>
<div class="panel panel-primary">
<div class="panel-heading">
Sender: <%= send %></div>
<div class="panel-body">
<%=content%></div>
<div class="panel-footer">
Date: <%=dt%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
Time: <%=t%> 
</div>
</div>
<center>
<a href="stud_msg.jsp">back to inbox</a>
</body>
</html>



