<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<html>
<head>
<title>网络在线考试</title>
<html:base/>
<link href="css/style.css" rel="stylesheet">
</head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="131" background="<%=bp %>/image/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="774" height="474"  border="0" cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="word_grey">&nbsp;<img src="<%=bp %>/image/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">找回密码 &gt;&gt;&gt;</span></td>
			  <td align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">&nbsp;<a href="index.jsp">返回首页</a>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td height="257" align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table> 
<form action="<%=bp%>/student/seekPwd1" method="post">
  <table width="57%" height="69" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td width="17%"><img src="<%=bp %>/image/step2.gif" width="73" height="30"></td>
      <td width="83%" class="word_orange1"><span style="padding:5px;">输入密码提示问题答案</span></td>
    </tr>
  </table>
  <table width="57%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
    <tr align="center">
    <td width="22%" height="30" align="left" style="padding:5px;">密码提示问题：</td>
    <td width="78%" align="left">
      <input type="hidden" name="examNum" value="${seekstudent.examNum }"> 
      <input type="text" name="question" value="${seekstudent.question }">
	  <span class="word_orange1"> （只读）</span>	  </td>
    </tr>
    <tr align="center">
    <td width="22%" height="30" align="left" style="padding:5px;">密码提示答案：</td>
    <td width="78%" align="left">
      <input type="text" name="answer" size="40">
      <span class="word_orange1"> *</span>	  </td>
    </tr>	
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>
        <input type="submit" styleClass="btn_grey" value="下一步" >
        &nbsp;
        <input type="reset" styleClass="btn_grey" value="取消">
		&nbsp;
		</td>
    </tr>
</table>
</form></td>
      </tr>
      <tr>
        <td height="141" align="right" valign="top"><img src="<%=bp %>/image/seedPwd.gif" width="139" height="153"></td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
