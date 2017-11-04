<html>
<body>
<%@page import="java.sql.*" %>
<%@page import="javax.servlet.RequestDispatcher" %>
<% 
int data = Integer.parseInt(request.getParameter("id"));
String pass = request.getParameter("cpass");
String tab=request.getParameter("vfy");
int res=0;
String ds="";
if(tab.equals("colleges"))
{
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select count(*) from college_auth where clg_id="+data+"and password='"+pass+"'";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
res=rs.getInt(1);
}
Statement st1=con.createStatement();
String ex="select clg_name from colleges where clg_id="+data+"";
ResultSet rs1=st1.executeQuery(ex);
while(rs1.next())
{
ds=rs1.getString(1);
}
if(res!=0)
{
session.setAttribute("sess",ds);
response.sendRedirect("college_panel.jsp");
}
else
{
response.sendRedirect("clg_login.jsp?status=1");
}
}
catch(SQLException e)
{
response.sendRedirect("error.html");
}
}
if(tab.equals("student"))
{
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select count(*) from student_details where studid="+data+"and password='"+pass+"'";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
res=rs.getInt(1);
}
Statement st1=con.createStatement();
String ex="select fname,mname,lname from student where studid="+data+"";
ResultSet rs1=st1.executeQuery(ex);
while(rs1.next())
{
ds=rs1.getString(1)+" "+rs1.getString(2)+" "+rs1.getString(3);
}
if(res!=0)
{
session.setAttribute("sess",data);
session.setAttribute("np",ds);
response.sendRedirect("student_panel.jsp");
}
else
{
response.sendRedirect("clg_login.jsp?status=1");
}
}
catch(SQLException e)
{
response.sendRedirect("error.html");
}
}
if(tab.equals("tab_details"))
{
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select count(*) from tab_details where indus_id="+data+"and password='"+pass+"'";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
res=rs.getInt(1);
}
Statement st1=con.createStatement();
String ex="select indus_name from industry where indus_id="+data+"";
ResultSet rs1=st1.executeQuery(ex);
while(rs1.next())
{
ds=rs1.getString(1);
}
if(res!=0)
{
session.setAttribute("sess",data);
session.setAttribute("np",ds);
response.sendRedirect("industry_panel.jsp");
}
else
{
response.sendRedirect("clg_login.jsp?status=1");
}
}
catch(SQLException e)
{
response.sendRedirect("error.html");
}
}
%>
</body>
</html>