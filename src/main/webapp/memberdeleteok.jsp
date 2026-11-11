<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴 처리 페이지</title>
</head>
<body>
<%


     String uid = request.getParameter("deleteID");

     String sql = "delete from members where id =?";


	String driverName = "com.mysql.jdbc.Driver";
	
	
	String url = "jdbc:mysql://localhost:3306/shopdb2";
	
	
	String username = "root";
	String password = "12345";
	
	Connection conn=null;
	
	PreparedStatement pstmt = null;
	
	
	try{
		Class.forName(driverName);
		conn = DriverManager.getConnection(url,username,password);
		
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,uid);
	
	int result = pstmt.executeUpdate();
	
	if(result == 1){
		out.println("회원탈퇴성공");
	}
	}catch(Exception e) {
		out.println("회원탈퇴실패");
		e.printStackTrace();
	}
	finally {
		if(pstmt != null) pstmt.close();
		if(conn != null) conn.close();
	}




%>

<a href="memberlist.jsp">회원 전체 목록</a>
</body>
</html>