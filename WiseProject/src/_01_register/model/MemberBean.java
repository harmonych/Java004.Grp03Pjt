﻿package _01_register.model;

import java.io.*;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name="userInfo")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	int user_id;
	String account;
	String password;
	String user_name;
	String phonenum;
	String email;
	String gender;
	String birthday;
	byte[] portrait;
	boolean check_tag;
	String file_name;



	//含所有屬性的建構子
	public MemberBean(int user_id, String account, String password, String user_name, String phonenum, String email,
			String gender, String birthday, String file_name, byte[] portrait, boolean check_tag) {
		super();
		this.user_id = user_id;
		this.account = account;
		this.password = password;
		this.user_name = user_name;
		this.phonenum = phonenum;
		this.email = email;
		this.gender = gender;
		this.birthday = birthday;
		this.file_name = file_name;
		this.portrait = portrait;
		this.check_tag = check_tag;
	}

	//為了RegisterServletMP.java而做的建構子
	public MemberBean(String account, String password, String user_name, String phonenum, String email, String gender,
			String birthday, boolean check_tag, String file_name) {
		super();
		this.account = account;
		this.password = password;
		this.user_name = user_name;
		this.phonenum = phonenum;
		this.email = email;
		this.gender = gender;
		this.birthday = birthday;
		this.check_tag = check_tag;
		this.file_name = file_name;
	}
	public MemberBean() {
	}	
	
	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getUser_id() {
	return user_id;
	}
		
	public void setUser_id(int user_id) {
	this.user_id = user_id;
	}

	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getPhonenum() {
		return phonenum;
	}

	public void setPhonenum(String phonenum) {
		this.phonenum = phonenum;
	}
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBirthday() {
		return birthday;
	}

	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}

	@Column(name = "portrait", columnDefinition="MediumBlob")
	public byte[] getPortrait() {
		return portrait;
	}
	public void setPortrait(byte[] portrait) {
		this.portrait = portrait;
	}
	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}
	//判斷是否為創作者身分	
	@Column(name = "check_tag", columnDefinition="TINYINT")
	public boolean isCheck_tag() {
		return check_tag;
	}

	public void setCheck_tag(boolean check_tag) {
		this.check_tag = check_tag;
	}
	//	public Blob getHead_pic() {
//		return head_pic;
//	}
//
//	public void setHead_pic(Blob head_pic) {
//		this.head_pic = head_pic;
//	}


	public String toString() {
		return "userid=" + account + "   password="+password;
	}

}