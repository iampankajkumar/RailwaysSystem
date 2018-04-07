<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="keywords" content="Home" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.ennui.contentslider.css" rel="stylesheet"
	type="text/css" media="screen,projection" />

<title>Feed Back</title>
<%@include file="connection.jsp"%>


</head>
<body>

	<div id="templatemo_wrapper">

		<%@include file="header.jsp"%>

		<div id="templatemo_content">


			<!-- Form Body -->

			<div>
				<%
					try {
						String email = request.getParameter("emailid");
						String feed = request.getParameter("feed");

						String sql1 = "insert into feedback values('" + email + "','" + feed + "')";
						pstmt = con.prepareStatement(sql1);
						pstmt.executeUpdate();
				%>
				<div>
					<br /> <br /> <br /> <br />

					<h2>Thanks For Your Valuable FeedBack</h2>
					<a href="home.jsp"> OK </a>
				</div>

				<%
					} catch (Exception e) {
						e.printStackTrace();
						out.println("<h2>Input Error</h2>");
					}
				%>

			</div>


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
