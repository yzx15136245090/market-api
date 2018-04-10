package com.zzti.market.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.Map;

/**
 * @Title:
 * @Package: com.zzti.market.interceptor
 * @ClassName: LoginInterceptor
 * @Description:
 * @Author: zhixiang.yang
 * @CreateDate: 2018/4/10 10:59
 * @UpdateUser: zhixiang.yang
 * @UpdateDate: 2018/4/10 10:59
 * @UpdateRemark:
 * @Version: 1.0
 */
public class LoginInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
       String requestUrl=request.getRequestURI();
        HttpSession session=request.getSession();
        Map userMap=(Map)session.getAttribute("userMap");
        if(userMap==null){
            System.out.println("no user login");
            PrintWriter out = response.getWriter();
            out.print("-1");
            return  false;
        }
        String token=userMap.get("token").toString();
        if("".equals(request.getParameter("token"))||request.getParameter("token")==null) {
            System.out.println("please login");
            PrintWriter out = response.getWriter();
            out.print("-1");
            return false;
        }else if(token.equals(request.getParameter("token"))){
            return true;
        }
        return  true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
System.out.println("postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
System.out.println("afterCompletion");
    }
}
