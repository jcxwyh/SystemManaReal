package com.cdsxt.service;

import com.cdsxt.po.User;

public interface LoginService {
    User findByName(String uname);
}
