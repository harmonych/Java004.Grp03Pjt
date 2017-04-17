package _04_ShoppingCart.model;

import java.util.List;

public interface IOrderDAO {

	int getOrder_id();

	void setOrder_id(int orderid);

	int insert(OrderBean ob);

	int update(OrderBean ob);

	int delete(OrderBean ob);

	int delete(int key);

	OrderBean findByPrimaryKey(int key);

	List<OrderBean> getAllOrderJSON();

}