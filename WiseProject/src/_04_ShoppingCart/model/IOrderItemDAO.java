package _04_ShoppingCart.model;

import java.util.List;

public interface IOrderItemDAO {

	int getOrderItem_id();

	void setOrderItem_id(int orderItem_id);

	int insert(OrderItemBean ob);

	int update(OrderItemBean ob);

	int delete(OrderItemBean ob);

	int delete(int key);

	OrderItemBean findByPrimaryKey(int key);

	List<OrderItemBean> getAllOrderItemJSON();

}