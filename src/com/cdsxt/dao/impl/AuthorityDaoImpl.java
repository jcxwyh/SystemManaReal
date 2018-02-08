package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.AuthorityDao;
import com.cdsxt.po.Resource;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class AuthorityDaoImpl extends SessionBaseDao implements AuthorityDao {
    @SuppressWarnings("unchecked")
	@Override
    public List<Resource> find() {
        return this.getSession().createCriteria(Resource.class).add(Restrictions.eq("type",(byte)0)).list();
    }
}
