package _04_ShoppingCart.model;


import java.util.ArrayList;
import java.util.List;
import javax.persistence.TypedQuery;
import javax.sql.DataSource;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import _04_ShoppingCart.util.HibernateUtil;




public class OrderItemHibernateDAO implements IOrderItemDAO {

	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderItemDAO#getOrder_id()
	 */
	@Override
	public int getOrderItem_id() {
		return orderItem_id;
	}

	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderItemDAO#setOrder_id(int)
	 */
	@Override
	public void setOrderItem_id(int orderItem_id) {
		this.orderItem_id = orderItem_id;
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
	 * @see _04_ShoppingCart.model.IOrderItemDAO#insert(_04_ShoppingCart.model.OrderBean)
	 */
	@Override
	public int insert(OrderItemBean oib) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.save(oib);
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
	 * @see _04_ShoppingCart.model.IOrderItemDAO#update(_04_ShoppingCart.model.OrderBean)
	 */
	@Override
	public int update(OrderItemBean oib) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.update(oib);
			Hibernate.initialize(oib);
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
	 * @see _04_ShoppingCart.model.IOrderItemDAO#delete(_04_ShoppingCart.model.OrderBean)
	 */
	@Override
	public int delete(OrderItemBean oib) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(oib);
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
	 * @see _04_ShoppingCart.model.IOrderItemDAO#delete(int)
	 */
	@Override
	public int delete(int key) {
		OrderItemBean oib = new OrderItemBean();
		oib.setOrder_id(key);
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			session.delete(oib);
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
	 * @see _04_ShoppingCart.model.IOrderItemDAO#findByPrimaryKey(int)
	 */
	@Override
	public OrderItemBean findByPrimaryKey(int key) {
		OrderItemBean oib = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			oib=session.get(OrderItemBean.class,key);
			tx.commit();
		}catch(Exception e){
			e.printStackTrace();
			if(tx!=null){
				tx.rollback();
			}
		}finally{
			session.close();
		}
		return oib;
	}

	/* (non-Javadoc)
	 * @see _04_ShoppingCart.model.IOrderItemDAO#getAllOrderItemJSON()
	 */
	@Override
	public List<OrderItemBean> getAllOrderItemJSON() {
		List<OrderItemBean> list =new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try{
			tx = session.beginTransaction();
			TypedQuery<OrderItemBean> query=session.createQuery("from OrderItemBean");
			list = query.getResultList();
			//list =session.createQuery("from OrderBean").getResultList();
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
	int orderItem_id ;

	
	
}
