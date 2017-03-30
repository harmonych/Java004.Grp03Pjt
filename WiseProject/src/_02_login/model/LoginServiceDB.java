package _02_login.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.persistence.TypedQuery;
import javax.sql.*;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _00_init.*;
import _01_register.model.ArtistBean;
import _01_register.model.MemberBean;
import _01_register.util.HibernateUtil;
public class LoginServiceDB implements LoginServiceDAO {
	static private List<MemberBean> memberList = new ArrayList<MemberBean>();
	private DataSource ds = null;

	public LoginServiceDB() throws NamingException, SQLException {
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup(GlobalService.JNDI_DB_NAME);
		if (memberList.isEmpty()) {
			populateMemberList(); // 此方法只會執行一次
		}
	}
	public MemberBean checkPassword(String user, String password) throws SQLException {
	SessionFactory factory = HibernateUtil.getSessionFactory();
	Session session = factory.openSession();
	Transaction tx = null;
	MemberBean rmb = null;
	try {
	tx = session.beginTransaction();
	String hql = "FROM MemberBean mb WHERE mb.account= ? and " 
				+ "mb.password= ?" ;
	TypedQuery<MemberBean> query = session.createQuery(hql);
	query.setParameter(0, user);
	query.setParameter(1, password);
	List<MemberBean> list = query.getResultList();
	Hibernate.initialize(list);
	tx.commit();
	for(MemberBean mb:list){
		rmb = mb;
	}
	} catch (Exception e) {
		e.printStackTrace();
		if (tx != null) {
			tx.rollback();
		}
	} finally {
		session.close();
	}

	return rmb;
	
	}
	public void populateMemberList() throws SQLException {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
		tx = session.beginTransaction();
		String hql = "FROM MemberBean" ;
		TypedQuery<MemberBean> query = session.createQuery(hql);
		List<MemberBean> list = query.getResultList();
		Hibernate.initialize(list);
		tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}	
	}

	public MemberBean checkIDPassword(String account, String password) {
		// 檢查userId與password是否正確
		for (MemberBean mb : memberList) {
			if (mb.getAccount().trim().equals(account.trim())) {
//				String encrypedString = GlobalService.encryptString(password.trim());
//				String pswd = GlobalService.getMD5Endocing(encrypedString);
				String mbpswd = mb.getPassword().trim();
				if (mbpswd.equals(password)) {
					return mb;
				}
			}
		}
		return null;
	}

	public List<MemberBean> getMemberList() {
		return memberList;
	}
	public void addNewMember(MemberBean mb) {
		memberList.add(mb);
	}
	
}
