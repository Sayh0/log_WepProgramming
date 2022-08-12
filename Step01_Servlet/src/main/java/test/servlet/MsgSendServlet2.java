package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/send2")
public class MsgSendServlet2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    req.setCharacterEncoding("utf-8"); //post 방식 시에는 한글 깨짐 방지
		String msg = req.getParameter("msg"); 

	    
	    System.out.println(msg);

		resp.setCharacterEncoding("utf-8"); //한글 응답 인코딩 설정
		resp.setContentType("text/html; charset-utf-8"); //응답 컨텐츠 설정
		PrintWriter pw = resp.getWriter(); //요청한 클라이언트에게 문자열을 응답할 객체
		
		pw.println("<doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>제목입니다.</title>");
		pw.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx\" crossorigin=\"anonymous\">");
		pw.println("</head>");
		pw.println("<body>");
			pw.println("<div class='container'>");
				pw.println("<p>"+msg+"</p>");
				pw.println("<p>(이)라는 메세지 잘 받았어 클라이언트야!</p>");
			pw.println("</div>");
		pw.println("</body>");
		pw.println("</html>");
		pw.close();
	}
}
