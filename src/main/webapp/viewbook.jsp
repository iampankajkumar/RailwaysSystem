<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Bookings</title>
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

			<div>
				<%
					//Session Validation
					try {
						if (session.isNew()) {
							out.println("<h3><span style='color: red;'>Access Denied please login to access </span></h3>");
						} else {
							String uname = (String) session.getAttribute("uname");
							String ssid = (String) session.getAttribute("sid");
							String author = (String) session.getAttribute("author");
							String sessionid = (String) session.getId();
							String uid = (String) session.getAttribute("uid");
							if (ssid == sessionid && author.equals("user")) {
				%>
				<div align="center">
					<h1 align="center">Bookings</h1>
					<br /> <label style="font-weight: bold; color: red;">Bookings
						Done By <%=uname%></label> <br /> <br />
					<div>
						<%
							try {

											String sql1 = "select distinct t.PNR, t.train_no, t.dep_date, t.adult, t.child, t.no_seats, t.board_station, t.dest_station, t.total_km, u.name from ticket_book t, reg_user u where t.user_id=u.user_id and t.user_id='"
													+ uid + "' ";

											pstmt = con.prepareStatement(sql1);

											rs = pstmt.executeQuery();

											out.println("<table border='1' bordercolor=#333333>");
											out.println("<tr bgcolor=#333333>");
											out.println(
													"<th align='left' colspan='7' style='color:white'> Booking Details : </th> </tr>");
											out.println(
													"<tr bgcolor=#333333 style='color:white'>	<th> PNR No</th> <th> Train No</th> <th> Dep_Date</th> <th> No_Seats</th><th> Boarding Station</th><th> Destination Station</th><th> Distance</th></tr>");

											int flag = 0;
											while (rs.next()) {
												flag = 1;
												out.println("<tr style='color:blue; font-weight:bold'>");
												out.println("<td>" + rs.getInt(1) + "</td><td>" + rs.getString(2) + "</td><td>"
														+ rs.getString(3) + "</td><td>" + rs.getString(6) + "</td><td>"
														+ rs.getString(7) + "</td><td>" + rs.getString(8) + "</td><td>"
														+ rs.getString(9) + "</td>");
												out.println("</tr>");
											}
											out.println("</table>");

											if (flag == 0) {
						%>
						<script type="text/javascript">
							alert("No Bookings Found");
						</script>
						<%
							}

										} catch (Exception e) {
											e.printStackTrace();
										}
						%>
					</div>
				</div>
				<%
					//Session Validation

							} else {
								out.println("<h3><span style='color: red;'>Access Denied please login to access </span></h3>");
							}
						}
					} catch (Exception e) {
						out.println("<h3><span style='color: red;'>Access Denied please login to access </span></h3>");
					}
				%>

			</div>

			<!-- Form Body -->

		</div>
		<!-- end of templatemo_content -->

		<div id="templatemo_sidebar">
			<div id="request_a_quote">
				<%
					try {
						if (session.isNew()) { //session.isNew is true for the first time when the page is loaded
						} else {
							String uname = (String) session.getAttribute("uname");
							String ssid = (String) session.getAttribute("sid");
							String author = (String) session.getAttribute("author");
							String error = (String) session.getAttribute("error");
							String sessionid = (String) session.getId();
							if (error == "Y") { //error=Y is set when the email and password are mismatched
							} else if (ssid == sessionid) { //To verify the session id of page and sid i.e session id set during session creation match
				%>
				<h2>Login Details</h2>
				<br />
				<p style="font-size: 12pt">
					<label style="color: #DD0000;"> UserName</label> &nbsp;
					<%=uname%>
					<br /> <label style="color: #DD0000;"> Authority </label> &nbsp;
					<%=author.toUpperCase()%>
					<br /> <br /> <a href="<%=author%>home.jsp"> <%=author.toUpperCase()%>
						Home
					</a> <a href='Logout.jsp'> Logout</a>
				</p>
				<%
					} else { //if all cases fail login is prompted
							}
						}
					} catch (Exception e) {
					}
				%>
			</div>

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
