<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<script language="javascript">
alert("${submitTestPaperok}");
window.opener.location.href="${_base}/jsp/default.jsp";
window.close();
</script>		
</body>
</html>