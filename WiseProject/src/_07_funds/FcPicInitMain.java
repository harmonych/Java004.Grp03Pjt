package _07_funds;

import _07_funds.util.DBUtils;
import _07_funds.util.HibernateUtil;

public class FcPicInitMain {

	public static void main(String[] args) {
        DBUtils.initFcPic("fc_picData.csv", "BIG5");    
        HibernateUtil.close();
		
	}

	
	
	
	
	
}
