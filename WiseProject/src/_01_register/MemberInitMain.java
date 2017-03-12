package _01_register;

import _01_register.util.DBUtils;
import _01_register.util.HibernateUtil;

public class MemberInitMain {

	public static void main(String[] args) {
		
	//	IPlaceDAO dao = new PlaceHibernateDAO();
      //  dao.createTables();
        DBUtils.initPlace("userinfoData.csv", "BIG5");    
        HibernateUtil.close();
		
	}

	
	
	
	
	
}
