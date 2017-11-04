<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<body>

<%@page import="java.sql.*" %>
<%@page import="javax.servlet.RequestDispatcher" %>
<% String x=session.getAttribute("sess").toString();
String data=" ";
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select password from college_auth where clg_id=(select clg_id from colleges where clg_name='"+x+"')";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
data=rs.getString(1);
}
String cp=request.getParameter("cp");
String np1=request.getParameter("np1");
String np2=request.getParameter("np2");
if(!np1.equals(np2) || !cp.equals(data))
{
String f="0";
RequestDispatcher rd=request.getRequestDispatcher("change_pass_error.jsp");
request.setAttribute("flag",f);
rd.forward(request,response);
}
else
{
String f="1";
Statement st2=con.createStatement();
String s2="update college_auth set password='"+np2+"' where clg_id=(select clg_id from colleges where clg_name='"+x+"')";
st.executeUpdate(s2);
RequestDispatcher rd=request.getRequestDispatcher("change_pass_error.jsp");
request.setAttribute("flag",f);//first variable name, then value
rd.forward(request,response);
}
}
catch(SQLException e){
response.sendRedirect("change_pass_error.jsp");
}
%>
</body>
</html>