package com.cdsxt.service.impl;

import com.cdsxt.dao.LoginDao;
import com.cdsxt.po.Resource;
import com.cdsxt.po.Role;
import com.cdsxt.po.User;
import com.cdsxt.service.LoginService;
import com.cdsxt.vo.LoginUser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Objects;
import java.util.Set;

@Service
public class LoginServiceImpl implements LoginService{

    @Autowired
    private LoginDao loginDao;

    @Override
    public User findByName(String uname) {
        return this.loginDao.findByName(uname);
    }

    @Override
    public LoginUser findAllInfo(Integer userId) {
        LoginUser loginUser = new LoginUser();
        User user = this.loginDao.findAllInfo(userId);
        loginUser.setUser(user);
        Set<Role> roles = user.getRoles();
        loginUser.setRoles(user.getRoles());

        Set<Resource> menus = new HashSet<>();
        Set<Resource> auths = new HashSet<>();
        /*
            1：查出role下所有资源，分为菜单和资源
            2：菜单需要查出其父菜单，而不需要查出其子菜单
         */
        for(Role role:roles){
            Set<Resource> res = role.getResources();

            for(Resource re : res){
                if(Objects.nonNull(re)){
                    re.toString();
                    if(re.getType()==1){
                    Resource resource = re.getResource();
                    if(Objects.nonNull(resource)){
                        resource.toString();
                    }else{
                        resource = null;
                    }
                    Set<Resource> resources = re.getResources();
                    if(Objects.nonNull(resources)){
                        resources.forEach(r->r.toString());
                    }else{
                        resources=null;
                    }

                        menus.add(re);
                    }else if(re.getType()==0){
                        auths.add(re);
                    }
                }

            }
        }

        loginUser.setMenus(menus);
        loginUser.setAuths(auths);

        return loginUser;
    }
}
