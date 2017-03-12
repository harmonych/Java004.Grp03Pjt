package _08_product;

import _08_product.util.DBUtils;
import _08_product.util.HibernateUtil;

public class ProductInitMain {

	public static void main(String[] args) {
		
	//	IPlaceDAO dao = new PlaceHibernateDAO();
      //  dao.createTables();
        DBUtils.initPlace("productData.csv", "BIG5");    
        HibernateUtil.close();
		
	}

	
	
	
	
	
}
