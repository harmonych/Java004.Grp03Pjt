package _08_product;

import _07_funds.util.HibernateUtil;
import _08_product.util.DBUtils;

public class ProPicInitMain {

	public static void main(String[] args) {
        DBUtils.initProPic("pro_picData.csv", "BIG5");    
        HibernateUtil.close();
		
	}

	
	
	
	
	
}
