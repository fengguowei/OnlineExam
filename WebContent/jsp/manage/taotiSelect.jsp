<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<select name="taoti.id" style="width:128px">
	<c:forEach items="${taotis }" var="t">
		<option value="${t.id }">${t.name }</option>
	</c:forEach>	 	
</select>