<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.MemberDto"%>
<%@page import="java.sql.*"%>
<%@taglib prefix="c" uri="jakarta.tags.core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모든 가입회원 리스트</title>
</head>
<body>
<h2>전체 회원 리스트</h2>
<hr>
<%

String sql = "SELECT * FROM members";



		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/shopdb2";
		String username = "root";
		String password = "12345";
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		
		
		try{
			Class.forName(driverName);
			conn = DriverManager.getConnection(url,username,password);
			pstmt = conn.prepareStatement(sql);	
    	    rs =  pstmt.executeQuery();
    	    
	    
	     List<MemberDto> memberlist = new ArrayList<MemberDto>();
	     
	     while(rs.next()){

	    	 String userid = rs.getString("id");
	    	 String userpw = rs.getString("password");
	    	 String useremail = rs.getString("email");
	    	 String userdate = rs.getString("signuptime");
	    	 
	    	 MemberDto memberDto = new MemberDto(userid,userpw,useremail,userdate);
	    	 
	    	 memberlist.add(memberDto);
	    	 
	    	 request.setAttribute("memberlist",memberlist);
	    	 
	    	 
	    	 
	     }
	
		}catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			if(rs != null){
				rs.close();
			}
			if(pstmt != null){
			pstmt.close();
		}
		
		}


%>

<table border="1">

  <thead>
  	<tr>
  		<th>아이디</th>
  		<th>비밀번호</th>
  		<th>이메일</th>
  		<th>가입일</th>
  	
  	  	</tr>
  </thead>
  	 
  <tbody>
  <c:forEach var="mdto" items="${memberlist }">
  
  	<tr>
  		<td>${mdto.id }</td>
  		<td>${mdto.password }</td>
  		<td>${mdto.email }</td>
  		<td>${mdto.signuptime }</td>
  </tr>
  </c:forEach>
 </tbody>
  
  
  
 </table>
</body>
</html>