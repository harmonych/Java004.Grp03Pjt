package _07_funds;

import java.util.List;

import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;
import _07_funds.util.DBUtils;


public class FundAllMain {
	public static void main(String[] args) {
		
		IFundsDAO dao = new FundsHibernateDAO();
		List<FundsBean> list = dao.getAllFundsJSON();
		for(FundsBean fb: list){
			DBUtils.displayData(fb);
			System.out.println("-------------------");
		}
	}
}