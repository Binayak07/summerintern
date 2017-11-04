<% 
String val= (String)request.getAttribute("flag");
if(val.equals("0"))
{
%>
<p><b><font color="red"> Incorrect Current Password or New Password Mismatch</p> &nbsp;&nbsp;&nbsp;
<a href="clg_change_pass.jsp">Go Back</a>
<%
}
else
{
session.removeAttribute("sess");
%>
<p><b><font color="red">Password Successfully Changed <a href="clg_login.jsp?status=0">Login</a> to continue</p> 
<%
}
%>