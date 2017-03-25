package _07_funds;

import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;
import _07_funds.util.DBUtils;

public class FundUpdateMain {

	public static void main(String[] args) {
		
		char[] comment = 
			DBUtils.fileToChars("text/UpdateText.txt", "big5");

		IFundsDAO dao = new FundsHibernateDAO();
		FundsBean fb = new FundsBean(0, 5, "韓式烤肉", 123, 
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
