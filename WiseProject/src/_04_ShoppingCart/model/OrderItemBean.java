package _04_ShoppingCart.model;

import java.io.Serializable;

import javax.persistence.AssociationOverride;
import javax.persistence.AssociationOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;
import javax.persistence.Transient;
import _08_product.model.ProductBean;



@Entity
@Table(name="order_item")

public class OrderItemBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int orderItem_id;
	private int order_id;
	private int product_id;
	private String pro_name;
	private int price;
	private int ord_amount;
	private double discount;
	
	
	
	
	public OrderItemBean() {
		
	}
	
	public OrderItemBean(int orderItem_id, int order_id, int product_id, String pro_name, int price, int ord_amount, double discount) {
		this.orderItem_id = orderItem_id;
		this.product_id = product_id;
		this.pro_name = pro_name;
		this.price = price;
		this.order_id = order_id;
		this.ord_amount = ord_amount;
		this.discount = discount;
	}
	
	public OrderItemBean(int orderItem_id, int order_id, int product_id, int ord_amount, double discount) {
		this.orderItem_id = orderItem_id;
		this.product_id = product_id;
		this.order_id = order_id;
		this.ord_amount = ord_amount;
		this.discount = discount;
	}
	
	public OrderItemBean(int order_id, int product_id, int ord_amount, double discount) {
		this.order_id = order_id;
		this.product_id = product_id;
		this.ord_amount = ord_amount;
		this.discount = discount;
	}
	
	public OrderItemBean(int product_id, int ord_amount, double discount) {
		this.product_id = product_id;
		this.ord_amount = ord_amount;
		this.discount = discount;
	}
	
	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "order_item_id", unique = true, nullable = false)
	public int getOrderItem_id() {
		return orderItem_id;
	}

	public void setOrderItem_id(int orderItem_id) {
		this.orderItem_id = orderItem_id;
	}
	
	

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}
	
	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
		this.product_id = product_id;
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

	public void setDiscount(double discount) {
		this.discount = discount;
	}

	public int getOrd_amount() {
		return ord_amount;
	}

	public void setOrd_amount(int ord_amount) {
		this.ord_amount = ord_amount;
	}

	@Column(name = "discount", columnDefinition="Numeric(3,2)")
	public double getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}
	
	
	
	
	
}