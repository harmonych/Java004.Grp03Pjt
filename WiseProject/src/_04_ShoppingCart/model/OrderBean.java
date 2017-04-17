package _04_ShoppingCart.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;



@Entity
@Table(name="pro_order")
public class OrderBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int order_id;
	private int user_id;
	private int art_id;
	private String art_user_name;
	private int ord_status;
	private String real_name;
	private int total;
	private String address;
	private String phone;
	private String transport;
	private String payment;
	
	//以下七個變數僅存入Shopping Cart的Session中，不存入資料庫。
	private int subtotal;
	private int ord_count;
	private int pro_id;
	private String pro_name;
	private int price;
	private int ord_amount;
	private String photo_address;
	
	
	public OrderBean(int order_id, int user_id, int art_id, int ord_status,
			String real_name, int total, String address, String phone,
			String transport, String payment) {
		this.user_id = user_id;
		this.order_id = order_id;
		this.art_id = art_id;
		this.ord_status= ord_status;
		this.real_name = real_name;
		this.total = total;
		this.address = address;
		this.phone = phone;
		this.transport = transport;
		this.payment = payment;
		
	}
	
	//此建構子僅用於Shopping Cart的Session
	public OrderBean(int user_id, int art_id, String art_user_name, String real_name, 
			int ord_status, int total, String address, int subtotal, int ord_count, 
			int pro_id, String pro_name, int price, int ord_amount) {
		this.user_id = user_id;
		this.art_id = art_id;
		this.art_user_name = art_user_name;
		this.real_name = real_name;
		this.ord_status= ord_status;
		this.total = total;
		
		this.address = address;
		this.ord_count = ord_count;
		this.pro_id = pro_id;
		this.pro_name = pro_name;
		this.price = price;
		this.ord_amount = ord_amount;
		
	}
	
	public OrderBean(int user_id, int art_id, int ord_status,
			String real_name, int total, String address, String phone,
			String transport, String payment) {
		this.user_id = user_id;
		this.art_id = art_id;
		this.ord_status= ord_status;
		this.real_name = real_name;
		this.total = total;
		this.address = address;
		this.phone = phone;
		this.transport = transport;
		this.payment = payment;
	}

	public OrderBean() {
		
	}
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="order_id")
	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	
	

	public int getArt_id() {
		return art_id;
	}

	public void setArt_id(int art_id) {
		this.art_id = art_id;
	}

	public int getOrd_status() {
		return ord_status;
	}

	public void setOrd_status(int ord_status) {
		this.ord_status = ord_status;
	}

	public String getReal_name() {
		return real_name;
	}

	public void setReal_name(String real_name) {
		this.real_name = real_name;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getTransport() {
		return transport;
	}

	public void setTransport(String transport) {
		this.transport = transport;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	@Transient
	public int getOrd_count() {
		return ord_count;
	}

	public void setOrd_count(int ord_count) {
		this.ord_count = ord_count;
	}

	@Transient
	public int getPro_id() {
		return pro_id;
	}

	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

	@Transient
	public String getPro_name() {
		return pro_name;
	}

	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}

	@Transient
	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Transient
	public int getOrd_amount() {
		return ord_amount;
	}

	public void setOrd_amount(int ord_amount) {
		this.ord_amount = ord_amount;
	}

	@Transient
	public String getArt_user_name() {
		return art_user_name;
	}

	public void setArt_user_name(String art_user_name) {
		this.art_user_name = art_user_name;
	}

	@Transient
	public int getSubtotal() {
		return subtotal;
	}

	public void setSubtotal(int subtotal) {
		this.subtotal = subtotal;
	}

	@Transient
	public String getPhoto_address() {
		return photo_address;
	}

	public void setPhoto_address(String photo_address) {
		this.photo_address = photo_address;
	}

	

	

	
	
	
}	