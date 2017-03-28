package _11_message.model.fcmessage;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _00_init.HibernateUtil;

public class FcMsgHBNDAO implements IFcMessage {

	@Override
	public int insertmessage(FcMessageBean mb) {
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
	public FcMessageBean Messagequery(int pro_id) {
		FcMessageBean mb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			mb=session.get(FcMessageBean.class,pro_id);
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
	public int change(int msg_id) {
		int updateCount = 0;
		
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			FcMessageBean mb =session.get(FcMessageBean.class,msg_id);
			mb.setMsg_status(0);
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
	int pro_id;
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}

}
