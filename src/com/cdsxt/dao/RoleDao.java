package com.cdsxt.dao;

import com.cdsxt.po.Role;

import java.util.List;

public interface RoleDao {
    List<Role> find();

    void add(Role role);

    Role findOne(Integer roleId);

    void update(Role role);

    void delete(Integer roleId);
}
