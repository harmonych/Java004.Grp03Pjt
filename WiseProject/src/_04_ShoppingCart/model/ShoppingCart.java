package _04_ShoppingCart.model;

import java.util.*;
import _04_ShoppingCart.model.OrderItemBean;
import _08_product.model.IProPicDAO;
import _08_product.model.ProPicBean;
import _08_product.model.ProPicHBNDAO;

public class ShoppingCart {

	private Map<Integer, OrderBean> cart = new LinkedHashMap<>();
	private Map<Integer, OrderBean> orderList = new LinkedHashMap<>();
	private Map<Integer, OrderBean> checkoutlist = new LinkedHashMap<>();
	private IProPicDAO jdbc = new ProPicHBNDAO();
	
	public ShoppingCart() {
	}

	public Map<Integer, OrderBean> getContent() { // ${ShoppingCart.content}
		return cart;
	}

	public Map<Integer, OrderBean> getCheckoutlist() { // ${checkoutList.checkoutList}
		return checkoutlist;
	}

	public Map<Integer, OrderBean> getOrderList() { // ${OrderList.orderList}
		return orderList;
	}

	public void addOrderList(int art_id, OrderBean ob) {
		int old_pb_id = 0;
		boolean repeatBuy = false;
		//判斷之前是否將相同商品加入購物車
		for (OrderBean ob2 : orderList.values()) {
			if(ob.getPro_id() == ob2.getPro_id()){
				repeatBuy = true;
			} 
		}
		// 如果購物車清單內查無此創作者商品，購物車清單新增該創作者
		if (orderList.get(art_id) == null) {
			orderList.put(art_id, ob);
		} else {
			if(repeatBuy == true){
			}else{
				// 如果沒買過該創作者非相同商品，該創作者購物車商品項目數+1
				OrderBean ob_old = orderList.get(art_id);
				ob_old.setOrd_count(ob_old.getOrd_count() + 1);
			}
			
			
		} 

	}

	public void addToCart(int pro_id, OrderBean ob) {
		if (ob.getOrd_amount() <= 0) {
			return;
		}
		// 如果客戶在伺服器端沒有此項商品的資料，則客戶第一次購買此項商品
		if (cart.get(pro_id) == null) {
			cart.put(pro_id, ob);
		} else {
			// 如果客戶在伺服器端已有此項商品的資料，則客戶『加購』此項商品
			OrderBean ob_old = cart.get(pro_id);
			// 加購的數量：ob.getOrd_amount()
			// 原有的數量：ob_old.getOrd_amount()
			ob_old.setOrd_amount(ob.getOrd_amount() + ob_old.getOrd_amount());
		}
	}

	// 將相同創作者的商品加入結帳清單(**購物車結帳)
	public void addCheckOutList(int art_id, ShoppingCart cart) {
		checkoutlist.clear();
		for (OrderBean ob : cart.getContent().values()) {

			if (art_id == ob.getArt_id()) {
				//設定商品小計
				int subtotal = getSubtotal(ob.getPrice(), ob.getOrd_amount());
				ob.setSubtotal(subtotal);
				//取得產品圖片
				int pro_id = ob.getPro_id();
				jdbc.setPro_id(pro_id);
				List<ProPicBean> ppb = jdbc.getPicAddressJSON(pro_id);
				String phoAdr = ppb.get(0).getPic_adress();
				ob.setPhoto_address(phoAdr);
				//將ob放入checkoutlist內
				checkoutlist.put(ob.getPro_id(), ob);
			}
		}
	}
	
	// 將相同創作者的商品加入結帳清單(**立即購買)
		public void addCheckOutList(int art_id, OrderBean ob) {
			//設定商品小計
			checkoutlist.clear();
			int subtotal = getSubtotal(ob.getPrice(), ob.getOrd_amount());
			ob.setSubtotal(subtotal);
			
			//取得產品圖片
			int pro_id = ob.getPro_id();
			jdbc.setPro_id(pro_id);
			List<ProPicBean> ppb = jdbc.getPicAddressJSON(pro_id);
			String phoAdr = ppb.get(0).getPic_adress();
			ob.setPhoto_address(phoAdr);
			//將ob放入checkoutlist內
			checkoutlist.put(ob.getPro_id(), ob);
					
					
		}
			
	

	// 計算結帳清單所有商品的合計金額(每項商品的單價*數量的總和)
	public int getTotal() {
		int total = 0;
		Set<Integer> set = checkoutlist.keySet();
		for (int n : set) {
			int price = checkoutlist.get(n).getPrice();
			int qty = checkoutlist.get(n).getOrd_amount();
			total += price * qty;
		}
		for (OrderBean ob : checkoutlist.values()) {
			ob.setTotal(total);
		}
		return total;
	}

	// 計算單項商品的合計金額(每項商品的單價*數量的總和)
	public int getSubtotal(int price, int ord_amount) {
		int subTotal = price * ord_amount;

		return subTotal;
	}

	// 刪除某項商品
	public int deleteProduct(int pro_id) {
		if (checkoutlist.get(pro_id) != null) {
			checkoutlist.remove(pro_id); // Map介面的remove()方法
			return 1;
		} else {
			return 0;
		}
	}
	
	// 刪除某項購物車項目
		public int deleteOrderListItem(int art_id) {
			if (orderList.get(art_id) != null) {
				orderList.remove(art_id); // Map介面的remove()方法
				return 1;
			} else {
				return 0;
			}
		}

	// 修改商品的數量
	// public boolean modifyQty(int product_id, OrderItemBean oib) {
	// if ( cart.get(product_id) != null && oib.getOrd_amount() > 0 ) {
	//// cart.put(product_id, oib);
	// return true;
	// } else {
	// return false;
	// }
	// }
	// public boolean modifyQty(int product_id, int newQty) {
	// if ( cart.get(product_id) != null ) {
	//// OrderItemBean oib = cart.get(product_id);
	//// oib.setOrd_amount(newQty);
	// //cart.put(bookID, oi);
	// return true;
	// } else {
	// return false;
	// }
	// }

	// public void listCart() {
	// Set<Integer> set = cart.keySet();
	// for(Integer k : set){
	//// System.out.printf("BookID=%3d, Qty=%3d, price=%5.2f, discount=%6.2f\n"
	// , k , cart.get(k).getQty(), cart.get(k).getPrice(),
	// cart.get(k).getDiscount());
	// }
	// System.out.println("------------------");
	// }
}
