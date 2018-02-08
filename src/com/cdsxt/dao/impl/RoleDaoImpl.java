package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.RoleDao;
import com.cdsxt.po.Resource;
import com.cdsxt.po.Role;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class RoleDaoImpl extends SessionBaseDao implements RoleDao{
    @SuppressWarnings("unchecked")
	@Override
    public List<Role> find() {
        return this.getSession().createCriteria(Role.class).list();
    }

    @Override
    public void add(Role role) {
        this.getSession().save(role);
    }

    @Override
    public Role findOne(Integer roleId) {
        return (Role) this.getSession().createCriteria(Role.class).add(Restrictions.eq("roleId",roleId)).list().get(0);
    }

    @Override
    public void update(Role role) {
        this.getSession().update(role);
    }

    @Override
    public void delete(Integer roleId) {
        Role role = new Role();
        role.setRoleId(roleId);
        this.getSession().delete(role);
    }

    @SuppressWarnings("unchecked")
	@Override
    public List<Resource> findResources() {
        return this.getSession().createCriteria(Resource.class).list();
    }

    @Override
    public Resource findResourceById(Integer id) {
        return (Resource) this.getSession().get(Resource.class,id);
    }
}
