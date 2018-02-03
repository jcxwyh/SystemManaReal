package com.cdsxt.po;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * 一个菜单多个权限
 *
 */
@Entity
@Table(name="sys_menu")
public class Menu {
	@Id
	@SequenceGenerator(name="menuGen",sequenceName = "seq_system_menu")
	private Integer mid;

	@Column(unique = true)
	private String mname;

	@ManyToOne
	@JoinColumn(name="parent")
	private Menu menu;

	@OneToMany(mappedBy = "menu")
	private Set<Menu> menus = new HashSet<>();


	private Set<Resource> resources = new HashSet<>();

	public Integer getMid() {
		return mid;
	}

	public void setMid(Integer mid) {
		this.mid = mid;
	}

	public String getMname() {
		return mname;
	}

	public void setMname(String mname) {
		this.mname = mname;
	}

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public Set<Menu> getMenus() {
		return menus;
	}

	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}

	public Set<Resource> getResources() {
		return resources;
	}

	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}
	
	

}
