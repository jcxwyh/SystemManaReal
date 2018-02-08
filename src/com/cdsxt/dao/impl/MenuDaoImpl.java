package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.MenuDao;
import com.cdsxt.po.Resource;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MenuDaoImpl extends SessionBaseDao implements MenuDao {
    @SuppressWarnings("unchecked")
	@Override
    public List<Resource> find() {
        return this.getSession().createCriteria(Resource.class).add(Restrictions.eq("type",(byte)1)).list();
    }
}
