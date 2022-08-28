<%@page import="java.util.List"%>
<%@page import="test.gallery.GalleryDto"%>
<%@page import="test.gallery.GalleryDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 페이징 기능 자바 코드 -->
<%
	//한 페이지에 몇개씩 표시할 것인지
	final int PAGE_ROW_COUNT=10;
	//하단 페이지를 몇개씩 표시할 것인지
	final int PAGE_DISPLAY_COUNT=5;
	
	//보여줄 페이지의 번호를 일단 1이라고 초기값 지정
	int pageNum=1;
	//페이지 번호가 파라미터로 전달되는지 읽어와 본다.
	String strPageNum=request.getParameter("pageNum");
	//만일 페이지 번호가 파라미터로 넘어 온다면
	if(strPageNum != null){
		//숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
		pageNum=Integer.parseInt(strPageNum);
	}
	
	//보여줄 페이지의 시작 ROWNUM
	int startRowNum=1+(pageNum-1)*PAGE_ROW_COUNT;
	//보여줄 페이지의 끝 ROWNUM
	int endRowNum=pageNum*PAGE_ROW_COUNT;
	
	//하단 시작 페이지 번호 
	int startPageNum = 1 + ((pageNum-1)/PAGE_DISPLAY_COUNT)*PAGE_DISPLAY_COUNT;
	//하단 끝 페이지 번호
	int endPageNum=startPageNum+PAGE_DISPLAY_COUNT-1;
	//전체 글의 갯수
	int totalRow=GalleryDao.getInstance().getCount();
	
	
	//전체 페이지의 갯수 구하기
	int totalPageCount=(int)Math.ceil(totalRow/(double)PAGE_ROW_COUNT);
	//끝 페이지 번호가 이미 전체 페이지 갯수보다 크게 계산되었다면 잘못된 값이다.
	if(endPageNum > totalPageCount){
		endPageNum=totalPageCount; //보정해 준다. 
	}
%>

<!-- 데이터 요청 자바 코드 -->
<%
	//1. 파일 목록을 얻어와서
	//GalleryDto 객체를 생성해서 
	GalleryDto dto=new GalleryDto();
	//위에서 계산된 startRowNum , endRowNum 을 담아서 
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	//파일 목록을 select 해 온다. 
	List<GalleryDto> list=GalleryDao.getInstance().getList(dto);
	
	
	//2. 응답하기
	
	//세션 영역의 id 를 읽어와 본다.
	String id=(String)session.getAttribute("id");
	
	//이미지 출력을 위한 파일네임 읽어오기
	String orgfilename=list.get(0).getOrgFileName();
%>    


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>gallery_by_vue</title>
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<!-- Bootstrap -->
<!-- font -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');
body { font-family: 'Noto Sans KR', sans-serif; }
</style>
<!-- font -->
<style>

	div {
	  overflow-x: auto;
	}
	table {
	  width: 100%;
	  table-layout:fixed;
	  text-align: center;
	}
      td:first-child {
        width: 100px;
      }
</style>

</head>
<body>
<jsp:include page="/WEB-INF/include/navbar.jsp"></jsp:include>

<h1>갤러리입니다.</h1>
<!-- JSP code -->

		<div class="container">
			<table class="table">
				 <thead>
					  <tr>
					    <th scope="col">Preview image</th>
					    <th scope="col">		
					    <a href="${pageContext.request.contextPath }/gallery/private/upload_form.jsp">새 업로드</a>
						</th>
					  </tr>
				</thead>
				<tbody>
			<%for(GalleryDto tmp:list){ %>
				<tr>
					<td class="img">
						<img src="${pageContext.request.contextPath }/upload/<%=tmp.getOrgFileName()%>" style="width: 10vw; min-width: 100px;"/>
					</td>
					<td>
						<table>
						<tr>
							<th>제목</th>
							<th><%=tmp.getTitle() %></th>
						</tr>
						<tr>
							<th>번호</th>
							<th><%=tmp.getNum() %></th>
						</tr>
						<tr>
							<th>작성자</th>
							<th><%=tmp.getWriter() %></th>
						</tr>
						<tr>
							<th>작성일</th>
							<th><%=tmp.getRegdate() %></th>			
						</tr>
						<tr>
							<th><a href="download.jsp?num=<%=tmp.getNum()%>">다운로드</th>
							<th>						
							<%if(tmp.getWriter().equals(id)){ %>
							<a href="delete.jsp?num=<%=tmp.getNum()%>">삭제</a>
							<%} %>
							</th>
						</tr>
						</table>
					</td>				
				</tr>
			<%} %>
			</tbody>
			</table>
		</div>

<!-- JSP code -->


		<!-- paging -->
		<nav>
			<ul class="pagination">
				<%--
					startPageNum이 1 이 아닌 경우에만 Prev 링크를 표시한다.
				 --%>
				<%if(startPageNum != 1){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=startPageNum-1 %>">Prev</a>
					</li>
				<%} %>
			
				<%for(int i=startPageNum; i<=endPageNum; i++){ %>
					<%if(pageNum == i){ %>
						<li class="page-item active">
							<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
						</li>
					<%}else{ %>
						<li class="page-item">
							<a class="page-link" href="list.jsp?pageNum=<%=i %>"><%=i %></a>
						</li>
					<%} %>
				<%} %>	
				<%--
					마지막 페이지 번호가 전체 페이지의 개수보다 작을 때먄 Next 링크를 제공한다.
				 --%>
				<%if(endPageNum < totalPageCount){ %>
					<li class="page-item">
						<a class="page-link" href="list.jsp?pageNum=<%=endPageNum+1 %>">Next</a>
					</li>
				<%} %>
				
			</ul>
		</nav>
		<!-- paging -->
		
</body>
</html>
