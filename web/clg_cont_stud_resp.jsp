<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<body>
<%@page import="java.sql.*" %>
<% String x=session.getAttribute("sess").toString(); %>
<%
int cc=0;
String msg=request.getParameter("msg");
String recv=request.getParameter("rcv");
String subj=request.getParameter("sub");
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select fname,mname,lname,studid from student where clg_id=(select clg_id from colleges where clg_name='"+x+"')";
ResultSet rs=st.executeQuery(s);
int flag=0;
int id=0;
String cat1="";
String cat2="";
String cat3="";
String fcat="";
while(rs.next())
{
cat1=rs.getString(1);
cat2=rs.getString(2);
cat3=rs.getString(3);
fcat=cat1+" "+cat2+" "+cat3;
if(fcat.equals(recv))
{
id=rs.getInt(4);
flag=1;
break;
}
}
if(flag==1)
{
Statement st8=con.createStatement();
String s8="select clg_id from colleges where clg_name='"+x+"'";
ResultSet rs8=st.executeQuery(s8);
while(rs8.next())
{
cc=rs8.getInt(1);
}
Statement st1=con.createStatement();
String y="Student";
String z="College";
String s1="insert into message(s_type,r_type,sender,receiver,msg,subject,status) values('"+z+"','"+y+"',"+cc+","+id+",'"+msg+"','"+subj+"','N')";
st1.executeUpdate(s1);
%>
<br><p><font color="brown">Your Message to <b><%= fcat%></b> is sent Successfully.</p>
<a href="college_panel.jsp">Back</a>
<%
}
}
catch(SQLException e){response.sendRedirect("error.html");}
%> 
