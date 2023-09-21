<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateMemberForm.jsp</title>
</head>
<body>

	<form action="updateMember.jsp" method='post'>
		
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="MEMBERID" size="30"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="PASSWORD" size="30"></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="NAME" size="30"></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="EMAIL" size="30"></td>
			</tr>
			<tr>
				<td> <input type="submit" value="수정"> </td>
				<td> <input type="reset" value="취소"> </td>
			</tr>
		
		</table>
	
	</form>

</body>
</html>