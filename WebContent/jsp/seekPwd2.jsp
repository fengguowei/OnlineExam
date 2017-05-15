<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<html>
<head>
<title>网络在线考试</title>
<html:base/>
<link href="css/style.css" rel="stylesheet">
</head>
<body>
<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="131" background="../image/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="774" height="474"  border="0" cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td class="word_grey">&nbsp;<img src="../image/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">找回密码 &gt;&gt;&gt;</span></td>
			  <td align="right"><img src="../image/m_ico1.gif" width="5" height="9">&nbsp;<html:link page="/index.jsp" >返回首页</html:link>&nbsp;</td>
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
 <table width="57%" height="69" border="0" cellpadding="0" cellspacing="0">
   <tr>
     <td width="17%"><img src="../image/step3.gif" width="73" height="30"></td>
     <td width="83%" class="word_orange1">成功找回密码</td>
   </tr>
 </table>
 <table width="57%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
    <tr align="center">
    <td width="22%" height="30" align="left" style="padding:5px;">准考证号：</td>
    <td width="78%" align="left">
      <input type="text" name="examNum" value="${seek2student.examNum }" readonly="readonly">
	  <span class="word_orange1"> （只读）</span>	  </td>
    </tr>
    <tr align="center">
    <td width="22%" height="30" align="left" style="padding:5px;">密&nbsp;&nbsp;&nbsp;&nbsp;码：</td>
    <td width="78%" align="left">
      <input type="text" name="examNum" value="${seek2student.pwd }" readonly="readonly">
      <span class="word_orange1"> （只读）</span>	  </td>
    </tr>	
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>&nbsp;
		<input type="button" value="返回" class="btn_grey" onClick="window.location.href='../jsp/index.jsp'"/>		</td>
    </tr>
</table>
</td>
      </tr>
      <tr>
        <td height="141" align="right" valign="top"><img src="../image/seedPwd.gif" width="139" height="153"></td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
