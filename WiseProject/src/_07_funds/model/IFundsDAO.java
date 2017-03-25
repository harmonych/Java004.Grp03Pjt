package _07_funds.model;

import java.util.List;

public interface IFundsDAO {
	
	public int getFcId();
	
	public void setFcId(int fcid);
	
	int insert(FundsBean pb);

	int update(FundsBean pb);

	int delete(FundsBean pb);

	int delete(int key);

	FundsBean findByPrimaryKey(int key);

	List<FundsBean> getAllFundsJSON();

	List<FundsBean> getAllFundsJSONtag(String search);
}
