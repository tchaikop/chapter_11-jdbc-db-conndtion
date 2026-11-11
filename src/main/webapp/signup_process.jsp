<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 DB넣기</title>
</head>
<body>
<%

	request.setCharacterEncoding("utf-8");


    String uid = request.getParameter("userID");
	String upw = request.getParameter("userPW");
	String umail = request.getParameter("userMAIL");
	
	//String sql = "insert into members(id, password, email) values('"+uid+"','"+upw+"','"+umail+"')";
	// System.out.println(sql);
	String sql = "insert into members(id, password, email) values(?,?,?)";
	

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
		// stmt=	conn.createStatement();
		// int result = stmt.executeUpdate(sql);
		
		
		pstmt.setString(1,uid);
		pstmt.setString(2,upw);
		pstmt.setString(3,umail);
		
		int result = pstmt.executeUpdate();
		
		if(result == 1){
			out.println("회원가입성공");
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			pstmt.close();
		}
		
%>






</body>
</html>