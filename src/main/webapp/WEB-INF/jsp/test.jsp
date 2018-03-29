<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="static/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript" src="static/ckeditor/ckeditor.js"></script>
</head>
<body>
		<textarea rows="" cols="" id="ck1"></textarea>
<input type='submit' value='submit' id="ckeck"/>
<div id="t">
	
</div>

<script type="text/javascript">
	CKEDITOR.replace('ck1');
	$(document).ready(function(){
		$("#ckeck").click(function(){			
			$("#t").html("<p><span>Bơ n&aacute;ch th&uacute;i</span></p>");
			CKEDITOR.instances.ck1.setData("<p><span>Bơ n&aacute;ch th&uacute;i</span></p>");
		})
	})
</script>
</body>
</html>