package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.LoginDao;
import com.cdsxt.po.User;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;


@Repository
public class LoginDaoImpl extends SessionBaseDao implements LoginDao{
    @Override
    public User findByName(String uname) {
        return this.getSession().createCriteria(User.class).add(Restrictions.eq("uname",uname)).list().isEmpty()?null:(User) this.getSession().createCriteria(User.class).add(Restrictions.eq("uname",uname)).list().get(0);
    }

    @Override
    public User findAllInfo(Integer userId) {

        return (User) this.getSession().get(User.class,userId);
    }


}
