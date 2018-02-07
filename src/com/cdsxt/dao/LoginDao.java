package com.cdsxt.dao;

import com.cdsxt.po.Resource;
import com.cdsxt.po.User;

import java.util.Set;

public interface LoginDao {
    User findByName(String uname);

    User findAllInfo(Integer userId);

}
