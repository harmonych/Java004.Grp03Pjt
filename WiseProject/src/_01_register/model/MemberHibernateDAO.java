package _01_register.model;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.sql.DataSource;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import _01_register.util.HibernateUtil;

public class MemberHibernateDAO implements IMemberDAO {
	private List<MemberBean> memberList = getAllMember();

	synchronized public boolean checkExists(String data) throws IOException {

		boolean exist = false; // 檢查id是否已經存在
		for (MemberBean mb : memberList) {
			if (mb.getAccount().equals(data.trim()) 
				|| mb.getUser_name().equals(data.trim())
				||mb.getPhonenum().equals(data.trim())
				|| mb.getEmail().equals(data.trim())) {
				exist = true;
				break;
			}
		}
		return exist;
	}

	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int key) {
		this.user_id = key;
	}

	// public FundsHibernateDAO() {
	// try {
	// Context context = new InitialContext();
	// ds = (DataSource) context.lookup(SystemUtil.JNDI);
	// } catch (Exception ex) {
	// ex.printStackTrace();
	// }
	// }

	
	
	@Override
	public int insert(MemberBean mb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.save(mb);
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
	public int update(MemberBean mb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.saveOrUpdate(mb);
			// session.merge(mb);
			Hibernate.initialize(mb);
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
	public int delete(MemberBean mb) {
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(mb);
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
	public int delete(int key) {
		MemberBean mb = new MemberBean();
		mb.setUser_id(key);
		int updateCount = 0;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			session.delete(mb);
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
	public MemberBean findByPrimaryKey(int key) {
		MemberBean fb = null;
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			fb = session.get(MemberBean.class, key);
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			if (tx != null) {
				tx.rollback();
			}
		} finally {
			session.close();
		}
		return fb;
	}

	@Override
	public List<MemberBean> getAllMember() {
		List<MemberBean> list = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TypedQuery<MemberBean> query = session.createQuery("from MemberBean");
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
	public List<MemberBean> getAllArtistPortrait() {
		List<MemberBean> list = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TypedQuery<MemberBean> query = session.createQuery("SELECT a.file_name FROM MemberBean a JOIN ArtistBean b  ON a.user_id = b.user_id ");
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
	public List<MemberBean> getAllArtistUserName() {
		List<MemberBean> list = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TypedQuery<MemberBean> query = session.createQuery("SELECT a.user_name FROM MemberBean a JOIN ArtistBean b  ON a.user_id = b.user_id ");
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
	public List<MemberBean> getAllArtistArtId() {
		List<MemberBean> list = new ArrayList<>();
//		List<MemberBean> list2 = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TypedQuery<MemberBean> query = session.createQuery("SELECT b.art_id FROM MemberBean a JOIN ArtistBean b  ON a.user_id = b.user_id ");
			list = query.getResultList();
			// list =session.createQuery("from MemberBean").getResultList();
			Hibernate.initialize(list);
//			for ( MemberBean m : list){
//				m.setArt_id((m.getArtistbean().getArt_id()));
//				list2.add(m);
//				System.out.println("===");
//				System.out.println(m.getArt_id());
//			}
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
	public List<MemberBean> getAllArtistSearch() {
		List<MemberBean> list = new ArrayList<>();
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			TypedQuery<MemberBean> query = session.createQuery("SELECT b.art_id, a.file_name, a.user_name, b.hashtag FROM MemberBean a JOIN ArtistBean b  ON a.user_id = b.user_id ");
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
	DataSource ds;
	int user_id;

}
