package com.cdsxt.service;

import com.cdsxt.po.Dept;
import com.cdsxt.po.User;

import java.util.List;

public interface DeptService {
    List<Dept> find();

    void add(Dept dept);

    Dept findOne(Integer deptno);

    void update(Dept dept);

    void delete(Integer deptno, Integer mode);

    List<Dept> deptList();

    List<User> findEmps(Integer deptno);
}
