<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String msg = (String) request.getAttribute("msg");
	String loc = (String) request.getAttribute("loc");
	String script = (String) request.getAttribute("script");
	String[] msgs = msg.split("/");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알림페이지</title>
</head>
<body>
	<script type="text/javascript">
		 <%if (msgs.length > 1) {%>
	   		alert('<%=msgs[0]%>'+'\n'+'<%=msgs[1]%>');
		 <%} else {%>
		    alert('<%=msgs[0]%>');
		 <%}%>
		 <%=script != null ? script : ""%>
		 location.href='<%=request.getContextPath()%><%=loc%>';
	</script>
</body>
</html>