<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<% String x=session.getAttribute("sess").toString(); %>
<body>
<div class="container">
<%@page import="java.sql.*" %>
<%
int scid=Integer.parseInt(request.getParameter("scid"));
String crse_n=request.getParameter("crse_n");
String r3=request.getParameter("rrr");
String sfn=request.getParameter("sfn");
String sbn=request.getParameter("sbn");
String sln=request.getParameter("sln");
int i=0;
int sid=0;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select course_id from course where course_name='"+crse_n+"'";
ResultSet rs=st.executeQuery(s);
while(rs.next())
{
i=rs.getInt(1);
}
Statement st1=con.createStatement();
String s1="insert into student(clg_id,registration_no,fname,mname,lname) values("+scid+",'"+r3+"','"+sfn+"','"+sbn+"','"+sln+"')";
st1.executeUpdate(s1);
Statement st2=con.createStatement();
String s2="select max(studid) from student";
ResultSet rsf=st2.executeQuery(s2);
while(rsf.next())
{
sid=rsf.getInt(1);
}
Statement stf=con.createStatement();
String sf="update student_details set course_id="+i+" where studid="+sid+"";
stf.executeUpdate(sf);
Statement spass=con.createStatement();
String sp="update student_details set password='"+r3+"' where studid="+sid+"";
spass.executeUpdate(sp);
%>
<p><i><b>Student Successfully Added.</i></b></p><br>
<p><font color="red">Password for Student ID <%= sid %> is the <i>Registration Number</i> itself</font></p><br>
<a href="college_panel.jsp">back</a>
<%
}
catch(SQLException e){response.sendRedirect("error.html");}
%>
</div>
</body>
</html>