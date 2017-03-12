package _01_register.model;

import java.io.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="userInfo")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;
	int user_Id;
	String account;
	String password;
	String user_name;
	String phonenum;
	String email;
	String gender;
	String birthday;
	String head_pic;
//	String file_name;

	//為了RegisterServletMP.java而做的建構子
	public MemberBean(String account, String password, String user_name, String phonenum, String email, String gender,
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
	


	public MemberBean(int user_Id, String account, String password, String user_name, 
			String phonenum, String email,  String gender, String birthday, String head_pic) {
		super();
		this.user_Id = user_Id;
		this.account = account;
		this.password = password;
		this.user_name = user_name;
		this.phonenum = phonenum;
		this.email = email;
		this.gender = gender;
		this.birthday = birthday;		
		this.head_pic = head_pic;
	}
	


	@Id	
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getUser_Id() {
	return user_Id;
	}
	
	
	
	public void setUser_Id(int user_Id) {
	this.user_Id = user_Id;
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

	@Column(name = "head_pic")
	public String getHead_pic() {
		return head_pic;
	}
	public void setHead_pic(String head_pic) {
		this.head_pic = head_pic;
	}
//	public String getFile_name() {
//		return file_name;
//	}
//
//	public void setFile_name(String file_name) {
//		this.file_name = file_name;
//	}
	
//	public Blob getHead_pic() {
//		return head_pic;
//	}
//
//	public void setHead_pic(Blob head_pic) {
//		this.head_pic = head_pic;
//	}
	public MemberBean() {
		super();
	}	

	public String toString() {
		return "userid=" + account + "   password="+password;
	}

}