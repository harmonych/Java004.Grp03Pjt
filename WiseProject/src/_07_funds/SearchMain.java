package _07_funds;

import java.util.List;

import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;
import _07_funds.util.DBUtils;

public class SearchMain {

	public static void main(String[] args) {
		
		String hashtag = "\'%狗%\'";
		IFundsDAO dao = new FundsHibernateDAO();
		List<FundsBean> list = dao.getAllFundsJSONtag(hashtag);
		for(FundsBean fb: list){
			DBUtils.displayData(fb);
			System.out.println("-------------------");
		}
	}

}
