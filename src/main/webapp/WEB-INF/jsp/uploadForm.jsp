<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Upload File</title>
</head>
<body>

	<center style="margin-top: 150px;">
		<h1>Upload File To Google Drive Using Google Drive API - Spring Boot + JSP</h1>
		<br/><br/>
	 	<div>
			<form method="POST" enctype="multipart/form-data" action="uploadFileDrive">
				<table>
					<tr><td>File to upload:</td><td><input type="file" name="file" /></td></tr>
					<tr><td></td><td><input type="submit" value="Upload" /></td></tr>
				</table>
			</form>
		</div>
				
		
		<a href="${linkTai}">${linkTai}</a>
	 </center>
</body>
</html>