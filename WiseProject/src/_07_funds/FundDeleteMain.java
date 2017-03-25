package _07_funds;

import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;

public class FundDeleteMain {

	public static void main(String[] args) {
		IFundsDAO dao = new FundsHibernateDAO();
		int n = dao.delete(3);
		if (n == 1) {
			System.out.println("刪除一筆紀錄");
		} else {
			System.out.println("未刪除任何紀錄");
		}
		System.out.println("----------------------------");
		n = dao.delete(300);
		if (n == 1) {
			System.out.println("刪除一筆紀錄");
		} else {
			System.out.println("未刪除任何紀錄");
		}
	}
}
