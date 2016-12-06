package com.game.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.game.member.MemberDTO;

public class MemberCheck extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO)session.getAttribute("member");
		if(mDto != null){
			return true;			
		}else{
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;
		}
	}
	
}
