package com.game.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.game.member.MemberDTO;

public class AdminCheck implements HandlerInterceptor {

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		MemberDTO mDto = (MemberDTO)session.getAttribute("member");
		if(mDto != null){	
			if(mDto.getM_kind() == 2){
				return true;			
			}else{
				response.sendRedirect(request.getContextPath()+"/index");
				return false;
			}
		}else{
			response.sendRedirect(request.getContextPath()+"/member/login");
			return false;			
		}
	}

}
