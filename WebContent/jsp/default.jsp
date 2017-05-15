<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>网络在线考试</title>
<link href="<%=bp %>/css/style.css" rel="stylesheet">
</head>

<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="208" background="<%=bp %>/image/default_top.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td><img src="<%=bp %>/image/default_mid.JPG" width="778" height="254" border="0" usemap="#Map"></td>
  </tr>
  <tr>
    <td height="158" background="<%=bp %>/image/default_bottom.JPG">&nbsp;</td>
  </tr>
</table>
<map name="Map">
        <area shape="poly" coords="190,65,190,65,215,82,194,98,105,113,103,81" href="<%=bp %>/jsp/examRule.jsp">
        <area shape="poly" coords="313,59,402,45,435,56,406,78,311,90,313,58" href="<%=bp %>/stuResult/goResultPage?studentId=${student.id}">
        <area shape="poly" coords="380,141,508,119,541,139,521,154,385,176" href="<%=bp %>/student/goModifyStudent">
        <area shape="poly" coords="602,58,690,46,715,63,696,76,602,91" href="<%=bp %>/jsp/index.jsp">
</map>
</body>
</html>
