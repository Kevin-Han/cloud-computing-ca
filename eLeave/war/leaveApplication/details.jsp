<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Leave Application Details</title>
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
					<form class="new" action="/leaveApplication/list.jsp" method="post">
						<table class="overview-eleave-items">
							<tbody>
								<tr class="overview-item">
									<td>Leave Type:</td>
									<td>${t}</td>
								</tr>
								<tr class="overview-item">
									<td>From:</td>
									<td><fmt:formatDate value="${appDetails.fromDate}" pattern="dd/MM/yyyy"/></td>
								</tr>
								<tr class="overview-item">
									<td>To:</td>
									<td><fmt:formatDate value="${appDetails.toDate}" pattern="dd/MM/yyyy"/></td>
								</tr>
								<tr class="overview-item">
									<td>Leave Days:</td>
									<td><fmt:formatNumber type="number" maxFractionDigits="0" value="${appDetails.days}" /></td>
								</tr>
								<tr class="overview-item">
									<td>Approving Officer:</td>
									<td>${supervisorName}</td>
								</tr>
								<tr class="overview-item">
									<td>Reason for Leave:</td>
									<td><textarea name="reason" rows="3" cols="30" readonly="readonly">${appDetails.reason}</textarea></td>
								</tr>
								<tr class="overview-item">
									<td>Status</td>
									<td>${appDetails.status}</td>
								</tr>
								<tr class="overview-item">
									<td />
									<td><p>
											<input type="submit" value="Back" class="sbutton" />
										</p></td>
								</tr>
							</tbody>
						</table>
					</form>
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
		$("#leaveForm").addClass("selected");
	});
	</script>
</body>
</html>