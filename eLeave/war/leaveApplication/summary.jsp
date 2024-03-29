<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>My Leave Summary</title>
<%@include file="/shared/resources.html"%>
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
								<td style="font-weight: bold;">Entitled</td>
								<td style="font-weight: bold;">Taken</td>
								<td style="font-weight: bold;">Balance</td>
							</tr>
							<tr class="overview-item">
								<td>Annual</td>
								<td>18</td>
								<td>3</td>
								<td>15</td>
							</tr>
							<tr class="overview-item">
								<td>Medical</td>
								<td>14</td>
								<td>1</td>
								<td>13</td>
							</tr>
							<tr class="overview-item">
								<td>No-pay</td>
								<td>N.A.</td>
								<td>2</td>
								<td>N.A.</td>
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
		$("#leaveSummary").addClass("selected");
	});
	</script>
</body>
</html>