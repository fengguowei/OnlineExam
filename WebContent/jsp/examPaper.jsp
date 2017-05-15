<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<html>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<head>
<title>网络在线考试</title>
<script type="text/javascript" src="<%=bp %>/js/jquery.min.js"></script>
<link href="<%=bp %>/css/style.css" rel="stylesheet"/>
<script type="text/javascript">
timer = window.setInterval("showStartTime();showRemainTime();",1000); 
//此处需要加&nocache="+new Date().getTime()，否则将出现时间不自动走动的情况
function showStartTime(){
	$.ajax({
		async : false,
		type : "get",
		url : "${_base}/exam/showStartTime",
		success : function(data) {
			$("#showStartTimediv").empty();
			$("#showStartTimediv").html(data);
		}
	});			
}
function showRemainTime(){
	$.ajax({
		async : false,
		type : "get",
		url : "${_base}/exam/showRemainTime",
		success : function(data) {
			$("#showRemainTimediv").empty();
			$("#showRemainTimediv").html(data);
		}
	});	
}
</script>
<script language=javascript>
function keydown(){
	if(event.keyCode==8){
		event.keyCode=0;
		event.returnValue=false;
		alert("当前设置不允许使用退格键");
	  }if(event.keyCode==13){
		event.keyCode=0;
		event.returnValue=false;
		alert("当前设置不允许使用回车键");
	  }if(event.keyCode==116){
		event.keyCode=0;
		event.returnValue=false;
		alert("当前设置不允许使用F5刷新键");
	  }if((event.altKey)&&((window.event.keyCode==37)||(window.event.keyCode==39))){
		event.returnValue=false;
		alert("当前设置不允许使用Alt+方向键←或方向键→");
	  }if((event.ctrlKey)&&(event.keyCode==78)){
	   event.returnValue=false;
	   alert("当前设置不允许使用Ctrl+n新建IE窗口");
	  }if((event.shiftKey)&&(event.keyCode==121)){
	   event.returnValue=false;
	   alert("当前设置不允许使用shift+F10");
	  }
}
function click() {
 event.returnValue=false;
	 alert("当前设置不允许使用右键！");
}
document.oncontextmenu=click;
</script>

</head>

<body onLoad="showStartTime();showRemainTime();" onkeydown="keydown()">
<table width="770" border="0" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>
    <td width="40" height="39" background="<%=bp %>/image/startExam_leftTop.jpg">&nbsp;</td>
    <td width="667" align="right" background="<%=bp %>/image/startExam_top.jpg">&nbsp;
<table width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>	
<td width="23%" nowrap height=23 align=right>考试时间：</td>
		<td width="14%" nowrap><font color="#FF0000">20</font>分钟</td>
		<td width="13%" nowrap>计 时：</td>
		<td width="60" nowrap><div id="showStartTimediv">00:00:00</div>
		</td>
		<td width="16%" nowrap>剩余时间：</td>
		<td width="60" align=left nowrap><div id="showRemainTimediv"></div></td></tr>
</table>	
	</td>
    <td width="19" background="<%=bp %>/image/startExam_top.jpg">&nbsp;</td>
    <td width="44" background="<%=bp %>/image/startExam_rightTop.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td height="435" rowspan="2" background="<%=bp %>/image/startExam_left.jpg">&nbsp;</td>
    <td height="43" colspan="2"><img src="<%=bp %>/image/startExam_ico.jpg" width="117" height="43"></td>
    <td rowspan="2" background="<%=bp %>/image/startExam_right.jpg">&nbsp;</td>
  </tr>
  <tr>
    <td height="600" colspan="2" valign="top">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td colspan="2" align="center" class="title">${taoti.name } &nbsp;&nbsp;考试卷
          </td>
        </tr>
        <tr>
          <td width="30%">&nbsp;</td>
          <td width="70%">&nbsp;满分<font color="red">${manfen }</font>分&nbsp;&nbsp;&nbsp;单选题<font color="red">${singlefen }</font>分
          &nbsp;&nbsp;&nbsp;多选题<font color="red">${morefen }</font>分</td>
        </tr>
      </table>
	  <form action="<%=bp %>/exam/submitPaper" method="post">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <td>
<table id="single" width="90%"  border="0" cellspacing="0" cellpadding="0" align=center>

  <tr>
    <td colspan="4" height=23 style="font-size:11pt;">
           一、单选题（<font color=red>共${fn:length(singleShitis)}题，每题分值在题中标出，答错不给分</font>）</td>
  </tr>
  <c:forEach items="${singleShitis }" var="s_shiti" varStatus="i">
  	<input type="hidden" name="singleshitis[${i.index }].id" value="${s_shiti.id }">
  	<input type="hidden" name="singleshitis[${i.index }].question" value="${s_shiti.answer }">
  	<input type="hidden" name="singleshitis[${i.index }].answer" value="${s_shiti.answer }">
  	<input type="hidden" name="singleshitis[${i.index }].score" value="${s_shiti.score }">
  	<tr>
    <td height=23 colspan="4" align=center nowrap>
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="8%" align=right height=23>[&nbsp;${i.index+1}&nbsp;]</td>
		  <td width="2%">&nbsp;</td>
		  <td width="90%" align=left nowrap style="font-size:11pt;">
		  ${s_shiti.question }&nbsp;&nbsp;<font color="red">(${s_shiti.score }分)</font>
		  </td>
        </tr>
      </table>
	</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap>
    <input type="radio" name="singleshitis[${i.index }].myanswer" value="A"></td>
    <td width="3%" align=center nowrap>A.</td>
    <td width="86%" align=left nowrap>
    ${s_shiti.optionA }</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap>
    <input type="radio" name="singleshitis[${i.index }].myanswer" value="B"></td>
    <td width="3%" align=center nowrap>B.</td>
    <td width="86%" align=left nowrap>
    ${s_shiti.optionB}</td>
  </tr>
  <tr>
   <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap>
    <input type="radio" name="singleshitis[${i.index }].myanswer" value="C"></td>
    <td width="3%" align=center nowrap>C.</td>
    <td width="86%" align=left nowrap>
    ${s_shiti.optionC}</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap>
    <input type="radio" name="singleshitis[${i.index }].myanswer" value="D"></td>
    <td width="3%" align=center nowrap>D.</td>
    <td width="86%" align=left nowrap>
    ${s_shiti.optionD}</td>
  </tr>
  </c:forEach>
</table>

<table id="more" width="90%"  border="0" cellspacing="0" cellpadding="0" align=center>

  <tr>
    <td colspan="4" height=23 style="font-size:11pt;">
    二、多选题（<font color=red>共${fn:length(moreShitis)}题，每题分值在题中标出，答错不给分</font>）</td>
  </tr>
  <c:forEach items="${moreShitis }" var="m_shiti" varStatus="i">
  	<input type="hidden" name="moreshitis[${i.index }].id" value="${m_shiti.id }">
  	<input type="hidden" name="moreshitis[${i.index }].question" value="${m_shiti.answer }">
  	<input type="hidden" name="moreshitis[${i.index }].answer" value="${m_shiti.answer }">
  	<input type="hidden" name="moreshitis[${i.index }].score" value="${m_shiti.score }">
  	 <tr>
    <td height=23 colspan="4" align=center nowrap>
	  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="8%" align=right height=23>[&nbsp;${i.index+1}&nbsp;]</td>
		  <td width="2%">&nbsp;</td>
		  <td width="90%" align=left nowrap style="font-size:11pt;">
		   ${m_shiti.question }&nbsp;&nbsp;<font color="red">(${m_shiti.score }分)</font>
		  </td>
        </tr>
      </table>
	</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap>
    <input type="checkbox" name="moreshitis[${i.index }].myanswer" value="A"></td>
    <td width="3%" align=center nowrap>A.</td>
    <td width="86%" align=left nowrap>
    ${m_shiti.optionA}</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap>
    <input type="checkbox" name="moreshitis[${i.index }].myanswer" value="B"></td>
    <td width="3%" align=center nowrap>B.</td>
    <td width="86%" align=left nowrap>
    ${m_shiti.optionB}</td>
  </tr>
  <tr>
    <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap>
    <input type="checkbox" name="moreshitis[${i.index }].myanswer" value="C"></td>
    <td width="3%" align=center nowrap>C.</td>
    <td width="86%" align=left nowrap>
    ${m_shiti.optionC}</td>
  </tr>
  <tr>
      <td width="8%" height=23 nowrap>&nbsp;</td>
    <td width="3%" align=center nowrap>
    <input type="checkbox" name="moreshitis[${i.index }].myanswer" value="D"></td>
    <td width="3%" align=center nowrap>D.</td>
    <td width="86%" align=left nowrap>
    ${m_shiti.optionD}</td>
  </tr>
  </c:forEach>



</table>		
		</td>
	  </tr>
        <tr>
		  <td align="center">
		  <input type="submit" class="btn_grey" value="交卷">
		  </td>
        </tr>
      </table>
	  </form>
	  </td>
  </tr>
  <tr>
    <td width="40" height="40" background="<%=bp %>/image/startExam_leftBottom.jpg">&nbsp;</td>
    <td colspan="2" background="<%=bp %>/image/startExam_bottom.jpg">&nbsp;</td>
    <td background="<%=bp %>/image/startExam_rightBottom.jpg">&nbsp;</td>
  </tr>
</table>
</body>
</html>
