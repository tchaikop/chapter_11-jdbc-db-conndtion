<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연결</title>
</head>
<body>

<%
	// DB연결을 위한 변수 4개 선언
	
	// 드라이버 이름->정해진 것
	String driverName = "com.mysql.jdbc.Driver";
	
	// mysql이 설치 되어 있는 db의 주소
	String url = "jdbc:mysql://localhost:3306/shopdb2";
	
	//mysql사용자 계정
	String username = "root";
	String password = "12345";
	
	Connection conn = null;
	
	try{
	
	Class.forName(driverName);  	// mysql에 jdbc 드라이버를 로딩
	conn = DriverManager.getConnection(url,username,password); //데이터베이스 연결
	
	
	System.out.println("연결성공");
	System.out.println(conn);
	
	} catch(Exception e){
		System.out.println("실패");
	}finally {
		
		if(conn != null){
			conn.close();
		}
	}




%> 



</body>
</html>