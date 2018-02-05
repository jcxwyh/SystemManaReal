package com.cdsxt.service.impl;

import com.cdsxt.dao.UserDao;
import com.cdsxt.po.User;
import com.cdsxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> find() {
        return this.userDao.find();
    }

    @Override
    public User findOne(Integer userId) {
        return this.userDao.findOne(userId);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void add(User user) {
        this.userDao.add(user);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void delete(Integer userId) {
        this.userDao.delete(userId);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void update(User user) {
        this.userDao.update(user);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void changePwd(Integer userId, String password) {
        this.userDao.changePwd(userId,password);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void assignRoles(Integer userId, ArrayList<Integer> roleIds) {
        this.userDao.assignRoles(userId,roleIds);
    }
}
