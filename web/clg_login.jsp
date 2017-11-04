<html>
<head>
<title>College Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
<body>
<style>
    .form-control-inline {
    min-width: 0;
    width: auto;
    display: inline;
}
    </style>
<center>
<div class="container">
<form action="check.jsp" method="get">
<h3>Single Window Login<span class="label label-default"></span></h3><br>
<font color="black">Unique ID :</font> 
<input class="form-control form-control-inline" name="id" type="text" width="60px">
<font color="red"><b>*</font></b><br><br>
<font color="black">Password : </font>
<input class="form-control form-control-inline" type="password" name="cpass"><font color="red"><b>*</font></b><br><br>
<font color="black">You are a : <select name="vfy" class="form-control form-control-inline"><font color="red"><b>*</font></b>
<option value="student">Student
<option value="colleges">College
<option value="tab_details">Industry Representative
</font>
</select><br><br></b>
<input type="submit" class="btn btn-info" value="Submit"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="Reset" class="btn btn-info">
<%
String d=""; 
d=request.getParameter("status");
if(d.equals("1")==true)
{
%>
<br><br><br><div class="alert alert-danger form-control-inline">
  <strong>Sorry!</strong> Incorrect Credentials
</div>
<%
}
%>
</form>
<br><br>
<h4><div class="alert">Please Change Your Password After First Login</div></h4>
    </div>
</body>
</html>