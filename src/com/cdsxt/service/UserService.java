package com.cdsxt.service;

import com.cdsxt.po.User;

import java.util.List;

public interface UserService {
    List<User> find();

    User findOne(Integer userId);

    void add(User user);

    void delete(Integer userId);

    void update(User user);

    void changePwd(Integer userId, String password);

    void assignRoles(Integer userId, Integer[] roleIds);

    User findByEmail(String email);

    User findByName(String uname);

    List<User> findByNameList(String uname);

    List<User> findByEmailList(String email);

    boolean valiEmail(String email);
}
