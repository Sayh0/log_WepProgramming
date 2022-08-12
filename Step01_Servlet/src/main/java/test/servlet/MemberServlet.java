package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import test.dto.MemberDto;

@WebServlet("/member/list")
public class MemberServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//DB 에서 불러온 회원 목록이라고 가정하자
	      List<MemberDto> list=new ArrayList<>();
	      list.add(new MemberDto(1, "김구라", "노량진"));
	      list.add(new MemberDto(2, "해골", "행신동"));
	      list.add(new MemberDto(3, "원숭이", "상도동"));
	      /*
	       * 회원 목록을 table 형식으로 클라이언트에게 응답해보기
	       */
	resp.setCharacterEncoding("utf-8"); //한글 응답 인코딩 설정
	resp.setContentType("text/html; charset-utf-8"); //응답 컨텐츠 설정
	PrintWriter pw = resp.getWriter(); //요청한 클라이언트에게 문자열을 응답할 객체

	pw.println("<doctype html>");
	pw.println("<html>");
	pw.println("<head>");
	pw.println("<meta charset='utf-8'>");
	pw.println("<title>제목입니다.</title>");
	pw.println("</head>");
	pw.println("<body>");
		pw.println("<div class='container'>");
			pw.println("<ul>");
				pw.println("<li>");
					pw.println("<table>");
						pw.println("<thead>");
							pw.println("<tr>");
								pw.println("<th>번호</th>");
								pw.println("<th>이름</th>");
								pw.println("<th>주소</th>");
							pw.println("</tr>");
						pw.println("</thead>");
						pw.println("<tbody>");
						for(MemberDto dto:list) {
							pw.println("<tr>");
								pw.println("<td>"+dto.getNum()+"</td>");
								pw.println("<td>"+dto.getName()+"</td>");
								pw.println("<td>"+dto.getAddr()+"</td>");
							pw.println("</tr>");	
						}
						pw.println("</tbody>");
						pw.println("</table>");
				pw.println("</li>");
			pw.println("</ul>");
		pw.println("</div>");
	pw.println("</body>");
	pw.println("</html>");
	pw.close();      
	}
}
