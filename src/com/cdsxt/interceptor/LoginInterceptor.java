package com.cdsxt.interceptor;

import com.cdsxt.po.User;
import com.cdsxt.vo.LoginUser;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Objects;

public class LoginInterceptor extends HandlerInterceptorAdapter{
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        Object obj = request.getSession().getAttribute("loginUser");
        if(Objects.isNull(obj)||!(obj instanceof LoginUser)){
            request.setAttribute("message","请登录后使用！");
            request.getRequestDispatcher("login").forward(request,response);
            return false;
        }
        return true;
    }
}
