package _01_register.model;

import java.io.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

import com.google.gson.annotations.Expose;

@Entity
@Table(name="artist")
public class ArtistBean implements Serializable {
	private static final long serialVersionUID = 1L;
@Expose	private int art_id;
@Expose	private String user_name;
@Expose	private String introduction;
@Expose	private String bank_account;
@Expose	private String ID;
@Expose	private String art_name;
@Expose	private String art_address;
@Expose	private String hashtag;
//	private byte[] intro_pic;
@Expose	private String file_name;
	private MemberBean memberbean;
	
	//含所有屬性的建構子
	public ArtistBean(int art_id, String user_name, String introduction, String bank_account, String ID, String art_name, String art_address,
			String hashtag, String file_name) {
		super();
		this.art_id = art_id;
		this.user_name = user_name;
		this.introduction = introduction;
		this.bank_account = bank_account;
		this.ID = ID;
		this.art_name = art_name;
		this.art_address = art_address;
		this.hashtag = hashtag;
		this.file_name = file_name;
	}
	public ArtistBean(int art_id, String user_name, String introduction, String bank_account, String ID, String art_name, String art_address,
			String hashtag) {
		super();
		this.art_id = art_id;
		this.user_name = user_name;
		this.introduction = introduction;
		this.bank_account = bank_account;
		this.ID = ID;
		this.art_name = art_name;
		this.art_address = art_address;
		this.hashtag = hashtag;
	}
	public ArtistBean(String user_name, String introduction, String bank_account, String ID, String art_name,
			String art_address, String hashtag, String file_name) {
		super();
		this.user_name = user_name;
		this.introduction = introduction;
		this.bank_account = bank_account;
		this.ID = ID;
		this.art_name = art_name;
		this.art_address = art_address;
		this.file_name = file_name;
		this.hashtag = hashtag;
	}
	//init使用的建構子
//	public ArtistBean(String user_name, String introduction, String bank_account, String ID, String art_name,
//			String art_address, String hashtag, String file_name, byte[] intro_pic) {
//		super();
//		this.user_name = user_name;
//		this.introduction = introduction;
//		this.bank_account = bank_account;
//		this.ID = ID;
//		this.art_name = art_name;
//		this.art_address = art_address;
//		this.hashtag = hashtag;
//		this.file_name = file_name;
//		this.intro_pic = intro_pic;
//	}

	public ArtistBean() {
	}	
	
	

	@Id
	@GeneratedValue(generator = "gen") 	
	@GenericGenerator(name = "gen", strategy = "identity", 
	parameters = { @Parameter(name = "property", value = "memberbean") })
	public int getArt_id() {
		return art_id;
	}

	public void setArt_id(int art_id) {
		this.art_id = art_id;
	}
	
	@OneToOne
	@PrimaryKeyJoinColumn 
	public MemberBean getMemberbean() {
		return memberbean;
	}
	public void setMemberbean(MemberBean memberbean) {
		this.memberbean = memberbean;
	}
	public String getIntroduction() {
		return introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	public String getBank_account() {
		return bank_account;
	}

	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}
	@Column(nullable = false, unique = true)
	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}
	@Transient
	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	@Column(nullable = false)
	public String getArt_name() {
		return art_name;
	}

	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}

	@Column(nullable = false)
	public String getArt_address() {
		return art_address;
	}

	public void setArt_address(String art_address) {
		this.art_address = art_address;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
//	@Column(name = "intro_pic", columnDefinition="MediumBlob", nullable = false)
//	public byte[] getIntro_pic() {
//		return intro_pic;
//	}
//
//	public void setIntro_pic(byte[] intro_pic) {
//		this.intro_pic = intro_pic;
//	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

}
	