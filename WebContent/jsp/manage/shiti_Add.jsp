<%@ page contentType="text/html; charset=utf-8" language="java" errorPage="" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>
<head>
<%
String _base = request.getContextPath();
String bp = _base;
request.setAttribute("_base", _base);
%>
<title>网络在线考试――后台管理</title>
<link href="<%=bp %>/css/style.css" rel="stylesheet">
<script type="text/javascript" src="<%=bp %>/js/jquery.min.js"></script>
</head>
<script language="javascript">
$(document).ready(function(){	
	
	$("#single").click(function(){
		$("#sOption").show();
		$("#mOption").hide();
	});
	$("#more").click(function(){
		$("#mOption").show();
		$("#sOption").hide();
	});
});

function F_getTaoTi(val){
	$.ajax({
		async : false,
		type : "POST",
		data : {lessonId:val},
		url : "${_base}/taoti/getTaotiByLessonId",
		success : function(data) {
			$("#whichTaoTi").empty();
			$("#whichTaoTi").html(data);
		}
	});		
}
function onerror(){
	alert("出错了");
}
function deal(h){
	whichTaoTi.innerHTML=this.req.responseText;
}
function checkForm(form){
	if(form.name.value==""){
		alert("请输入考试题目名称!");form.name.focus();return false;
	}
}
</script>
<body>
<%@ include file="top.jsp"%>
<table width="778" border="0" align="center" cellspacing="0" cellpadding="0">
  <tr>
    <td width="176" align="center" valign="top" bgcolor="#FFFFFF">
    <%@ include file="left.jsp"%></td>
    <td width="602" valign="top" bgcolor="#FFFFFF"><table width="99%" height="487"  border="0" cellpadding="0" cellspacing="0" align="right">
      <tr>
        <td height="30" bgcolor="#EEEEEE" class="tableBorder_thin"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="78%" class="word_grey">&nbsp;当前位置：<span class="word_darkGrey">考试题目管理 &gt; 添加考试题目 &gt;&gt;&gt;</span></td>
              <td align="right"><img src="<%=bp %>/image/m_ico1.gif" width="5" height="9">&nbsp;当前管理员：${manager.name }&nbsp;</td>
              </tr>
          </table></td>
        </tr>
      <tr>
        <td align="center" valign="top">
 <table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="84%">&nbsp;      </td>
</tr>
</table> 
  <form action="<%=bp %>/shiti/add" method="post">
  <table width="85%"  border="0" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#D2E3E6" bordercolorlight="#FFFFFF">
  <tr>
    <td height="30" align="left" style="padding:5px;">所属课程：</td>
    <td align="left">
	 	<select name="taoti.lesson.id" style="width:128px" onchange="F_getTaoTi(this.value)">
	 		<option value="">--请选择--</option>
	 		<c:forEach items="${lessons }" var="l">
	 				<option value="${l.id }">${l.name }</option>
	 		</c:forEach>	 	
	 	</select>
     </td>
    </tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">所属套题：</td>
    <td align="left" id="whichTaoTi">
    	<select style="width:128px" >	 		
	 		<option value="">--请选择--</option>	 	 	
	 	</select>
    </td>
    </tr>
  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">考试题目：</td>
    <td width="85%" align="left">
      <input type="text" name="question"><font color="red">*</font> 
	  </td>
    <tr>
    <tr>
    <td height="30" align="left" style="padding:5px;">试题类型：</td>
    <td align="left">
	 <input type="radio" value="单选题" name="type" id="single" checked="checked">单选题</input>
	 <input type="radio" value="多选题" name="type" id="more">多选题</input>
     </td>
    </tr>	
    <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">选项A：</td>
    <td width="85%" align="left">
       <input type="text" name="optionA"><font color="red">*</font> 
	  </td>
    </tr>
	  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">选项B：</td>
    <td width="85%" align="left">
      <input type="text" name="optionB"><font color="red">*</font>
	  </td>
    </tr>
	  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">选项C：</td>
    <td width="85%" align="left">
      <input type="text" name="optionC"><font color="red">*</font>
	  </td>
    </tr>
  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">选项D：</td>
    <td width="85%" align="left">
      <input type="text" name="optionD"><font color="red">*</font>
	  </td>
    </tr>
    <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">正确答案：</td>
    <td width="85%" align="left" id="sOption">
     <input type="radio" value="A" name="answer">A</input>
	 <input type="radio" value="B" name="answer">B</input>
	 <input type="radio" value="C" name="answer">C</input>
	 <input type="radio" value="D" name="answer">D</input>
	  </td>	
    <td width="85%" align="left" id="mOption" style="display:none">
 	<input type="checkbox" value="A" name="answer">A</input>
	 <input type="checkbox" value="B" name="answer">B</input>
	 <input type="checkbox" value="C" name="answer">C</input>
	 <input type="checkbox" value="D" name="answer">D</input>
	  </td>		  
    </tr>
	<tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">分值：</td>
    <td width="85%" align="left">
      	<input type="text" name="score">
	  </td>
    </tr>	
	  <tr align="center">
    <td width="15%" height="30" align="left" style="padding:5px;">备注：</td>
    <td width="85%" align="left">
      	<textarea rows="" cols="" name="remark"></textarea>
	  </td>
    </tr>	
    <tr>
      <td height="65" align="left" style="padding:5px;">&nbsp;</td>
      <td>
      	<input type="submit" class="btn_grey" value="保存">
        &nbsp;
        <input type="reset" class="btn_grey" value="取消">
		&nbsp;
		<input type="button" class="btn_grey" value="返回" onclick="window.location.href='<%=bp %>/shiti/refreshPage'"></td>
    </tr>
</table>
</form>
</td>
      </tr>
    </table>
</td>
  </tr>
</table>
<%@ include file="../copyright.jsp"%>
</body>
</html>
