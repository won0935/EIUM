package com.myspring.eium.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class interceptor extends HandlerInterceptorAdapter{



	  @Override
	    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	            throws Exception {

	        HttpSession session = request.getSession();

	        Object obj = session.getAttribute("login");
			String requestUrl=request.getRequestURL().toString();
			
			if(requestUrl.contains("/login.do")){
				return true;
				}
			if(requestUrl.contains("/LoginCheck.do")) {
				return true;
			}
			if(requestUrl.contains("/findIdNPwd.do")) {
				return true;
			}

	
	        if ( obj == null && requestUrl.contains("/main.do")){
	        	response.sendRedirect("/EIUM/login.do");
	            return false;
	        }
	        if(obj == null) {
	        	PrintWriter out = response.getWriter();

	        	out.println("<script>	if(window.opener){\r\n" + 
	        			"		if(window.opener.closed){\r\n" + 
	        			"			top.location.href=\"/EIUM/login.do\";\r\n" + 
	        			"		}else{\r\n" + 
	        			"			window.opener.top.location.href=\"/EIUM/login.do\";\r\n" + 
	        			"			self.close();\r\n" + 
	        			"		}\r\n" + 
	        			"	}else{\r\n" + 
	        			"		top.location.href=\"/EIUM/login.do\";\r\n" + 
	        			"	}</script>");
	        	
	        	return false;
	        }


	        return super.preHandle(request, response, handler);
	    }

	 
	    @Override
	    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
	            ModelAndView modelAndView) throws Exception {
	    	if("HTTP/1.1".equals(request.getProtocol())) {
	    		response.setHeader ("Cache-Control", "no-cache, no-store, must-revalidate");
	    	} else {
	    		response.setHeader ("Pragma", "no-cache");
	    	}
	    	response.setDateHeader ("Expires", 0);
	    }


}
