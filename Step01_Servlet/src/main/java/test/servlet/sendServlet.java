package test.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/fortune") // 앞에 슬래시 빼먹으면 서버가 시작조차 안하니 빼먹지 않도록 주의.
public class sendServlet extends HttpServlet {
	
	/*
	 *  sendServlet 객체는 언제 생성이 되는 거지? : 최초 응답을 처리하는 시점에서.(여기서는 '오늘의 운세 보기'를 최초로 누를 때.)
	 *  이후 다를 클라이언트가 또 요청을 해도 객체는 또 만들지 않고 동일한 객체로 쭉 사용한다.
	 *  우린 클래스를 정의만 해놓고 new 하지 않는다. new 는 서버가 필요한 시점에 지가 알아서 한다. 
	 *  생성이 된다면 여러개가 생성이 되는 건가? : 아니요, 하나만 생성된다.
	 */
	
	/*
	 * TomCat WebServer는 DefaultServlet을 가지고 있기 때문에,
	 * 응답용 서브렛의 역할을 한다. ex)webapp 폴더 안에 .html 파일 같은 것은 경로에 맞게 존재하기만 하면
	 * 이 서브렛이 요청경로에 받는 파일을 그대로 받아 응답해주는 역할을 한다.
	 * /images/, /css/bootstrap.css, /js/xxx.js... 뭐든지. 
	 */
	public sendServlet() {
		System.out.println("sendServlet 객체 생성 시점입니다.");
	}
	
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
		//오늘의 운세 5개를 배열로 만들어 보는 법
		String[] list = {"기대하던 일 큰 성과 보겠다.", "현실에 감사하는 마음을 가져라.", 
            "새로운 길이 열린다.", "서쪽으로 가면 귀인을 만난다.", "때를 잘 활용하라."};
		//0~4 사이의 랜덤한 정수를 얻어내기
		int ranNum1=new Random().nextInt(5);

		
		System.out.println("난수값 : "+res);
		System.out.println(fortuneMsg);
		pw.println("<doctype html>");
		pw.println("<html>");
		pw.println("<head>");
		pw.println("<meta charset='utf-8'>");
		pw.println("<title>오늘의 운세는...</title>");
		//bootstrap load.
		pw.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx\" crossorigin=\"anonymous\">\r\n");
		pw.println("</head>");
		pw.println("<body>");
		pw.println("<h1>오늘의 운세입니다</h1>");
		pw.println("<h2>"+fortuneMsg+"</h2>");
		//bootstrap adopt
	    pw.println("<p class=\"alert alert-primary\">오늘의 운세:"+list[ranNum1]+"</p>");
		pw.println("<br>");
		pw.println("<div><a href=\"/Step01_Servlet/\">인덱스로 돌아가기</a></div>");
		pw.println("</body>");
		pw.println("</html>");
		pw.flush();
		pw.close();
		
	}
}
