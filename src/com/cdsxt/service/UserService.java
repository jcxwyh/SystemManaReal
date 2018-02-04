package com.cdsxt.service;

import com.cdsxt.po.User;

import java.util.List;

public interface UserService {
    List<User> find();

    User findOne(Integer userId);

    void add(User user);

    void delete(Integer userId);

    void update(User user);
}
