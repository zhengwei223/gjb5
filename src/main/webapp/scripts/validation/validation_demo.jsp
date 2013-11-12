<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base href="<%=basePath%>">
<link rel="stylesheet" type="text/css" href="scripts/validation/css/MrThink.css">
<link rel="stylesheet" type="text/css" href="scripts/validation/css/style.css">
<script type="text/javascript" src="scripts/validation/js/jquery.js"></script>
<script type="text/javascript" src="scripts/validation/js/vanadium.js"></script>
<script type="text/javascript" src="scripts/validation/js/MrThink.js"></script>
<title>基于JQUERY的表单验证插件</title>
</head>
<body>
<form id="iform" name="iform" method="post" action="#">
<fieldset>
<legend>基于JQUERY的表单验证插件.原作者<a href="http://vanadiumjs.com/" target="_blank" title="前往原作者网站">@Vanadium</a>,由<a href="http://mrthink.net/" target="_blank" title="前往Mr.Think的博客">Mr.Think</a>进行中文整理</legend>
<table>
<tr><th><label for="checkempty">请输入Mr.Think(区分大小写):</label></td><td align="left"><input id="checkempty" class=":equal;Mr.Think" /></td></tr>
<tr><th><label for="checkempty">请输入Mr.Think(不区分大小写):</label></td><td align="left"><input id="checkempty" class=":equal_ignore_case;Mr.Think" /></td></tr>
<tr><th><label for="checkempty">输入不能为空:</label></td><td><input id="checkempty" class=":required" /></td></tr>
<tr><th><label for="checkinteger">输入整数(含负):</label></td><td><input id="checkinteger" class=":integer" /></td></tr>
<tr><th><label for="checknum">输入数字:</label></td><td><input id="checknum" class=":number" /></td></tr>
<tr><th><label for="checkfloat">输入非负整数值:</label></td><td><input id="checkfloat" class=":digits :required" /></td></tr>
<tr><th><label for="checkletter">输入字母:</label></td><td><input id="checkletter" class=":alpha" /></td></tr>
<tr><th><label for="checkletterasc">请在ASC编码下输入字母:</label></td><td><input id="checkletterasc" class=":asciialpha" /></td></tr><tr><th><label for="checkletternum">请输入英文字母或正数:</label></td><td><input id="checkletternum" class=":alphanum" /></td></tr>
<tr><th><label for="checkmail">请输入邮箱:</label></td><td><input id="checkmail" class=":email :required" /></td></tr>
<tr><th><label for="checkurl">请输入网址:</label></td><td><input id="checkurl" class=":url" /></td></tr>
</tr><tr><th><label for="checkdate">请输入日期:</label></td><td><input id="checkdate" class=":date_au" /></td></tr>
</tr><tr><th><label for="checklength">请输入4个字符:</label></td><td><input id="checklength" class=":length;4" /></td></tr>
<tr><th><label for="checkminlength">最少输入4个字符:</label></td><td><input id="checkminlength"  class=":min_length;4 :required" /></td></tr>
<tr><th><label for="checkmaxlength">最多输入4个字符:</label></td><td><input id="checkmaxlength"  class=":max_length;4" /></td></tr>
<tr><th><label for="checkmaxmin">最多输入4到8个字符:</label></td><td><input id="checkmaxmin"  class=":min_length;4 :max_length;8" /></td></tr>
<tr><th><label for="checkpsw">请输入密码:</label></th><td><input id="checkpsw" class=":required" type="password" /></td></tr>
<tr><th><label for="checkpswrepeat">请再次输入密码:</label></th><td><input id="checkpswrepeat" class=":same_as;checkpsw" type="password" /></td></tr>
<tr><th><label for="checkvalue">正则匹配:</label></td><td><input id="checkvalue" class=":format;/^(Mr.Think)+$/i" /></td></tr>
<tr><th><label for="checkpass">账号验证:</label></td><td><input id="checkpass" class=":ajax;/mrthink.php" /><em>此项须连接服务器测试才有效</em></td></tr>
<tr><th><label for="checkaccept">必须接受:</label></td><td><input type="checkbox" id="checkaccept" class=":accept" /></td></tr>
<tr><th></th><td><input type="submit" value="提交表单" style="width:80px; padding:0.2em; height:30px;" /></td></tr>
</table>
</fieldset>
</form>
</body>
</html>