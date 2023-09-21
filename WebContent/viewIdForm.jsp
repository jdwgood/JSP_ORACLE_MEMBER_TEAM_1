<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebConten안에 viewIdForm.jsp소스코딩</title>
</head>
<body>
	<form action="viewId.jsp" method="post">
		<table border="1">
			<tr>
				<td>가입했던 계정의 이름을 입력하세요</td>
				<td> <input type="text" name="NAME" size="20"></td>
			</tr>
			<tr>
				<td>가입했던 계정의 이메일을 입력하세요</td>
				<td> <input type="text" name="EMAIL" size="20"></td>
			</tr>
			<tr>
				<td colspan="2"> <input type="submit" value="조회"></td>
			</tr>
		</table>
	
	</form>
</body>
</html>