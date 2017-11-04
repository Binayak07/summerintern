<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css"/>  
</head>
<body>
<% String x=session.getAttribute("sess").toString(); %>
<center>
<p><i><%= x %></i> Change your Password</p>
<div class="fluid-container">
<form action="clg_pass_resp.jsp" method="get">
Enter Current Password <input type="password" name="cp"><font color="red">*</font><br>
Enter New Password <input type="password" name="np1"><font color="red">*</font><br>
Re-enter New Password <input type="password" name="np2"><font color="red">*</font><br>
<input type="submit" value="Change Password"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="reset"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="college_panel.jsp"><b>back</b></a>
</form>
</div>
<p><i>All</i> <font color="red">*</font> <i>marked fields are mandatory</i></p>
</body>
</html>