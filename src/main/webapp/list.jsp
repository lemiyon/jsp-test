<%@page import="com.cdg.study.entity.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Hello, Bola!</title>
</head>
<body>
	<table border="1">
	
	<!-- 검색 -->
	<tr>
		<td colspan='5'>
		<form action="search" method="get">
		<!-- select 이므로 get~ -->
			<select name="searchName">
			  <option value="title">제목</option>
			  <option value="author">작성자</option>
			</select>
			<input type="text" name="searchValue">
			<input type="submit" value="검색">
		</form>
		</td>
		
	</tr>
	
		<tr>
			<th>글번호</th>
			<th>작성자</th>
			<th>제목</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>

		<%
		//json에서 저장된 리스트를 불러온다.
		ArrayList<BoardDTO> list = (ArrayList<BoardDTO>) request.getAttribute("list");
		int num = 0;
		String author = "";
		String title = "아직 글이 작성되지 않았어요! 첫 글을 작성해 주세요 >_< ";
		String writeday = "";
		int readcnt = 0;
		
		if(list == null) {
		 title = "it's null!";
		}
		//불러온 리스트가 null, 비어있으면 글을 작성해달라고 요청한다.
		if(list != null || !list.isEmpty())
		{
		for (BoardDTO dto : list) {
				num = dto.getNum();
				author = dto.getAuthor();
				title = dto.getTitle();
				writeday = dto.getWriteday();
				readcnt = dto.getReadcnt();
		
		%>
		<tr>
		<!-- 위에 보면, java코드 부분이 나뉘어 있는 것을 볼 수 있다. 일반 html코드가 java코드에서 사용되는 
		변수를 쓰고 싶을 시, 그 변수가 존재하는 범위 내에서 사용해야 한다. 그래서 if문의 } 가 이상하게
		분리되어 보이는 것! -->
			<td><%=num%></td>
			<td><%=author%></td>
			<td><a href="retrieve?num=<%=num%>"><%=title%></a></td>
			<!-- URL이 이미 /controller/list 로 되어있기 때문에 retrieve만 줘도 됨 -->
			<td><%=writeday%></td>
			<td><%=readcnt%></td>
		</tr>

	<%}} %>
	</table>
	
	<!-- 글쓰기 버튼 -->
	<a href="writeui">글쓰기</a>
</body>
</html>