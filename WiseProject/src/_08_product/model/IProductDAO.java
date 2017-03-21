package _08_product.model;

import java.util.List;

public interface IProductDAO {
	
	public int getProId();
	
	public void setProId(int proid);
	
	int insert(ProductBean pb);

	int update(ProductBean pb);

	int delete(ProductBean pb);

	int delete(int key);

	ProductBean findByPrimaryKey(int key);

	List<ProductBean> getAllProductJSON();

	List<ProductBean> getAllProductJSONtag(String search);
}
