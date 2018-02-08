package com.cdsxt.dao;

import com.cdsxt.po.User;


public interface LoginDao {
    User findByName(String uname);

    User findAllInfo(Integer userId);

}
