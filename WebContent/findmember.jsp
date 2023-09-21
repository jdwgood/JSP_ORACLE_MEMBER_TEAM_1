<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="jdk.internal.org.objectweb.asm.tree.TryCatchBlockNode"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");
	String memberID = request.getParameter("MEMBERID");
	String email = request.getParameter("EMAIL");
	String password = request.getParameter("PASSWORD");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>find</title>
</head>
<body>

   <%

	Class.forName("oracle.jdbc.OracleDriver");
	System.out.println("드라이버 로딩 성공!");
	Connection conn = null;
	Statement stmt = null;
	   
      try{
  		String jdbcDriver = "jdbc:oracle:thin:@localhost:1521:orcl";
  		String dbUser = "jsporaclememberuser1";
  		String dbpass = "jsporaclepw";
  		System.out.println("DB 접속 성공!");
         

  		String query = "SELECT PASSWORD FROM MEMBER WHERE MEMBERID = '"+memberID+"' AND EMAIL = '"+email+"'";
         
         // 2. 데이터베이스 커넥션 생성
         conn = DriverManager.getConnection(jdbcDriver, "jsporaclememberuser1", "jsporaclepw");
         
         // 3. preparedStatement 생성
         stmt = conn.createStatement();
         // 4. 쿼리문 실행
         int resultfind = stmt.executeUpdate(query);
         
         // 5. 쿼리문 실행 결과 출력
         %>
         
     	<% if(resultfind == 0) {
				%>
			이름 혹은 이메일이 틀립니다. <br>
				<%
			}else{
				%>
			 당신의 비밀번호는   <%= resultfind   %> 입니다<br>
				<%
			}
			%>
    	
    <%   
     
         
      } catch(SQLException ex){
         out.println(ex.getMessage());
         ex.printStackTrace();
      }finally{
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