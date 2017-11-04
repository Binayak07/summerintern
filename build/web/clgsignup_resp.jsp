<%@page import="java.sql.*" %>
<%
String cn=request.getParameter("cn");
String ct=request.getParameter("ct");
String lc=request.getParameter("lc");
int li=0,tp=0;
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","project","binayak");
Statement st=con.createStatement();
String s="select clg_type_id from clg_type where clg_type_name='"+ct+"'";
ResultSet rs=st.executeQuery(s);
while(rs.next())
tp=rs.getInt(1);
Statement st2=con.createStatement();
String s2="select loc_id from location where location='"+lc+"'";
ResultSet rs2=st2.executeQuery(s2);
while(rs2.next())
li=rs2.getInt(1);
Statement stf=con.createStatement();
String fin="insert into colleges(clg_name,clg_type_id,loc_id) values('"+cn+"',"+tp+","+li+")";
stf.executeQuery(fin);
Statement last=con.createStatement();
ResultSet rlast=last.executeQuery("select max(clg_id) from colleges");
int f=0;
while(rlast.next())
{
f=rlast.getInt(1);
}
Statement pw=con.createStatement();
String ps="update college_auth set password="+f+" where clg_id="+f+"";
pw.executeQuery(ps);
%>
Hello <%= cn %>,<b><i>You have successfully signed up, please</i></b> <a href="clg_login.jsp?status=0"><b>login</a> <i>to continue. Your password is <%= f %> You are advised to change your password after your first login.</i></b>
<%
}
catch(SQLException e){}
%>
