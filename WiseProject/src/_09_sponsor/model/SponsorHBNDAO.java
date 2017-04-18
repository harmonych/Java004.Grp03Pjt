package _09_sponsor.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _01_register.util.HibernateUtil;
import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;


public class SponsorHBNDAO implements ISponsorDAO {
	int user_id;
	int spon_id;
	int fc_id;
	public int getUser_id(){
	
		return user_id;	
	
	}
	public void setUser_id(int userid){
	 
		this.user_id=userid;
		
	};
	public int getFc_id() {
		return fc_id;
	}
	public void setFc_id(int fcid) {
		this.fc_id = fcid;
	}
	
	@Override
	public int getSpon_id() {
		return spon_id;
	}
	
	@Override
	public void setSpon_id(int spon_id) {
		this.spon_id = spon_id;
	}
		
	@Override
	public int sponsor(SponsorBean sb) {
		int updateCount = 0;
		FundsBean fb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		IFundsDAO fdao = new FundsHibernateDAO();
		try{
			tx = session.beginTransaction();
			fb = fdao.findByPrimaryKey(sb.getFc_id());
			fb.setNow_money((fb.getNow_money()+sb.getSpon_money()));
			session.saveOrUpdate(fb);
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
	public SponsorBean FindByPrimaryKey(int spon_id) {
		SponsorBean sb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			sb=session.get(SponsorBean.class, spon_id);
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
	public List<SponsorBean> getAllByFcId(int fcid) {
		List<SponsorBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
//		String hql	= "SELECT b.user_name 'user_name', a.fc_id 'fc_id', a.spon_account 'spon_account', a.spon_mode ' spon_mode ', "
//				+ "		a.spon_money ' spon_money', a.spon_time 'spon_time ', a.user_id ' user_id' ";
		String hql	= "SELECT b.user_name, a.fc_id, a.spon_account, a.spon_mode, a.spon_money, a.spon_time, a.user_id ";
		hql += "FROM SponsorBean a JOIN MemberBean b ON a.user_id = b.user_id WHERE fc_id = " + fcid + " ORDER BY spon_time desc";
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<SponsorBean> query= session.createQuery(hql);
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
	//純list
	public List<SponsorBean> findAllByFcId(int fcid) {
		List<SponsorBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
//		String hql	= "SELECT b.user_name 'user_name', a.fc_id 'fc_id', a.spon_account 'spon_account', a.spon_mode ' spon_mode ', "
//				+ "		a.spon_money ' spon_money', a.spon_time 'spon_time ', a.user_id ' user_id' ";
		String hql	= "FROM SponsorBean WHERE fc_id = " + fcid + " ORDER BY spon_time desc";
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<SponsorBean> query= session.createQuery(hql);
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
		sb.setSpon_id(sponid);
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
	
	@Override
	public List<SponsorBean> getAllByUserId(int userId) {
		List<SponsorBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
				
//		String hql = " SELECT b.fc_name, a.* "; 
//		hql +=		 " FROM SponsorBean a JOIN FundsBean b ON a.fc_id = b.fc_id WHERE user_id = " + userid + " ORDER BY spon_time desc";
		String hql = "SELECT a.user_id, a.fc_id, b.fc_name, b.art_id, a.spon_account, a.spon_mode, a.spon_money, a.spon_time, b.end_time, b.now_money, b.fc_money ";
		hql += "FROM SponsorBean a JOIN FundsBean b ON a.fc_id = b.fc_id WHERE a.user_id = " + userId + " ORDER BY spon_time desc";
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
	

}
