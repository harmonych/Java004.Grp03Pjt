package _08_product.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.persistence.TypedQuery;
import javax.sql.DataSource;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _08_product.util.HibernateUtil;






public class ProductHibernateDAO implements IProductDAO {

	public int getPro_Id() {
		return pro_id;
	}

	public void setPro_Id(int proid) {
		this.pro_id = proid;
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
	public int insert(ProductBean pb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.save(pb);
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
	public int update(ProductBean pb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.update(pb);
			//session.saveOrUpdate(pb);
			//session.merge(pb);
			Hibernate.initialize(pb);
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
	public int delete(ProductBean pb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(pb);
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
		ProductBean pb = new ProductBean();
		pb.setPro_id(key);
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(pb);
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
	public ProductBean findByPrimaryKey(int key) {
		ProductBean fb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			fb=session.get(ProductBean.class,key);
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
	public List<ProductBean> getAllProductJSON() {
		List<ProductBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<ProductBean> query=session.createQuery("from ProductBean");
			list = query.getResultList();
			//list =session.createQuery("from FundsBean").getResultList();
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
	@Override
	public List<ProductBean> getAllProductJSONtag(String search) {
		List<ProductBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		String hql =" from ProductBean where (pro_name like \'%"+search+"%\' or hashtag like \'%"+search+"%\')";
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<ProductBean> query=session.createQuery(hql);
			list = query.getResultList();
			//list =session.createQuery("from FundsBean").getResultList();
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
	int pro_id;

	
	
}
