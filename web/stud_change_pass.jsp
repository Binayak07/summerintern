<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<body>
<% String x=session.getAttribute("np").toString(); %>
<center>
<b><p><%= x %></b> Change your Password</p>
<div class="fluid-container">
<form action="stud_pass_resp.jsp" method="get">
Enter Current Password &nbsp;<input type="password" name="cp"><font color="red">*</font><br>
Enter New Password &nbsp;&nbsp;&nbsp; &nbsp; <input type="password" name="np1"><font color="red">*</font><br>
Re-enter New Password &nbsp;<input type="password" name="np2"><font color="red">*</font><br><br>
<input type="submit" value="Change Password" class="btn btn-info"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset" class="btn btn-info"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="student_panel.jsp"><b>back</b></a><br>
</form>
</div>
<p><i>All</i> <font color="red">*</font> <i>marked fields are mandatory</i></p>
<p><b>Note:</b> <u>You will be redirected to the <b>Login</b> page after successful change of password</u></p>
</body>
</html>