<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<html>
<head>
<title>操作成功!</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<%int para=Integer.parseInt((String)request.getAttribute("para"));
switch(para){
	case 1:
	%>
		<script language="javascript">
		alert("试题信息添加成功!");
		window.location.href="/OnlineExam/shiti/refreshPage";
		</script>	
	<%	break;
	case 2:
	%>
		<script language="javascript">
		alert("试题信息删除成功!");
		window.location.href="/OnlineExam/shiti/refreshPage";
		</script>		
	<%	break;
}
%>
</body>
</html>