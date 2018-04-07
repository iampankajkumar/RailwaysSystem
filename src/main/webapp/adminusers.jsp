<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Registered Users</title>
<meta name="keywords" content="Home" />
<link href="templatemo_style.css" rel="stylesheet" type="text/css" />

<%@include file="connection.jsp"%>

</head>
<body>

	<div id="templatemo_wrapper">

		<%@include file="header.jsp"%>

		<div id="templatemo_content">


			<!-- Form Body -->

			<div
				style="font-family: 'Times New Roman', Times, serif; font-size: 16px;">
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
							if (ssid == sessionid && author.equals("admin")) {
				%>
				<div align="center">
					<h1 align="center">FeedBacks</h1>
					<br /> <br /> <br />
					<div>
						<%
							String sql1 = "select * from reg_user ";

										pstmt = con.prepareStatement(sql1);

										rs = pstmt.executeQuery();

										out.println("<table border='1' bordercolor=#333333>");
										out.println("<tr bgcolor=#333333>");
										out.println("<th align='left' colspan='5' style='color:white'> Registered Users : </th> </tr>");
										out.println(
												"<tr bgcolor=#333333 style='color:white'>	<th> User Id</th> <th> Name </th> <th> Sex </th> <th> DOB </th> <th> Email Id </th> </tr>");

										int flag = 0;
										while (rs.next()) {
											flag = 1;
											out.println("<tr style='color:blue; font-weight:bold'>");
											out.println("<td>" + rs.getString("user_id") + "</td><td>" + rs.getString("name")
													+ "</td><td>" + rs.getString("sex") + "</td><td>" + rs.getString("dob")
													+ "</td><td>" + rs.getString("email_id") + "</td>");
											out.println("</tr>");
										}
										out.println("</table>");

										if (flag == 0) {
						%>
						<script type="text/javascript">
							alert("No Feedbacks Found");
						</script>
						<%
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
