package com.cdsxt.service.impl;

import com.cdsxt.dao.AuthorityDao;
import com.cdsxt.po.Resource;
import com.cdsxt.service.AuthorityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AuthorityServiceImpl implements AuthorityService {

    @Autowired
    private AuthorityDao authorityDao;

    @Override
    public List<Resource> find() {
        return this.authorityDao.find();
    }
}
