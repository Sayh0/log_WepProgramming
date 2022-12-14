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

@WebServlet("/friend/list")
public class FriendServlet extends HttpServlet{
   
   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      //DB 에서 불러온 친구 목록이라고 가정하자 
      List<String> list=new ArrayList<String>();
      list.add("김구라");
      list.add("해골");
      list.add("원숭이");
      list.add("주뎅이");
      list.add("덩어리");
      // for()
      for(String variable:list) {
    	  System.out.println(variable);;
      	}

      resp.setCharacterEncoding("utf-8");
      resp.setContentType("text/html; charset-utf-8");
      PrintWriter pw = resp.getWriter();
      
	  pw.println("<doctype html>");
	  pw.println("<html>");
	  pw.println("<head>");
	  pw.println("<meta charset='utf-8'>");
	  pw.println("<title>제목입니다.</title>");
	  // bootSrtrap
	  pw.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx\" crossorigin=\"anonymous\">");
	  pw.println("</head>");
	  pw.println("<body>");
      pw.println("<div class='container'>");
      pw.println("<ul>");
      for(int i=0;i<list.size();i++) {
    	  String tmp=list.get(i);
    	  pw.println("<li class='text-info bg-dark'>"+tmp+"</li>");
      }
      pw.println("</ul>");
      pw.println("</div>");
	  pw.println("</body>");
	  pw.println("</html>");
	  pw.close();
      
      /*
       *  위의 목록을 이용해서 친구 목록을 클라이언트에게 출력해 보세요.
       *  
       *  - 아래와 같은 html 형식으로 출력해야 합니다.
       *  <ul>
       *    <li>김구라</li>
       *    <li>해골</li>
       *    .
       *    .
       *  </ul>
       *  - 반드시 반복문을 활용하세요 
       */
   }
}















