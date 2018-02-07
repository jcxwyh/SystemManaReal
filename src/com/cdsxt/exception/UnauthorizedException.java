package com.cdsxt.exception;

/**
 * 无权限异常
 * @author jcx
 * @className UnauthorizedException
 * @description TODO
 */
public class UnauthorizedException extends RuntimeException{
    public UnauthorizedException() {
    }

    public UnauthorizedException(String message) {
        super(message);
    }
}
