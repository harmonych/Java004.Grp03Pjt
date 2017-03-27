package _08_product.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name="product")
public class ProductBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int pro_id;
	private String pro_name;
	private int price;
	
	private String sale_time;
	private int pro_inv;
	
	private String pro_introduction;	
	@OneToOne(mappedBy = "art_id")
	@JoinColumn(name = "art_id", nullable = false)
	private int art_id;
	private String hashtag;
	
	public ProductBean(int proid, String proname, int price, String saletime,int proinv,String prointroduction,
			int artid, String hashtag) {
		super();
		this.pro_id = proid;
		this.pro_name = proname;
		this.price = price;
		this.pro_inv=proinv;
		this.sale_time = saletime;
		this.pro_introduction = prointroduction;
		this.art_id = artid;
		this.hashtag = hashtag;
	}
	
	
	
	public ProductBean() {
		super();
	}

	public ProductBean(String proname, int price, String saletime, int proinv, String prointroduction, int artid,
			String hashtag) {
		this.pro_name = proname;
		this.price = price;
		this.pro_inv=proinv;
		this.sale_time = saletime;
		this.pro_introduction = prointroduction;
		this.art_id = artid;
		this.hashtag = hashtag;
	}



	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column( name = "pro_id")
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int proid) {
		this.pro_id = proid;
	}

	@Column(name = "pro_name", nullable = false)
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String proname) {
		this.pro_name = proname;
	}
	@Column(nullable = false)
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	

	@Column(name = "sale_time", nullable = false)
	public String getSale_time() {
		return sale_time;
	}
	public void setSale_time(String saletime) {
		this.sale_time = saletime;
	}
	@Column(name = "pro_inv", nullable = false)
	public int getPro_inv() {
		return pro_inv;
	}

	public void setPro_inv(int proinv) {
		this.pro_inv = proinv;
	}
	
	@Column(name = "pro_intro", columnDefinition="LongText")
	public String getPro_introduction() {
		return pro_introduction;
	}
	public void setPro_introduction(String prointroduction) {
		this.pro_introduction = prointroduction;
	}

	public int getArt_id() {
		return art_id;
	}
	public void setArt_id(int artid) {
		this.art_id = artid;
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