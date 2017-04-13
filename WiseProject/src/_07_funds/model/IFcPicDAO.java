package _07_funds.model;

import java.util.List;

public interface IFcPicDAO {
	
	int insert(FcPicBean pb);
	
	int delete(int pic_id);
	
	List<FcPicBean> getPicAddressJSON(int fc_id);


	public int getFc_id();
	
	public void setFc_id(int fcid);
}
