package _07_funds.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.sql.DataSource;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;
import _07_funds.util.HibernateUtil;




public class FundsHibernateDAO implements IFundsDAO {

	public int getFc_id() {
		return fc_id;
	}

	public void setFc_id(int fcid) {
		this.fc_id = fcid;
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
	public int insert(FundsBean pb) {
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
	public int update(FundsBean pb) {
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
	public int delete(FundsBean pb) {
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
		FundsBean pb = new FundsBean();
		pb.setFc_id(key);
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
	public FundsBean findByPrimaryKey(int key) {
		FundsBean fb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			fb=session.get(FundsBean.class,key);
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
	public String findArtNameByFcId(int fc_id) {
		FundsBean fb = null;
		String user_name = "";
		IArtistDAO idao = new ArtistHibernateDAO();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			fb=session.get(FundsBean.class, fc_id);
			user_name = idao.findArtNameByArtId(fb.getArt_id());			
//			System.out.println("-------------------------------------------");
//			System.out.println(ab.getArt_id());
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return user_name;
	}
	@Override
	public List<FundsBean> getAllFundsByArtId(int art_id) {
		List<FundsBean> list =new ArrayList<FundsBean>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<FundsBean> query=session.createQuery("from FundsBean where art_id is "+ art_id);
			list = query.getResultList();
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
	public List<FundsBean> getAllFundsJSON() {
		List<FundsBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<FundsBean> query=session.createQuery("from FundsBean");
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
	public List<FundsBean> getAllFundsJSONtag(String search) {
		List<FundsBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		String hql = "from FundsBean where (fc_name like \'%"+search+"%\' or hashtag like \'%"+search+"%\')";
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<FundsBean> query=session.createQuery(hql);
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
	public int getNewFcid(int artid) {
		int fcid = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		String hql = "select max(fc_id) from FundsBean where art_id="+artid+"";
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			Query<FundsBean> query=session.createQuery(hql);
			fcid = (int) ((Query) query).uniqueResult();
			//list =session.createQuery("from FundsBean").getResultList();
			
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return fcid;
	}
	
	
	DataSource ds;
	int fc_id;

	
	
}
