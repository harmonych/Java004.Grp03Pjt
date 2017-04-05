package _08_product.model;

import java.util.List;

public interface IProPicDAO {
	
	int insert(ProPicBean pb);
	
	int delete(int pic_id);
	
	List<ProPicBean> getpicadressJSON(int pro_id);


	public int getPro_id();
	
	public void setPro_id(int proid);
}
