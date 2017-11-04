<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<% String x=session.getAttribute("sess").toString(); %>
<body>
<div class="container">
<br><br><br>
<%
int clgid=Integer.parseInt(request.getParameter("clgid"));
String clgn = request.getParameter("clgn");
String cadd1 = request.getParameter("cadd1");
String cadd2= request.getParameter("cadd2");
String ct = request.getParameter("ct");
String cst = request.getParameter("cst");
String ccount = request.getParameter("ccount");
String clgph1 = request.getParameter("clgph1");
String clgph2 = request.getParameter("clgph2");
String clgweb = request.getParameter("clgweb");
String clgem = request.getParameter("clgem");
String clgcp = request.getParameter("clgcp");
String clgcno = request.getParameter("clgcno");
String clgpem = request.getParameter("clgpem");
String clgs = request.getParameter("clgs");
%>
<%@page import="java.sql.*" %>
<% 
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="update colleges set CLG_NAME='"+clgn+"',ADD1='"+cadd1+"',add2='"+cadd2+"',city='"+ct+"',state='"+cst+"',country='"+ccount+"',ph1='"+clgph1+"',ph2='"+clgph2+"',website='"+clgweb+"',email='"+clgem+"',contact_person='"+clgcp+"',contact_no='"+clgcno+"',person_email='"+clgpem+"',status='"+clgs+"' where clg_id="+clgid+""; 
st.executeQuery(s);
%>
<p><b><%= x %></b> <i>Your profile is Successfully Updated</i></p>
<br>
<b><a href="college_panel.jsp">back</a>
<%
}
catch(SQLException e)
{}
%>
</div>
</body>
</html>