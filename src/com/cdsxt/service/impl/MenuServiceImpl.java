package com.cdsxt.service.impl;

import com.cdsxt.dao.MenuDao;
import com.cdsxt.po.Resource;
import com.cdsxt.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class MenuServiceImpl implements MenuService{

    @Autowired
    private MenuDao menuDao;

    @Override
    public List<Resource> find() {
        return this.menuDao.find();
    }
}
