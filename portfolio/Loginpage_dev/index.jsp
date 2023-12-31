<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
  <HEAD>
    <META charset="UTF-8">
  </HEAD>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.io.*" %>
<%
    // null로 초기화 한다.
    Connection conn = null;
    try{
        // 사용하려는 데이터베이스명을 포함한 URL 기술
        String url = "jdbc:mysql://localhost:3306/madang";
        String id = "root";       // 사용자계정
        String pw = "@phillip0724";   // 사용자계정의 패스워드
        // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
        Class.forName("com.mysql.jdbc.Driver");
        // DriverManager 객체로부터 Connection 객체를 얻어온다.
        conn=DriverManager.getConnection(url,id,pw);
        // 커넥션이 제대로 연결되면 수행된다.
        out.println("제대로 연결되었습니다.");
        // insert 수행
        String inputStr = request.getParameter("inputtext");
        PreparedStatement pstmt = null;
        pstmt = conn.prepareStatement("INSERT INTO chatting VALUES ( 0, ? ,now() );");
        pstmt.setString(1, inputStr);
        pstmt.executeUpdate();
    // 예외가 발생하면 예외 상황을 처리한다.
    }catch(Exception e){
       ByteArrayOutputStream bs = new ByteArrayOutputStream();
       PrintStream printStream = new PrintStream(bs);
       e.printStackTrace(printStream);
       String traceStr = bs.toString();
       out.println("에러 " + traceStr);
    }
%>
</html>