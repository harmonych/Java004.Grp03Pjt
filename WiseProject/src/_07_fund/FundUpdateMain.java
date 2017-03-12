package _07_fund;

import _07_fund.model.FundBean;
import _07_fund.model.FundHibernateDAO;
import _07_fund.model.IFundsDAO;
import _07_fund.util.DBUtils;

public class FundUpdateMain {

	public static void main(String[] args) {
		
		char[] comment = 
			DBUtils.fileToChars("text/UpdateText.txt", "big5");

		IFundsDAO dao = new FundHibernateDAO();
		FundBean fb = new FundBean(0, 5, "韓式烤肉", 123, 
			 1253, "2111/11/11", 
			"2111/11/11", "2111/11/11", 
			 "2111/11/11" ,"",""); 
		int n = dao.update(fb);
		if (n == 1) {
			System.out.println("修改一筆紀錄");
		} else {
			System.out.println("未修改任何紀錄");
		}
		
	}
}
