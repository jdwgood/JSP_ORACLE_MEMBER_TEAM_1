<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 프론트앤드 웹페이지에서 파라미터로 아이디를 전달받으면 MEMBER 테이블로부터
          해당 회원 정보를 읽어와서 화면으로 출력하는 JSP 웹 프로그램을 제작해 봅니다. -->
<%
	request.setCharacterEncoding("utf-8");

	String memberId = request.getParameter("MEMBERID");
	String password = request.getParameter("PASSWORD");
	String name = request.getParameter("NAME");
	String email = request.getParameter("EMAIL");
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateMember.jsp</title>
</head>
<body>

	<%
		// 1. JDBC 드라이버 로딩
		// MySQL DB 8아래 버전은 com.mysql.jdbc.Driver을 사용했지만,
		// MySQL DB 8이상 버전은 com.mysql.cj.jdbc.Driver 로 사용합니다.
		Class.forName("oracle.jdbc.OracleDriver");
		System.out.println("드라이버 로딩 성공");
		Connection conn = null;
		Statement stmt = null;
		
      try{
             String url = "jdbc:oracle:thin:@localhost:1521:orcl";
             
             System.out.println("DB 접속 성공");
             
          // update MEMBER set NAME = '2', EMAIL = '2' WHERE MEMBERID = '1' AND PASSWORD = '1';
             String query = "update MEMBER set NAME = '"+name+"', EMAIL = '"+email+"' WHERE MEMBERID = '"+memberId+"' AND PASSWORD = '"+password+"'";
                
             
          // 2. 데이터베이스 커넥션 생성
             conn = DriverManager.getConnection(url, "jsporaclememberuser1", "jsporaclepw");
          // 3. Statement 생성
          stmt = conn.createStatement();
          
          // 4. 쿼리문 실행
          int resultUpdate = stmt.executeUpdate(query);
          
          // 5. 쿼리문 실행 결과 출력
       %>
       
        	<% if(resultUpdate == 0) {
				%>
			아이디 혹은 비밀번호가 틀립니다. <br>
				<%
			}else{
				%>
			<%= resultUpdate %>건의 데이터가 수정되었습니다. <br>
				<%
			}
			%>
       	
       <%   
        
      } catch(SQLException ex){
			out.println(ex.getMessage());
			ex.printStackTrace();
		} finally{
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