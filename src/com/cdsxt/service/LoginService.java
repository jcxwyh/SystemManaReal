package com.cdsxt.service;

import com.cdsxt.po.User;
import com.cdsxt.vo.LoginUser;

public interface LoginService {
    User findByName(String uname);

    LoginUser findAllInfo(Integer userId);
}
