<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Leave Application</title>
<%@include file="/shared/resources.html" %>
<script type="text/javascript">
    $(function () {
        var dateformat = "dd/mm/yy";
        var fromDate, toDate;
        var oneDay = 24 * 3600 * 1000;
        $("#fromDate").datepicker({
            defaultDate: 1,
            minDate: 1,
            numberOfMonths: 2,
            dateFormat: dateformat,
            onClose: function (selectedDate) {
                if (selectedDate) {
                	fromDate = $.datepicker.parseDate(dateformat, selectedDate);
                	console.info(fromDate);
                    $("#toDate").datepicker("option", "minDate", new Date(indate.getTime()));
                }
            }
        });
        $("#toDate").datepicker({
            numberOfMonths: 1,
            dateFormat: dateformat,
            onClose: function (selectedDate) {
                toDate = $.datepicker.parseDate(dateformat, selectedDate);
            }
        });
        $('#calFrom').click(function () {
            $('#').datepicker('show');
        });
        $('#calTo').click(function () {
            $('#').datepicker('show');
        });
        
        $(function() {
        	$( "#tabs" ).tabs();
       	});
    });
</script>
<style type="text/css">
div.ui-datepicker, .ui-datepicker td
{
    font-size: 10px;
}
.ui-widget 
{
	font-family: Trebuchet MS, Tahoma, Verdana, Arial, sans-serif; font-size: 1.1em;
}

.ui-tabs .ui-tabs-nav li a { float: left; padding: .2em .5em; text-decoration: none; }
</style>
</head>
<body>

<table align="center" style="width: 940px;">
	<tr>
		<td colspan="2"><%@include file="/shared/header.html" %></td>
	</tr>
	<tr>
	<td>
		
	</td>
	<td align="center">
		<div style="text-align: right;">
			Welcome, ${employeeName}!
		</div>
		
		
		<div id="tabs">
					<ul>
						<li><a href="#tabs-1">My Leave</a></li>
						<li><a href="#tabs-2">Calendar</a></li>
						<li><a href="#tabs-3">Approving Officer</a></li>
					</ul>
					<div id="tabs-1">
			<form action="/shared/test.html" method="post">
			<table>
				<tr>
					<td>Leave Type:</td>
					<td>
						<select>
							<option>Annual</option>
							<option>Medical</option>
							<option>No-pay</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>From:</td>
					<td><input id="fromDate" name="fromDate" type="text" /></td>
				</tr>
				<tr>
					<td>To:</td>
					<td><input id="toDate" name="toDate" type="text" /></td>
				</tr>
				<tr>
					<td>Leave Days:</td>
					<td><input name="leaveDays" type="text" /> </td>
				</tr>
				<tr>
					<td>Approving Officer:</td>
					<td><input type="text" /></td>
				</tr>
				<tr>
					<td>Reason for Leave:</td>
					<td><textarea name="reason" rows="3" cols="30"></textarea></td>
				</tr>
				<tr>
					<td colspan="2"><p><button class="btn btn-small btn-primary" type="button">Save</button></p></td>
				</tr>
			</table>
		</form>
					</div>
					<div id="tabs-2">
						<p>Calendar</p>
					</div>
					<div id="tabs-3">
						<p>List of subordinate pending leave applications</p>
					</div>
				</div>
	</td>
	</tr>
	<tr></tr>
</table>
</body>
</html>