<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<body>
    
<%@page import="java.sql.*" %>
<% int x=Integer.parseInt(session.getAttribute("sess").toString());
String f="";
try
{

Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select password from student_details where studid="+x+"";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
f=rs.getString(1);
}
String cp=request.getParameter("cp");
String np1=request.getParameter("np1");
String np2=request.getParameter("np2");
if(cp==null||np1==null||np2==null)
{
response.sendRedirect("stud_change_pass.jsp");
}
else
{
if(!np1.equals(np2) || !cp.equals(f))
{
response.sendRedirect("serror.html");
}
else
{
Statement st2=con.createStatement();
String s2="update student_details set password='"+np2+"' where studid="+x+"";
st2.executeUpdate(s2);
response.sendRedirect("stud_pass_msg.jsp");
}
}
}
catch(SQLException e){
response.sendRedirect("stud_change_pass.jsp");
}
%>
</body>
</html>