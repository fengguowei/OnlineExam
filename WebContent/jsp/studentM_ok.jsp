<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>�����ɹ�!</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<body>
<script type="text/javascript">
alert("���������޸ĳɹ�!");
window.location.href="<%=bp%>/jsp/default.jsp";
</script>		
</body>
</html>