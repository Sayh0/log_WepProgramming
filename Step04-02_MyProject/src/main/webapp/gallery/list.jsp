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
	  min-width: 500px;
	  text-align: center;
	}
	td {
	  padding: 20px 4%;
	}
</style>
</head>
<body>
<jsp:include page="/WEB-INF/include/navbar.jsp"></jsp:include>

<!-- Vue test 1 start -->
    <div class="container" id="app">
        <div class="row">
            <figure-component 
                v-for="(item, index) in imageList"
                v-bind:imageinfo="item"
                v-bind:key="index"></figure-component>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
    <script>
        Vue.component("figure-component",{
            template:`
            <div class="col">
                <figure class="figure">
                    <img v-bind:src="imageinfo.src" class="figure-img img-fluid rounded">
                    <figcaption class="figure-caption">{{imageinfo.caption}}</figcaption>
                </figure>
            </div>
            `,
            props:["imageinfo"]
        });

        let app=new Vue({
            el:"#app",
            data(){
                return {
                    imageList:[
                    	//로딩할 이미지의 경로, 캡션
                        {src:"https://user-images.githubusercontent.com/96712990/186359419-77bd7730-60ab-4dc5-8030-09c110ff26a9.png"},
                        {src:"https://user-images.githubusercontent.com/96712990/186359419-77bd7730-60ab-4dc5-8030-09c110ff26a9.png"},
                        {src:"https://user-images.githubusercontent.com/96712990/186359419-77bd7730-60ab-4dc5-8030-09c110ff26a9.png"}
                    ]
                };
            }
        });
    </script>
<!-- Vue test 1 end -->




<!-- Vue test 2 start-->
<div id="app">
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>작성자</th>
				<th>제목</th>
			</tr>
		</thead>
		<tbody>
			<tr v-for="tmp in list" v-bind:key="tmp.num">
				<td>{{tmp.num}}</td>
				<td>{{tmp.writer}}</td>
				<td>{{tmp.title}}</td>
			</tr>
		</tbody>
	</table>
</div>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script>
	new Vue({
		el:"#app",
		data:{
			list:[]
		},
		created(){
			// Vue 가 준비가 되었을때 (root component 가 준비 되었을때) 최조 한번 호출된다.
			// 자바의 생성자 느낌이다. 최초 한번 호출됨.
			console.log("created!");
			//Vue 의 참조값을 self 에 담기 
			const self=this;
			
			fetch("/Step04-02_MyProject/gallery/json_list.jsp")
			.then(function(response){
				return response.json();
			})
			.then(function(data){
				console.log(data);
				//서버로 부터 받은 데이터를 list 에 대입하기 
				self.list=data;
			});
		},
		methods:{
			
		}
	});
</script>
<!-- Vue test 2 end-->




<!-- JSP code -->
<!-- 
		<div class="container">
			<table class="grid">
				<tbody>
			<%for(GalleryDto tmp:list){ %>
				<tr>
					<td>
						<table>
							<tr>
								<td>
								</td>
							</tr>
						</table>
					<img src="https://user-images.githubusercontent.com/96712990/186359419-77bd7730-60ab-4dc5-8030-09c110ff26a9.png" alt="" />
					<%=tmp.getNum() %>
					</td>					
					<td>
					<img src="https://user-images.githubusercontent.com/96712990/186359419-77bd7730-60ab-4dc5-8030-09c110ff26a9.png" alt="" />					
					<%=tmp.getWriter() %>
					</td>
					<td>
					<img src="https://user-images.githubusercontent.com/96712990/186359419-77bd7730-60ab-4dc5-8030-09c110ff26a9.png" alt="" />					
					<%=tmp.getTitle()%>
					</td>
				</tr>
			<%} %>
			</tbody>
			</table>
		</div>
-->
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
		<a href="${pageContext.request.contextPath }/gallery/private/upload_form.jsp">업로드</a>
		
	</div>
</body>
</html>
