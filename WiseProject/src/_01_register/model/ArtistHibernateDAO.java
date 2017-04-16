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

public class ArtistHibernateDAO implements IArtistDAO {
	DataSource ds;
	int user_id;
	int art_id;
	@Override
	public int getArt_id() {
		return art_id;
	}
	@Override
	public void setArt_id(int art_id) {
		this.art_id = art_id;
	}

	@Override
	public int getUser_id() {
		return user_id;
	}

	@Override
	public void setUser_id(int user_id) {
		this.user_id = user_id;		
	}
	@Override
	public int insert(MemberBean mb, ArtistBean ab) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			mb.setArtistbean(ab);
			ab.setMemberbean(mb);
			
			session.save(mb);
			session.save(ab);
			updateCount = 1;
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
		return updateCount;
	}
	
	@Override
	public int insert(ArtistBean ab) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.save(ab);
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
	public int update(ArtistBean ab) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.saveOrUpdate(ab);
			//session.merge(ab);
			Hibernate.initialize(ab);
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
	public int update(MemberBean mb, ArtistBean ab) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.saveOrUpdate(mb);
			session.saveOrUpdate(ab);
			//session.merge(ab);
			Hibernate.initialize(mb);
			Hibernate.initialize(ab);
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
	public int delete(ArtistBean ab) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(ab);
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
		ArtistBean ab = new ArtistBean();
		ab.setArt_id(key);
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(ab);
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
	public ArtistBean findByArtId(int art_id) {
		ArtistBean ab = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		String hql = " from ArtistBean where art_id = " + art_id + " )";
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<ArtistBean> query = session.createQuery(hql);
			List<ArtistBean> list = query.getResultList();
			Hibernate.initialize(list);
			tx.commit();
			ab = list.get(0);
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return ab;
	}

	@Override
	public List<ArtistBean> getAllArtist() {
		List<ArtistBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<ArtistBean> query = session.createQuery("from ArtistBean");
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
	public List<ArtistBean> getAllArtisttag(String search) {
		List<ArtistBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		String hql = " FROM ArtistBean WHERE (memberbean.user_name like  \'%"+search+"%\' or hashtag like  \'%"+search+"%\' )";
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<ArtistBean> query=session.createQuery(hql);
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

	@Override
	public String findArtNameByArtId(int art_id) {
		ArtistBean ab = null;
		String user_name = "";
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		String hql = " from ArtistBean where art_id = " + art_id + " )";
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<ArtistBean> query = session.createQuery(hql);
			List<ArtistBean> list = query.getResultList();
			Hibernate.initialize(list);
			tx.commit();
			ab = list.get(0);
			if(ab!=null){
				user_name = ab.getMemberbean().getUser_name();
				System.out.println(user_name);
			}
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
	public String findArtPortraitByArtId(int art_id) {
		ArtistBean ab = null;
		String file_name = "";
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		String hql = " from ArtistBean where art_id = " + art_id + " )";
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<ArtistBean> query = session.createQuery(hql);
			List<ArtistBean> list = query.getResultList();
			Hibernate.initialize(list);
			tx.commit();
			ab = list.get(0);
			if(ab!=null){
				file_name = ab.getMemberbean().getFile_name();
				System.out.println(file_name);
			}
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return file_name;
	}



	
}
