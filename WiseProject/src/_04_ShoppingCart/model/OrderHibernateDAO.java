package _04_ShoppingCart.model;


import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.TypedQuery;
import javax.sql.DataSource;
import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _01_register.model.ArtistBean;
import _01_register.model.MemberBean;
import _04_ShoppingCart.util.HibernateUtil;
import _08_product.model.ProductBean;





public class OrderHibernateDAO implements IOrderDAO {

	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderDAO#getOrder_id()
	 */
	@Override
	public int getOrder_id() {
		return order_id;
	}

	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderDAO#setOrder_id(int)
	 */
	@Override
	public void setOrder_id(int orderid) {
		this.order_id = orderid;
	}

//	public FundsHibernateDAO() {
//		try {
//			Context context = new InitialContext();
//			ds = (DataSource) context.lookup(SystemUtil.JNDI);
//		} catch (Exception ex) {
//			ex.printStackTrace();
//		}
//	}
	
	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderDAO#insert(_04_ShoppingCart.model.OrderBean)
	 */
	@Override
	public int insert(OrderBean ob) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			
			session.save(ob);
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
	
	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderDAO#update(_04_ShoppingCart.model.OrderBean)
	 */
	@Override
	public int update(OrderBean ob) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.update(ob);
			//session.saveOrUpdate(ob);
			//session.merge(ob);
			Hibernate.initialize(ob);
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

	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderDAO#delete(_04_ShoppingCart.model.OrderBean)
	 */
	@Override
	public int delete(OrderBean ob) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(ob);
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

	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderDAO#delete(int)
	 */
	@Override
	public int delete(int key) {
		OrderBean ob = new OrderBean();
		ob.setOrder_id(key);
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(ob);
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

	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderDAO#findByPrimaryKey(int)
	 */
	@Override
	public OrderBean findByPrimaryKey(int key) {
		OrderBean ob = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			ob=session.get(OrderBean.class,key);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return ob;
	}
	
	

	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderDAO#getAllOrderJSON()
	 */
	@Override
	public List<OrderBean> getAllOrderJSON() {
		List<OrderBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<OrderBean> query=session.createQuery("from OrderBean");
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
	
	
	
	
	
	DataSource ds;
	int order_id;

	
	
}
