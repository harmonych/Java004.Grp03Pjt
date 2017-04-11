package _07_funds.model;

import java.util.List;

public interface IFundsDAO {
	
	public int getFc_id();
	
	public void setFc_id(int fcid);
	
	int insert(FundsBean pb);

	int update(FundsBean pb);

	int delete(FundsBean pb);

	int delete(int key);

	FundsBean findByPrimaryKey(int key);
	
	String findArtNameByFcId(int fc_id);

	List<FundsBean> getAllFundsJSON();

	List<FundsBean> getAllFundsJSONtag(String search);

	
}
