package com.cdsxt.service.impl;

import com.cdsxt.dao.RoleDao;
import com.cdsxt.po.Resource;
import com.cdsxt.po.Role;
import com.cdsxt.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service
@Transactional(readOnly = true)
public class RoleServiceImpl implements RoleService{

    @Autowired
    private RoleDao roleDao;

    @Override
    public List<Role> find() {
        return this.roleDao.find();
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void add(Role role) {
        this.roleDao.add(role);
    }

    @Override
    public Role findOne(Integer roleId) {
        return this.roleDao.findOne(roleId);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void update(Role role) {
        this.roleDao.update(role);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void delete(Integer roleId) {
        this.roleDao.delete(roleId);
    }

    @Override
    @Transactional(readOnly = false,rollbackFor = Throwable.class)
    public void assignResource(Integer roleId, Integer[] resId) {
        Role role = this.roleDao.findOne(roleId);
        role.setResources(new HashSet<>());
        Set<Resource> resources = role.getResources();
        for(Integer id:resId){
        	if(id!=0) {
        		resources.add(this.roleDao.findResourceById(id));
        	}
        }
        //this.roleDao.update(role);
    }

    @Override
    public List<Resource> findResources() {
        return this.roleDao.findResources();
    }
}
