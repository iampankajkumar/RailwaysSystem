<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Password Reset</title>
<meta name="keywords" content="Home" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet"
	type="text/css" media="screen,projection" />


<%@include file="connection.jsp"%>

</head>
<body>

	<div id="templatemo_wrapper">

		<%@include file="header.jsp"%>

		<div id="templatemo_content">


			<!-- Form Body -->

			<%
				String _email = "";
				String _dob = "";
				String _pass = "";
				try {

					_email = request.getParameter("email");
					_dob = request.getParameter("dob");
					_pass = request.getParameter("password1");

					String sql1 = "select * from reg_user where email_id='" + _email + "' and dob='" + _dob + "' ";

					pstmt = con.prepareStatement(sql1);
					rs = pstmt.executeQuery();

					int flag = 0;
					if (rs.next()) {
						flag = 1;
					}

					if (flag == 0) {
			%>
			<div>
				<br /> <br /> <br /> <br />
				<h2>Email Id and Date Of Birth Does Not match</h2>
				<a href="./home.jsp"> OK </a>
			</div>
			<%
				} else {

						String sql2 = " update reg_user set pass_wrd='" + _pass + "' where email_id='" + _email
								+ "' and dob='" + _dob + "' ";
						pstmt = con.prepareStatement(sql2);
						pstmt.executeUpdate();

						String sql3 = " update login set pass='" + _pass + "' where email='" + _email + "'";
						pstmt = con.prepareStatement(sql3);

						if (pstmt.executeUpdate() > 0) {
			%>
			<div>
				<br /> <br /> <br /> <br />
				<h2>
					Password Changed For The Email ID
					<%=_email%>
				</h2>
				<a href="./home.jsp"> OK </a>
			</div>
			<%
				}
					}

				} catch (Exception e) {
					//e.printStackTrace();
			%>
			<div>
				<br /> <br /> <br /> <br />
				<h2>Input Error</h2>
			</div>
			<%
				}
			%>

			<!-- Form Body -->

		</div>
		<!-- end of templatemo_content -->

		<div id="templatemo_sidebar">
			<div id="sidebar_featured_project">
				<div class="cleaner"></div>
				<div class="cleaner"></div>
				<div class="cleaner"></div>
				<div class="cleaner"></div>
				<h3>Information</h3>
				<div class="right">

					<h6>
						<a href="SearchTrain.jsp">Trains Btw Stations</a>
					</h6>
					<h6>
						<a href="SearchSchedule.jsp">Train Schedules</a>
					</h6>
					<h6>
						<a href="ViewFare.jsp">Fare List</a>
					</h6>
					<h6>
						<a href="http://www.indianrail.gov.in" target="_new">Other
							Railway Websites </a>
					</h6>

				</div>

				<div class="cleaner"></div>

			</div>
			<div class="cleaner"></div>
		</div>

		<%@include file="footer.jsp"%>

	</div>
	<!-- end of wrapper -->


</body>
</html>
