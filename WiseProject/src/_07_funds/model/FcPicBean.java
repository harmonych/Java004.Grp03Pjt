package _07_funds.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="fc_pic")
public class FcPicBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int pic_id;
	private int fc_id;
	private String fc_adress;
	
	public FcPicBean(int pic_id, int fc_id, String fc_adress) {
		super();
		this.pic_id = pic_id;
		this.fc_id = fc_id;
		this.fc_adress = fc_adress;
	}

	public FcPicBean(int fc_id, String fc_adress) {
		super();
		this.fc_id = fc_id;
		this.fc_adress = fc_adress;
	}
	
	public FcPicBean() {
		// TODO Auto-generated constructor stub
	}
	@Id
	@Column(name = "pic_id")
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getPic_id() {
		return pic_id;
	}
	public void setPic_id(int pic_id) {
		this.pic_id = pic_id;
	}
	public int getFc_id() {
		return fc_id;
	}
	public void setFc_id(int fc_id) {
		this.fc_id = fc_id;
	}
	@Column(name = "pic_address", columnDefinition="LongText")
	public String getFc_adress() {
		return fc_adress;
	}
	public void setFc_adress(String fc_adress) {
		this.fc_adress = fc_adress;
	}
	
	
	
}