package com.cdsxt.vo;

import com.cdsxt.po.Resource;
import com.cdsxt.po.Role;
import com.cdsxt.po.User;

import java.util.HashSet;
import java.util.Set;

public class LoginUser {
    private User user;
    private Set<Role> roles = new HashSet<>();
    private Set<Resource> menus = new HashSet<>();
    private Set<Resource> auths = new HashSet<>();

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }

    public Set<Resource> getMenus() {
        return menus;
    }

    public void setMenus(Set<Resource> menus) {
        this.menus = menus;
    }

    public Set<Resource> getAuths() {
        return auths;
    }

    public void setAuths(Set<Resource> auths) {
        this.auths = auths;
    }
}
