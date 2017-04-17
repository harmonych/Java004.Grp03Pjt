//package _00_init.web;
//
//import javax.servlet.ServletContextEvent;
//import javax.servlet.ServletContextListener;
//import javax.servlet.annotation.WebListener;
//
//import _00_init.HibernateUtil;
//
//
//
//
//
//@WebListener
//public class HibernateListener implements ServletContextListener {
//	public void HibernateListener(){
//		
//	}
//		
//	public void contextDestroyed(ServletContextEvent arg0) {
//		HibernateUtil.close();
//	}
//
//	public void contextInitialized(ServletContextEvent arg0) {
//		new HibernateUtil();
//	}
//}