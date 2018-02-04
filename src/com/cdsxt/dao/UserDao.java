package com.cdsxt.dao;

import com.cdsxt.po.User;

import java.util.List;

public interface UserDao {
    List<User> find();

    void add(User user);

    User findOne(Integer userId);

    void delete(Integer userId);

    void update(User user);
}
