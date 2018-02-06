package com.cdsxt.po;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;
import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.Length;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;
/**
 * 1：用户与角色是多对多关系
 * 		 关系维护由用户完成
 * 2：用户与部门是一对多关系
 * 
 * @author jcx13
 *
 */
@Entity
@Table(name="sys_user")
public class User {
	@Id
	@GenericGenerator(name="userGen",strategy = "identity")
	@GeneratedValue(generator = "userGen")
	@Column(name="user_id")
	private Integer userId;

	//@Length(min=2,max=10,message="用户名应为2-10个字符组成")
	@Column(unique = true)
	private String uname;

	//@Length(min=8,max=18,message = "密码由8-18个字符组成")
	private String password;

	//@Email
	@Column(unique = true)
	private String email;
	private Byte gender;
	private Byte enabled;
	private Byte locked;

	private String description;

	//与部门是一对多关系
	@ManyToOne
	@JoinColumn(name="deptno")
	private Dept dept;
	//与角色是多对多

	@JsonIgnore
	@ManyToMany
	@JoinTable(name = "sys_user_role",joinColumns = {@JoinColumn(name="userId")},inverseJoinColumns = {@JoinColumn(name="roleId")})
	private Set<Role> roles = new HashSet<>();
	
	public Dept getDept() {
		return dept;
	}

	public void setDept(Dept dept) {
		this.dept = dept;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Byte getGender() {
		return gender;
	}

	public void setGender(Byte gender) {
		this.gender = gender;
	}

	public Byte getEnabled() {
		return enabled;
	}

	public void setEnabled(Byte enabled) {
		this.enabled = enabled;
	}

	public Byte getLocked() {
		return locked;
	}

	public void setLocked(Byte locked) {
		this.locked = locked;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}
	
	
}
