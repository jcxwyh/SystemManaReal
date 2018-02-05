package com.cdsxt.dao;

import com.cdsxt.po.Dept;

import java.util.List;

public interface DeptDao {
    List<Dept> find();

    void add(Dept dept);

    Dept findOne(Integer deptno);

    void update(Dept dept);

    void delete(Integer deptno);

    List<Dept> deptList();

    void deleteAll(Integer deptno);
}
