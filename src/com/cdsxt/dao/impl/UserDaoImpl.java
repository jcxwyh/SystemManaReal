package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.UserDao;
import com.cdsxt.po.Role;
import com.cdsxt.po.User;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.*;

@Repository
public class UserDaoImpl extends SessionBaseDao implements UserDao{
    @SuppressWarnings("unchecked")
	@Override
    public List<User> find() {
        return this.getSession().createQuery("from User u").list();
    }

    @Override
    public void add(User user) {
        this.getSession().save(user);
    }

    @Override
    public User findOne(Integer userId) {
        return (User) this.getSession().get(User.class,userId);
    }

    @Override
    public void delete(Integer userId) {
        User user = new User();
        user.setUserId(userId);
        this.getSession().delete(user);
    }

    @Override
    public void update(User user) {
        this.getSession().merge(user);
    }

    @Override
    public void changePwd(Integer userId, String password) {
        User user = (User) this.getSession().get(User.class,userId);
        user.setPassword(password);
    }

    @Override
    public void assignRoles(Integer userId, Integer[] roleIds) {
        Session session = this.getSession();
        User user = (User) session.get(User.class,userId);
        user.setRoles(new HashSet<>());
        Set<Role> roles = user.getRoles();
        for(Integer id:roleIds){
            //System.out.println(id);
            Role role = new Role();
            role.setRoleId(id);
            roles.add(role);
        }
    }

    @SuppressWarnings("unchecked")
	@Override
    public User findByEmail(String email) {
        List<User> users = this.getSession().createQuery("from User u where u.email=:email").setParameter("email",email).list();
        if(Objects.isNull(users)||users.isEmpty()){
            return null;
        }else{
            return users.get(0);
        }
    }

    @SuppressWarnings("unchecked")
	@Override
    public User findByName(String uname) {
        List<User> list = this.getSession().createCriteria(User.class).add(Restrictions.eq("uname",uname)).list();
        if(Objects.isNull(list)||list.isEmpty()){
            return null;
        }else{
            return list.get(0);
        }
    }

    @SuppressWarnings("unchecked")
	@Override
    public List<User> findByNameList(String uname) {
        return this.getSession().createCriteria(User.class).add(Restrictions.eq("uname",uname)).list();
    }

    @SuppressWarnings("unchecked")
	@Override
    public List<User> findByEmailList(String email) {
        return this.getSession().createCriteria(User.class).add(Restrictions.eq("email",email)).list();
    }

    /**
     * 验证邮箱是否存在
     * @param email
     * @return
     */
    @Override
    public boolean valiEmail(String email) {
        return this.getSession().createCriteria(User.class).add(Restrictions.eq("email",email)).list().size()>0;
    }
}
