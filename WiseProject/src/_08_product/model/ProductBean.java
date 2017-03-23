package _08_product.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="product")
public class ProductBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int proid;
	private String proname;
	private int price;
	
	private String saletime;
	private int proinv;
	
	private String prointroduction;
	private int artid;
	private String hashtag;
	
	public ProductBean(int proid, String proname, int price, String saletime,int proinv,String prointroduction,
			int artid, String hashtag) {
		super();
		this.proid = proid;
		this.proname = proname;
		this.price = price;
		this.proinv=proinv;
		this.saletime = saletime;
		this.prointroduction = prointroduction;
		this.artid = artid;
		this.hashtag = hashtag;
	}
	
	
	
	public ProductBean() {
		super();
	}

	public ProductBean(String proname, int price, String saletime, int proinv, String prointroduction, int artid,
			String hashtag) {
		this.proname = proname;
		this.price = price;
		this.proinv=proinv;
		this.saletime = saletime;
		this.prointroduction = prointroduction;
		this.artid = artid;
		this.hashtag = hashtag;
	}



	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column( name = "pro_id")
	public int getProid() {
		return proid;
	}
	public void setProid(int proid) {
		this.proid = proid;
	}

	@Column(name = "pro_name")
	public String getProname() {
		return proname;
	}
	public void setProname(String proname) {
		this.proname = proname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	

	@Column(name = "sale_time")
	public String getSaletime() {
		return saletime;
	}
	public void setSaletime(String saletime) {
		this.saletime = saletime;
	}
	@Column(name = "pro_inv")
	public int getProinv() {
		return proinv;
	}

	public void setProinv(int proinv) {
		this.proinv = proinv;
	}
	
	@Column(name = "pro_intro", columnDefinition="LongText")
	public String getProintroduction() {
		return prointroduction;
	}
	public void setProintroduction(String prointroduction) {
		this.prointroduction = prointroduction;
	}

	@Column(name = "art_id")
	public int getArtid() {
		return artid;
	}
	public void setArtid(int artid) {
		this.artid = artid;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}

}