<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<head>
<title>网络在线考试――后台管理</title>
<link href="<%=bp %>/css/style.css" rel="stylesheet"/>
<script type="text/javascript" src="<%=bp %>/js/jquery.min.js"></script>
<script type="text/javascript">
var openUrl = "";//弹出窗口的url
var iWidth=800; //弹出窗口的宽度;
var iHeight=700; //弹出窗口的高度;
var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;
var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;
function startExam(){
	var taotiId = $("#taotiId").val();
	$.ajax({
		async : false,
		type : "POST",
		data : {taotiId:taotiId},
		url : "${_base}/exam/goExamPaper",
		success : function(data) {
			window.open('<%=bp %>/jsp/examPaper.jsp',"","height="+iHeight+", width="+iWidth+", top="+iTop+", left="+iLeft);
		}
	});		
}

</script>
</head>
<body>

<table width="778" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="131" background="<%=bp %>/image/top_bg.jpg">&nbsp;</td>
  </tr>
</table>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="774" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="76%" class="word_grey">&nbsp;<img src="<%=bp %>/image/f_ico.gif" width="8" height="8"> 当前位置：→ <span class="word_darkGrey">在线考试 → 准备考试 &gt;&gt;&gt;</span></td>
			  <td width="24%" align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">
			    <a href="<%=bp %>/default.jsp" >返回首页</a>&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%" height="265"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="93" colspan="3" align="center" class="word_orange1">&nbsp;</td>
</tr>
  <tr>
    <td width="12%">&nbsp;</td>
    <td width="77%" align="center" valign="top">准备好了吗？<br><br>考生单击“开始考试”按钮，系统将立即记录本次考试并登记考试成绩！</td>
    <td width="11%">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td align="center" valign="top">
    <input type="hidden" id="taotiId" name="taotiId" value="${taotiId }">
    <input type="button" class="btn_grey" value="开始考试" onclick="startExam()">
    <input type="button" class="btn_grey" value="返回" onclick="history.back(-1)">	
	</td>
    <td>&nbsp;</td>
  </tr>
</table> 
        </td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="copyright.jsp"%>
</body>
</html>
