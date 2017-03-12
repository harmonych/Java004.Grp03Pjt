package _01_register.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.sql.DataSource;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _01_register.util.HibernateUtil;





public class MemberHibernateDAO implements IMemberDAO {

	public int getUser_Id() {
		return user_Id;
	}

	public void setUser_Id(int key) {
		this.user_Id = key;
	}

//	public FundsHibernateDAO() {
//		try {
//			Context context = new InitialContext();
//			ds = (DataSource) context.lookup(SystemUtil.JNDI);
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
//	}
	
	@Override
	public int insert(MemberBean mb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.save(mb);
			updateCount = 1;
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return updateCount;
	}

	@Override
	public int update(MemberBean mb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.saveOrUpdate(mb);
			//session.merge(mb);
			Hibernate.initialize(mb);
			updateCount = 1;
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return updateCount;
	}

	@Override
	public int delete(MemberBean mb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(mb);
			updateCount = 1;
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return updateCount;
	}

	@Override
	public int delete(int key) {
		MemberBean mb = new MemberBean();
		mb.setUser_Id(key);
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(mb);
			updateCount = 1;
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return updateCount;
	}

	@Override
	public MemberBean findByPrimaryKey(int key) {
		MemberBean fb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			fb=session.get(MemberBean.class,key);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return fb;
	}

	@Override
	public List<MemberBean> getAllMemberJSON() {
		List<MemberBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<MemberBean> query=session.createQuery("from MemberBean");
			list = query.getResultList();
			//list =session.createQuery("from MemberBean").getResultList();
			Hibernate.initialize(list);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return list;
	}
	DataSource ds;
	int user_Id;


	
	
}
