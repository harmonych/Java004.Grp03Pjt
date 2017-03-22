package _01_register.model;

import java.io.*;
import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name="artist")
public class ArtistBean implements Serializable {
	private static final long serialVersionUID = 1L;
	int art_id;
	@OneToOne(mappedBy = "user_name")
	private String user_name;
	private String Introduction;
	private String bank_account;
	private String ID;
	private String art_name;
	private String art_address;
	private String art_num;
	private String hashtag;
	private byte[] intro_pic;
	private String file_name;
//	private MemberBean memberbean;
	
	//含所有屬性的建構子
	public ArtistBean(int art_id, String user_name, String introduction, String bank_account, String ID, String art_name, String art_address,
			String art_num, String hashtag, String file_name) {
		super();
		this.art_id = art_id;
		this.user_name = user_name;
		this.Introduction = introduction;
		this.bank_account = bank_account;
		this.ID = ID;
		this.art_name = art_name;
		this.art_address = art_address;
		this.art_num = art_num;
		this.hashtag = hashtag;
		this.file_name = file_name;
	}
		
	public ArtistBean(String user_name, String Introduction, String bank_account, String ID, String art_name,
			String art_address, String art_num, String hashtag, String file_name) {
		super();
		this.user_name = user_name;
		this.Introduction = Introduction;
		this.bank_account = bank_account;
		this.ID = ID;
		this.art_name = art_name;
		this.art_address = art_address;
		this.art_num = art_num;
		this.hashtag = hashtag;
		this.file_name = file_name;
	}


	public ArtistBean() {
	}	
	
	

	@Id
	@Column(name = "art_id", unique = true, nullable = false)
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@GeneratedValue(generator = "autoGen")
	@GenericGenerator(name = "autoGen", strategy = "increment")
//	parameters = { @Parameter(name = "property", value = "artist") })
	public int getArt_id() {
		return art_id;
	}

	public void setArt_id(int art_id) {
		this.art_id = art_id;
	}
	
	public String getIntroduction() {
		return Introduction;
	}

	public void setIntroduction(String introduction) {
		this.Introduction = introduction;
	}

	public String getBank_account() {
		return bank_account;
	}

	public void setBank_account(String bank_account) {
		this.bank_account = bank_account;
	}

	public String getID() {
		return ID;
	}

	public void setID(String ID) {
		this.ID = ID;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public String getArt_name() {
		return art_name;
	}

	public void setArt_name(String art_name) {
		this.art_name = art_name;
	}

	public String getArt_address() {
		return art_address;
	}

	public void setArt_address(String art_address) {
		this.art_address = art_address;
	}

	public String getArt_num() {
		return art_num;
	}

	public void setArt_num(String art_num) {
		this.art_num = art_num;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	@Column(name = "intro_pic", columnDefinition="MediumBlob")
	public byte[] getIntro_pic() {
		return intro_pic;
	}

	public void setIntro_pic(byte[] intro_pic) {
		this.intro_pic = intro_pic;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

}
	