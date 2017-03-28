package _11_message.model.message;

import javax.persistence.Query;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _00_init.HibernateUtil;
import _01_register.model.MemberBean;


public class MessageHBNDAO implements IMessage {

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
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			fb = session.get(MemberBean.class, user_name);
			check =fb.getUser_id();
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
	public MessageBean Messagequery(int r_user_id) {
		MessageBean mb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			mb=session.get(MessageBean.class,r_user_id);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return mb;
	}
	
	@Override
	public MessageBean Messagerecievequery(int s_user_id) {
		MessageBean mb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			mb=session.get(MessageBean.class,s_user_id);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return mb;
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
			mb.setS_msg_state(0);
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
			mb.setR_msg_state(0);
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
	int  r_user_id;
	
	public void setR_user_id(int r_user_id) {
		this.r_user_id = r_user_id;
	}
}
