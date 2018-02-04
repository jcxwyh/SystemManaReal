package com.cdsxt.service.impl;

import com.cdsxt.dao.DeptDao;
import com.cdsxt.po.Dept;
import com.cdsxt.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class DeptServiceImpl implements DeptService{

    @Autowired
    private DeptDao deptDao;

    @Override
    public List<Dept> find() {
        return this.deptDao.find();
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void add(Dept dept) {
        this.deptDao.add(dept);
    }

    @Override
    public Dept findOne(Integer deptno) {
        return this.deptDao.findOne(deptno);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void update(Dept dept) {
        this.deptDao.update(dept);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void delete(Integer deptno) {
        this.deptDao.delete(deptno);
    }
}
