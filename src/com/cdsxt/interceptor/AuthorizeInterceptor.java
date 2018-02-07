package com.cdsxt.interceptor;

import com.cdsxt.exception.UnauthorizedException;
import com.cdsxt.po.Resource;
import com.cdsxt.po.Role;
import com.cdsxt.po.User;
import com.cdsxt.util.Authorize;
import com.cdsxt.vo.LoginUser;
import org.springframework.core.annotation.AnnotationUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.lang.reflect.Method;
import java.util.List;
import java.util.Objects;
import java.util.Set;

/**
 * @author jcx
 * @className AuthorizeInterceptor
 * @description TODO
 */
public class AuthorizeInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(!isLogin(request,response)){
            return false;
        }
        //权限判断
        if(handler instanceof HandlerMethod){
            Method method = HandlerMethod.class.cast(handler).getMethod();
            Authorize authorize = AnnotationUtils.findAnnotation(method,Authorize.class);
            if(Objects.nonNull(authorize)){
                String authName=authorize.value();
                LoginUser loginUser = (LoginUser) request.getSession().getAttribute("loginUser");
                Set<Resource> resourceSet = loginUser.getAuths();
                if(Objects.nonNull(resourceSet)&&!resourceSet.isEmpty()){
                    for(Resource res:resourceSet){
                        if(Objects.equals(authName,res.getTarget())){
                            return true;
                        }
                    }
                    throw new UnauthorizedException("无权限");
                }
            }
        }
        return true;
    }

    public boolean isLogin(HttpServletRequest request,HttpServletResponse response){
        HttpSession session = request.getSession();
        if(Objects.isNull(session.getAttribute("loginUser"))||!(session.getAttribute("loginUser") instanceof LoginUser)){
            try {
                request.setAttribute("message","请登录后使用");
                request.getRequestDispatcher("login").forward(request,response);
                return false;
            } catch (ServletException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return true;
    }
}
