package _07_funds;

import _07_funds.util.DBUtils;
import _07_funds.util.HibernateUtil;

public class FundsInitMain {

	public static void main(String[] args) {
		
	//	IPlaceDAO dao = new PlaceHibernateDAO();
      //  dao.createTables();
        DBUtils.initPlace("funds_collection.csv", "BIG5");    
        HibernateUtil.close();
		
	}

	
	
	
	
	
}
