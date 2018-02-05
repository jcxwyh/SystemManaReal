package com.cdsxt.po;

import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * 部门表
 * 		deptno：部门编号
 * 		dname：部门名称
 * 		ddesc：部门描述
 * 		cname：公司名称
 * 		cdesc：公司描述
 * @author jcx13
 *
 */
@Entity
@Table(name="sys_dept")
public class Dept {
	@Id
	@GenericGenerator(name="deptGen",strategy = "identity")
	@GeneratedValue(generator = "deptGen")
	private Integer deptno;

	@Column(unique = true)
	private String dname;
	private String ddesc;
	private String cname;
	private String cdesc;
	//与用户一对多
	@OneToMany(mappedBy = "dept")
	private Set<User> uers = new HashSet<>();

	public Integer getDeptno() {
		return deptno;
	}

	public void setDeptno(Integer deptno) {
		this.deptno = deptno;
	}

	public String getDname() {
		return dname;
	}

	public void setDname(String dname) {
		this.dname = dname;
	}

	public String getDdesc() {
		return ddesc;
	}

	public void setDdesc(String ddesc) {
		this.ddesc = ddesc;
	}

	public String getCname() {
		return cname;
	}

	public void setCname(String cname) {
		this.cname = cname;
	}

	public String getCdesc() {
		return cdesc;
	}

	public void setCdesc(String cdesc) {
		this.cdesc = cdesc;
	}

	public Set<User> getUers() {
		return uers;
	}

	public void setUers(Set<User> uers) {
		this.uers = uers;
	}

	public Dept(){

	}
	public Dept(Integer deptno,String dname){
		this.deptno = deptno;
		this.dname = dname;
	}
}
