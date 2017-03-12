package _01_register.model;

import java.io.*;
import java.sql.*;

public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	String account;
	String password;
	String user_name;
	String phonenum;
	String email;
	String gender;
	String birthday;
	Blob head_pic;
	String fileName;

	public MemberBean(String account, String password, String user_name, String phonenum, String email,  String gender,
			String birthday) {
		super();
		this.account = account;
		this.password = password;
		this.user_name = user_name;
		this.phonenum = phonenum;
		this.email = email;
		this.gender = gender;
		this.birthday = birthday;		
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

//	public Blob getHead_pic() {
//		return head_pic;
//	}
//
//	public void setHead_pic(Blob head_pic) {
//		this.head_pic = head_pic;
//	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MemberBean() {
		super();
	}	

	public String toString() {
		return "userid=" + account + "   password="+password;
	}

}