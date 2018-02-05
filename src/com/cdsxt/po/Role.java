package com.cdsxt.po;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * 角色与资源是多对多关系
 * 关系维护由角色完成
 * 
 * @author jcx13
 *
 */
@Entity
@Table(name="sys_role")
public class Role {
	@Id
	@GenericGenerator(name="roleGen",strategy = "identity")
	@GeneratedValue(generator = "roleGen")
	@Column(name="role_id")
	private Integer roleId;

	@Column(unique = true)
	private String rname;
	private String constant;
	private Byte enabled;
	private String description;

	//与用户多对多
	@ManyToMany(mappedBy = "roles")
	private Set<User> users = new HashSet<>();

	//与资源多对多
	@ManyToMany
	@JoinTable(name="sys_role_resource",joinColumns = {@JoinColumn(name="roleId")},inverseJoinColumns = {@JoinColumn(name="resId")})
	private Set<Resource> resources = new HashSet<>();

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getConstant() {
		return constant;
	}

	public void setConstant(String constant) {
		this.constant = constant;
	}

	public Byte getEnabled() {
		return enabled;
	}

	public void setEnabled(Byte enabled) {
		this.enabled = enabled;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Resource> getResources() {
		return resources;
	}

	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}
	
	
	
}
