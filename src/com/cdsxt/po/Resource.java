package com.cdsxt.po;

import com.fasterxml.jackson.annotation.JsonIgnore;
import org.hibernate.annotations.GenericGenerator;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

/**
 * 资源包括其父节点，地址，标题
 * 
 * 同时与自身自关联（一对多）
 * 
 * @author jcx13
 *
 */
@Entity
@Table(name="sys_resource")
public class Resource implements Comparable<Resource>{
	@Id
	@GenericGenerator(name="resourceGen",strategy = "identity")
	@GeneratedValue(generator = "resourceGen")
	@Column(name="res_id")
	private Integer resId;
	private String rname;
	private String title;
	@Column(unique = true)
	private String href;

	private String target;

	public Byte getHasChild() {
		return hasChild;
	}

	public void setHasChild(Byte hasChild) {
		this.hasChild = hasChild;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	private Byte hasChild;
	private Byte shown;
	private Byte enabled;
	private Byte type;

	@ManyToOne
	@JoinColumn(name="parent")
	private Resource resource;

	//(fetch = FetchType.EAGER)
	@JsonIgnore
	@OneToMany(mappedBy = "resource")
	private Set<Resource> resources = new HashSet<>();

	@JsonIgnore
	@ManyToMany(mappedBy = "resources")
	private Set<Role> roles = new HashSet<>();

    public Resource(Integer id) {
    }

	public Resource() {
	}

	public Integer getResId() {
		return resId;
	}

	public void setResId(Integer resId) {
		this.resId = resId;
	}

	public String getRname() {
		return rname;
	}

	public void setRname(String rname) {
		this.rname = rname;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getTarget() {
		return target;
	}

	public void setTarget(String target) {
		this.target = target;
	}

	public Byte getShown() {
		return shown;
	}

	public void setShown(Byte shown) {
		this.shown = shown;
	}

	public Byte getEnabled() {
		return enabled;
	}

	public void setEnabled(Byte enabled) {
		this.enabled = enabled;
	}

	public Byte getType() {
		return type;
	}

	public void setType(Byte type) {
		this.type = type;
	}

	public Resource getResource() {
		return resource;
	}

	public void setResource(Resource resource) {
		this.resource = resource;
	}

	public Set<Resource> getResources() {
		return resources;
	}

	public void setResources(Set<Resource> resources) {
		this.resources = resources;
	}
	
	//重写hashCode与equals

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;

		Resource resource = (Resource) o;

		return rname.equals(resource.rname);
	}

	@Override
	public int hashCode() {
		return rname.hashCode();
	}

	@Override
	public int compareTo(Resource o) {
    	if(this.rname.hashCode()<o.rname.hashCode()){
    		return -1;
		}else if(this.rname.hashCode()>o.rname.hashCode()){
    		return 1;
		}
		return 0;
	}
}
