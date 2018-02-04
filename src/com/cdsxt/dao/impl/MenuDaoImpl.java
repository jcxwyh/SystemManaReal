package com.cdsxt.dao.impl;

import com.cdsxt.base.SessionBaseDao;
import com.cdsxt.dao.MenuDao;
import com.cdsxt.po.Resource;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MenuDaoImpl extends SessionBaseDao implements MenuDao {
    @Override
    public List<Resource> find() {
        return this.getSession().createCriteria(Resource.class).list();
    }
}
