package _08_product.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="product_pic")
public class ProPicBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int pic_id;
	private int pro_id;
	private String pic_adress;
	
	public ProPicBean(int pro_id, String pic_adress) {
		super();
		this.pro_id = pro_id;
		this.pic_adress = pic_adress;
	}

	public ProPicBean() {
		super();
	}
	@Id
	public int getPic_id() {
		return pic_id;
	}

	public void setPic_id(int pic_id) {
		this.pic_id = pic_id;
	}

	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	public String getPic_adress() {
		return pic_adress;
	}

	public void setPic_adress(String pic_adress) {
		this.pic_adress = pic_adress;
	}
	
	

	
	
	
}