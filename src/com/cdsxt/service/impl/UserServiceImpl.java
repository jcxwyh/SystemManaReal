package com.cdsxt.service.impl;

import com.cdsxt.dao.UserDao;
import com.cdsxt.po.User;
import com.cdsxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> find() {
        return this.userDao.find();
    }
}
