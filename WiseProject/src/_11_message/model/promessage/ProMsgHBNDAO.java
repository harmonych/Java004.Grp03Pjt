package _11_message.model.promessage;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _00_init.HibernateUtil;


public class ProMsgHBNDAO implements IProMessage {

	int pro_id;
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	public int getPro_id() {
		return pro_id;
	}
	

	@Override
	public int insertmessage(ProMessageBean mb) {
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
	public List<ProMessageBean> Messagequery(int pro_id) {
		List<ProMessageBean> list = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<ProMessageBean> query = session.createQuery("FROM ProMessageBean WHERE pro_id = " + pro_id + " ORDER BY msg_time desc");
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
			ProMessageBean mb =session.get(ProMessageBean.class,msg_id);
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
