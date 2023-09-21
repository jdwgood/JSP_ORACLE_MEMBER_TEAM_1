<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>findmember.jsp 소스 코딩</title>
</head>

<body>
	<form action="findmember.jsp" method="post">
	
		<table border="1">
			<tr>
				<td>회원 아이디 </td>
				<td><input type = "text" name="MEMBERID" size="20"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type = "text" name="EMAIL" size="80"></td>
			</tr>
			<tr>
				<td> <input type="submit" value = "확인"></td>
				<td> <input type="submit" value = "취소"></td>
			</tr>
		</table>
	</form>
</body>

</html>