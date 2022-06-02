<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%--
작업순서
	1. t_board 테이블에서 전체게시글 조회
	2. 조회된 게시물을 하나씩 웹브라우저에 출력
 --%>

<%
	Connection conn = new ConnectionFactory().getConnection();
	StringBuilder sql = new StringBuilder();
	sql.append("select no, title, writer, to_char(reg_date,'yyyy-mm-dd') as reg_date ");
	sql.append(" from t_board ");
	sql.append(" order by no desc ");
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	ResultSet rs = pstmt.executeQuery();
%>





<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/Mission-web/resource/lib/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function(){
		$('#add').click(function(){
				location.href = 'writeForm.jsp'
			
		})
		
	})

</script>
</head>
<body>
<%--
	url : http://localhost:9999/Mission-web/jsp/board/list.jsp
 --%>
 	<div align="center">
 		<hr>
 		<h1>전체 게시글 조회</h1>
		<hr>
		<br>
		<table border="1" style="width:80%">
			<tr>
				<th width="7%">번호</th>
				<th>제목</th>
				<th width="16%">작성자</th>
				<th width="20%">등록일</th>
			</tr>
			<tr>
			<%
				while(rs.next()){
					int no = rs.getInt("no");
					String title = rs.getString("title");
					String writer = rs.getString("writer");
					String reg_date = rs.getString("reg_date");
			%>		
				<tr>
					<th><%= no %></th>
					<th><%= title %></th>
					<th><%= writer %></th>
					<th><%= reg_date %></th>
				</tr>
			<% 	
				}
			%>
			</tr>
		</table><br>
		<button id="add">글쓰기</button>
 	</div>
 	

</body>
</html>


<% 
	JDBCClose.close(pstmt, conn);

%>