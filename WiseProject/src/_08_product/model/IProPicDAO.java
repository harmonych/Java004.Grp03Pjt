package _08_product.model;

import java.util.List;

public interface IProPicDAO {

	public int getPro_id();
	
	public void setPro_id(int proid);
	
	int insert(ProPicBean pb);
	
	int delete(int pic_id);
	
	ProPicBean findByPrimaryKey(int key);
	
	List<ProPicBean> getpicadressJSON(int pro_id);



	
}
