<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Leave</title>
<%@include file="/shared/resources.html"%>
<style type="text/css">
a:link {
	color: #000000;
	text-decoration: underline
}

a:visited {
	color: #000000;
	text-decoration: none
}

a:active {
	color: #ff0000;
	text-decoration: none
}

a:hover {
	color: #ff0000;
	text-decoration: underline
}
</style>
</head>
<body>
	<table align="center" style="width: 100%;">
		<tr>
			<td><%@include file="/shared/header.jsp"%></td>
		</tr>
		<tr>
			<td>
				<div style="margin: 2px; padding: 5px; width: 960px;">
					<%@include file="/shared/menu.jsp"%>
					<table class="overview-eleave-items">
						<tbody>
							<tr class="overview-item">
								<td>Leave Type</td>
								<td style="font-weight: bold;">From Date</td>
								<td style="font-weight: bold;">To Date</td>
								<td style="font-weight: bold;">Leave Days</td>
								<td style="font-weight: bold;">Status</td>
							</tr>
							<tr class="overview-item">
								<td>Annual</td>
								<td>15/07/2013</td>
								<td>17/07/2013</td>
								<td>3</td>
								<td><a href="/leaveApplication/edit.jsp?id=3">Pending</a></td>
							</tr>
							<tr class="overview-item">
								<td>Medical</td>
								<td>01/07/2013</td>
								<td>01/07/2013</td>
								<td>1</td>
								<td><a href="/leaveApplication/edit.jsp?id=2">Approved</a></td>
							</tr>
							<tr class="overview-item">
								<td>No-pay</td>
								<td>25/06/2013</td>
								<td>26/06/2013</td>
								<td>2</td>
								<td><a href="/leaveApplication/edit.jsp?id=1">Approved</a></td>
							</tr>
						</tbody>
					</table>
				</div>


			</td>
		</tr>
		<tr>
			<td><%@include file="/shared/footer.html"%></td>
		</tr>
	</table>
	<script type="text/javascript">
	$(function() {
		var index = $('#menu a[href="#tabs-1"]').parent().index();
		$("#menu").tabs("option", "active", index);
		$("#leaveHistory").addClass("selected");
	});
	</script>
</body>
</html>