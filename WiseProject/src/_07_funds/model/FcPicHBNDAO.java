package _07_funds.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _07_funds.util.HibernateUtil;

public class FcPicHBNDAO implements IFcPicDAO {

	@Override
	public int insert(FcPicBean fpb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.save(fpb);
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
	public int delete(int pic_id) {
		FcPicBean pb = new FcPicBean();
		pb.setPic_id(pic_id);
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
	public List<FcPicBean> getPicAddressJSON(int fc_id) {
		List<FcPicBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		String hql = "from FcPicBean where fc_id='"+fc_id+"\'";
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<FcPicBean> query=session.createQuery(hql);
			list = query.getResultList();
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
	
	int fc_id;
	public int getFc_id() {
		return fc_id;
	}

	public void setFc_id(int fc_id) {
		this.fc_id = fc_id;
	}

}
