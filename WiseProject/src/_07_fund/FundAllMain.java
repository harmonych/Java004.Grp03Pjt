package _07_fund;

import java.util.List;

import _07_fund.model.FundBean;
import _07_fund.model.FundHibernateDAO;
import _07_fund.model.IFundsDAO;
import _07_fund.util.DBUtils;


public class FundAllMain {
	public static void main(String[] args) {
		
		IFundsDAO dao = new FundHibernateDAO();
		List<FundBean> list = dao.getAllFundsJSON();
		for(FundBean fb: list){
			//DBUtils.displayData(fb);
			System.out.println("-------------------");
		}
	}
}