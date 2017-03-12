package _07_fund.model;

import java.util.List;

public interface IFundsDAO {
	
	public int getFcId();
	
	public void setFcId(int fcid);
	
	int insert(FundBean pb);

	int update(FundBean pb);

	int delete(FundBean pb);

	int delete(int key);

	FundBean findByPrimaryKey(int key);

	List<FundBean> getAllFundsJSON();
}
