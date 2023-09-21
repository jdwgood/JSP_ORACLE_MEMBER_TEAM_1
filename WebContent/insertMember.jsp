<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 프론트앤드 웹페이지에서 파라미터로 아이디를 전달받으면 MEMBER 테이블로부터
     해당 회원 정보를 읽어와서 화면으로 출력하는 JSP 웹 프로그램을 제작해 봅니다. -->
     
<%
	request.setCharacterEncoding("utf-8");

	String memberID = request.getParameter("MEMBERID");
	String password = request.getParameter("PASSWORD");
	String name = request.getParameter("NAME");
	String email = request.getParameter("EMAIL");
%>
     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>WebContent 폴더 안에 insertmember.jsp 소스 코딩</title>
</head>
<body>

   <%
		// 1. JDBC 드라이버 로딩
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("드라이버 로딩 성공!");
		Connection conn = null;
		Statement stmt = null;
      
      try{
		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
		String dbUser = "jsporaclememberuser1";
		String dbpass = "jsporaclepw";
		System.out.println("DB 접속 성공!");
               
		// INSERT into MEMBER VALUES('lee', '1234', '이재빈', 'lee@gmail.com');
		String query = "INSERT into MEMBER VALUES('"+memberID+"', '"+password+"', '"+name+"', '"+email+"')";
                  
		// 2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, "jsporaclememberuser1", "jsporaclepw");
            
		// 3. Statement 생성
		stmt = conn.createStatement();
            
		// 4. 쿼리문 실행
		int resultInsert = stmt.executeUpdate(query);
            
		// 5. 쿼리문 실행 결과 출력
		%>
         
			<%= resultInsert %>회원이 등록 되었습니다!
         
		<%   
               
      } 
         catch(SQLException ex) {
         out.println(ex.getMessage());
         ex.printStackTrace();
      }   finally{
            // 6. 사용한 Statement 종료
    	  	if(stmt != null) try{
    	         stmt.close();
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
   
	<form action="index.jsp">
		<input type="submit" value="처음으로">
	</form>
</body>
</html>