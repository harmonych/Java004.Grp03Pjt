package _07_fund;

import _07_fund.model.FundHibernateDAO;
import _07_fund.model.IFundsDAO;

public class FundDeleteMain {

	public static void main(String[] args) {
		IFundsDAO dao = new FundHibernateDAO();
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
