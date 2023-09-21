<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	<!-- 1단계 : 회원 가입 -->
	<form action="insertMemberForm.jsp">
		<input type="submit" value="회원 가입" /> <br> <br>
	</form>
	<!-- 2단계 : 아이디 찾기 -->
	<form action="viewIdForm.jsp">
		<input type="submit" value="아이디 찾기" /> <br> <br>
	</form>
	<!-- 3단계 : 비밀번호 삭제 -->
	<form action="findmemberForm.jsp">
		<input type="submit" value="비밀번호 찾기" /> <br> <br>
	</form>
	<!-- 4단계 : 회원 정보 수정 -->
	<form action="updateMemberForm.jsp">
		<input type="submit" value="회원 정보 수정" /> <br> <br>
	</form>
	<!-- 5단계 : 계정 삭제 -->
	<form action="deleteMemberForm.jsp">
		<input type="submit" value="계정 삭제" /> <br> <br>
	</form>


</body>
</html>