package _11_message.model.fcmessage;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _01_register.util.HibernateUtil;


public class FcMsgHBNDAO implements IFcMessage {

	int fc_id;
	@Override
	public void setFc_id(int fc_id) {
		this.fc_id = fc_id;
	}
	@Override
	public int getFc_id() {
		return fc_id;
	}

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
	public List<FcMessageBean> Messagequery(int fc_id) {
		List<FcMessageBean> list = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<FcMessageBean> query = session.createQuery("FROM FcMessageBean WHERE fc_id = " + fc_id + " ORDER BY msg_time desc");
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

}
