package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune")
public class sendServlet extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("요청 전송됨");
		
		req.setCharacterEncoding("utf-8");
		
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		PrintWriter pw=resp.getWriter();
		
		Random ranNum = new Random();
		int res=ranNum.nextInt(5)+1;
		String fortuneMsg="";
		switch (res) {
        case 1: res = 1;
        		fortuneMsg="기대하던 일 큰 성과 보겠다.";
                break;
        case 2: res = 2;
        		fortuneMsg="현실에 감사하는 마음을 가져라.";
                break;
        case 3: res = 3;
				fortuneMsg="새로운 길이 열린다.";
                break;
        case 4: res = 4;
				fortuneMsg="서쪽으로 가면 귀인을 만난다.";
                break;
        case 5: res = 5;
				fortuneMsg="때를 잘 활용하라.";
		}
		
		System.out.println("난수값 : "+res);
		System.out.println(fortuneMsg);
		pw.println("<doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>오늘의 운세는...</title>");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>오늘의 운세입니다</h1>");
		pw.println("<h2>"+fortuneMsg+"</h2>");
		pw.println("<br>");
		pw.println("<div><a href=\"/Step01_Servlet/\">인덱스로 돌아가기</a></div>");
		pw.println("</body>");
		pw.println("</html>");
		pw.flush();
		pw.close();
	}
}
