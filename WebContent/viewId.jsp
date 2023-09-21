<%@page import="java.sql.SQLException"%>
<%@page import="javafx.scene.control.Alert"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("NAME");
	String email = request.getParameter("EMAIL");
	String memberId = request.getParameter("MEMBERID");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebContent 안에 아이디를 조회하는 viewId.jsp소스 코딩</title>
</head>
<body>
<%
	//1-1. JDBC 드라이버 로딩
	Class.forName("oracle.jdbc.driver.OracleDriver");
	System.out.println("드라이버 로딩 성공!");
	
	//1-2. 드라이버가 로딩 됏으면 커넥션 인터페이스 이용해서 DB접속
	Connection conn= null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		//2. 데이터베이스 커넥션 생성	
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
        conn = DriverManager.getConnection(url, "jsporaclememberuser1", "jsporaclepw");
        System.out.println("DB 접속 성공");
		
		//String query = "SELECT MEMBERID FROM MEMBER WHERE NAME = '"+name+"' AND EMAIL = " + email;
		String query = "select MEMBERID from MEMBER where NAME = ? and EMAIL= ?";
		
		//3. PrepareStatement 생성
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		
		//4.쿼리문 실행
		rs = pstmt.executeQuery();
		
		
		//5. 쿼리문 실행 결과 출력
		if(rs.next()){
			%>
			
			<table border="1">
			<tr>
				<td>가입된 아이디</td>
				<td><%= rs.getString("MEMBERID") %></td>
			</tr>
			</table>
			<%}else{
			%>
				<%= name %>으로 가입된 아이디가 없습니다!
			<%
		}
		
	}catch(SQLException ex){
		out.println(ex.getMessage());
		ex.printStackTrace();
	}finally{
	      // 6. 사용한 Statement 종료
	      if(rs != null) try{
	         rs.close();
	      } catch(SQLException ex){
	         ex.printStackTrace();
	      }
	      
	      if(pstmt != null) try{
	         pstmt.close();
	      } catch(SQLException ex){
	         ex.printStackTrace();
	      }
	      
	      // 7. 커넥션 종료
	      if(conn != null) try{
	         conn.close();
	      } catch(SQLException ex){
	         ex.printStackTrace();
	      }
	   }

%>
	<form action="index.jsp" method="post">
		<input type="submit" value="처음으로">
	</form>
</body>
</html>