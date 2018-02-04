package com.cdsxt.service.impl;

import com.cdsxt.dao.LoginDao;
import com.cdsxt.po.User;
import com.cdsxt.service.LoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDao loginDao;

    @Override
    public User findByName(String uname) {
        return this.loginDao.findByName(uname);
    }
}
