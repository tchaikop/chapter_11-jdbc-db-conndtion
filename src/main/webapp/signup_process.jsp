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
	
	// 드라이버 이름->정해진 것
		String driverName = "com.mysql.jdbc.Driver";
		
		// mysql이 설치 되어 있는 db의 주소
		String url = "jdbc:mysql://localhost:3306/shopdb2";
		
		//mysql사용자 계정
		String username = "root";
		String password = "12345";
		
		Connection conn=null;
		// Statement stmt = null;
		PreparedStatement pstmt = null;
		
		
		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url,username,password);
			
		// stmt=	conn.createStatement();
		// int result = stmt.executeUpdate(sql);
		
		pstmt = conn.prepareStatement(sql);
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