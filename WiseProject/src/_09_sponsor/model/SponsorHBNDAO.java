package _09_sponsor.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _00_init.HibernateUtil;





public class SponsorHBNDAO implements ISponsorDAO {

	@Override
	public int sponsor(SponsorBean sb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.save(sb);
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
	public SponsorBean sponsorquery(int userid) {
		SponsorBean sb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			sb=session.get(SponsorBean.class,userid);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return sb;
	}
	@Override
	public List<SponsorBean> getAllbyfcJSON(int fcid) {
		List<SponsorBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
				
		String hql = "from SponsorBean where fcid = "+fcid;
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<SponsorBean> query=session.createQuery(hql);
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
	public int cancel(int sponid) {
		SponsorBean sb = new SponsorBean();
		sb.setSponid(sponid);
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(sb);
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
	
	int userid;
	public int getUserid(){
	
		return userid;	
	
	}
	public void setUserid(int userid){
	 
		this.userid=userid;
		
	};
	int fcid;
	public int getFcid() {
		return fcid;
	}
	public void setFcid(int fcid) {
		this.fcid = fcid;
	}
}
