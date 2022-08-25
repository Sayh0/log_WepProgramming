package test.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

@WebFilter("/*") //어떤 요청에 대해 필터링을 할 것인지 우리가 정할 수 있다.
// "/*" 는 이 프로젝트에 오는 모든 요청에 대해 필터링을 하겠다는 의미이다.
// 다시말해 /Step04_Final/ 하위의 모든 요청을 말한다.
public class EncodingFilter implements Filter{

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}
	/*
	 *  request 에 들어오는 참조값은 원래 HttpServletRequest 객체의 참조값이다.
	 *  response에 들어오는 참조값은 원래 HttpServletResponse 객체의 참조값이다.
	 *  필요하다면, 자식타입으로 캐스팅이 가능하다. 
	 */

	@Override //httpServleRequest 의 부모타입이다. 왜 이걸로 오는진 모르겠지만 부모타입으로 들어온다.
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		//1. 만일 인코딩 설정이 되지 않았다면
		if(request.getCharacterEncoding()==null) {
			//post 방식으로 전송했을 때 한글 꺠짐 방지. 필터에서 일괄적으로 처리하도록 만든 코드.
			request.setCharacterEncoding("utf-8");
		}
		//2. 요청의 흐름 이어가기
		//chain은 관여할 게 없으면 그냥 통과 이런 느낌.
		chain.doFilter(request, response);
		
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
