package _07_fund;

import _07_fund.util.DBUtils;
import _07_fund.util.HibernateUtil;

public class FundInitMain {

	public static void main(String[] args) {
		
	//	IPlaceDAO dao = new PlaceHibernateDAO();
      //  dao.createTables();
        DBUtils.initPlace("funds_collection.csv", "BIG5");    
        HibernateUtil.close();
		
	}	
}
