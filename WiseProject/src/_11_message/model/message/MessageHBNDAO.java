package _11_message.model.message;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _01_register.model.MemberBean;
import _01_register.util.HibernateUtil;
import _11_message.model.promessage.ProMessageBean;


public class MessageHBNDAO implements IMessage {
	int r_user_id;
	int s_user_id;
	
	public int getR_user_id() {
		return r_user_id;
	}
	public void setR_user_id(int r_user_id) {
		this.r_user_id = r_user_id;
	}
	public int getS_user_id() {
		return s_user_id;
	}
	public void setS_user_id(int s_user_id) {
		this.s_user_id = s_user_id;
	}
	@Override
	public int insertmessage(MessageBean mb) {
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
	public int Checkreciever(String user_name){
		int check = 0;
		MemberBean fb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		String hql="select user_id from MemberBean where user_name='"+user_name+"'";
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TypedQuery<Integer> query = session.createQuery(hql);
			
			
			check = (int) query.getSingleResult();
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
		return check;
		
	}
	@Override
	public MessageBean findByPrimaryKey(int msg_id){
		MessageBean mb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			mb = session.get(MessageBean.class, msg_id);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
		return mb;
		
	}
	

	@Override
	public List<MessageBean> getMessagesByRId(int r_user_id) {
		List<MessageBean> list = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<MessageBean> query = session.createQuery("FROM MessageBean WHERE r_user_id = " + r_user_id + " ORDER BY msg_time desc");
			list = query.getResultList();
			// list =session.createQuery("from MemberBean").getResultList();
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
		return list;
	}
	
	@Override
	public List<MessageBean> getMessagesBySId(int s_user_id) {
		List<MessageBean> list = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<MessageBean> query = session.createQuery("FROM MessageBean WHERE s_user_id = " + s_user_id + " ORDER BY msg_time desc");
			list = query.getResultList();
			// list =session.createQuery("from MemberBean").getResultList();
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
		return list;
	}

	@Override
	public int changesender(int msg_id) {
		int updateCount = 0;
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			MessageBean mb =session.get(MessageBean.class,msg_id);
			mb.setS_msg_status(0);
			session.update(mb);
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
	public int changerecieve(int msg_id) {
		int updateCount = 0;
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			MessageBean mb =session.get(MessageBean.class,msg_id);
			mb.setR_msg_status(0);
			session.update(mb);
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

}
