package com.cdsxt.web.advice;

import com.cdsxt.exception.UnauthorizedException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class GlobalExceptionAdvice {
    @ExceptionHandler(UnauthorizedException.class)
    public ModelAndView unAuth(UnauthorizedException exception,ModelAndView modelAndView){
        modelAndView.setViewName("error/unauthorized");
        return modelAndView;
    }
}
