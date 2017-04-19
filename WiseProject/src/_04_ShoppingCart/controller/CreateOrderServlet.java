package _04_ShoppingCart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;
import _04_ShoppingCart.model.IOrderDAO;
import _04_ShoppingCart.model.IOrderItemDAO;
import _04_ShoppingCart.model.OrderBean;
import _04_ShoppingCart.model.OrderHibernateDAO;
import _04_ShoppingCart.model.OrderItemBean;
import _04_ShoppingCart.model.OrderItemHibernateDAO;
import _04_ShoppingCart.model.ShoppingCart;
@WebServlet("/_04_ShoppingCart/CreateOrder.do")
public class CreateOrderServlet extends HttpServlet {
	//當使用者按下確認訂購時呼叫此程式
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		if (session == null) {      // 使用逾時
			request.setAttribute("Errors", "使用逾時，請重新登入(SessionTimeOut)");
			RequestDispatcher rd = request.getRequestDispatcher("/_02_login/login.jsp");
			rd.forward(request, response);
			return;
		}
		// 取出存放在session物件內的ShoppingCart物件
		
		ShoppingCart orderList = (ShoppingCart)session.getAttribute("OrderList");
		ShoppingCart checkoutlist = (ShoppingCart)session.getAttribute("CheckOutList");
		
		if(orderList == null){
			// 就新建orderList物件
			orderList = new ShoppingCart();
			// 將此新建orderList的物件放到session物件內
			session.setAttribute("OrderList", orderList);   // ${ShoppingCart.zzz}
		}
				
		
		
		String real_name	= request.getParameter("real_name");
		String address		= request.getParameter("address");
		String phone 		= request.getParameter("phone");
		String payment 		= request.getParameter("payment");
		String transport 	= request.getParameter("transport");
		int order_id 		= 0;
		int user_id 		= 0;
		int art_id			= 0;
		int total			= 0;
		int pro_id			= 0;
		int ord_amount		= 0;
		double discount = 0.0;
		
		// 從checkoutlist取出訂單必需資訊
		for (OrderBean ob1 : checkoutlist.getCheckoutlist().values()){
			user_id = ob1.getUser_id();
			art_id = ob1.getArt_id();
			total = ob1.getTotal();
		}
		// 將訂單資料封裝到OrderBean內，並將ob存入資料庫。
				OrderBean ob = new OrderBean(user_id, art_id, 0, real_name,
								total, address, phone, transport, payment);
				IOrderDAO orderDAO = new OrderHibernateDAO();
				orderDAO.insert(ob);
				// 取出ob存入資料庫後自動產生order_id
				order_id = ob.getOrder_id();
		
		OrderItemBean oib = null;
		IOrderItemDAO orderItemDAO = new OrderItemHibernateDAO();
		// 從checkoutlist取出訂單細項必需資訊
		for (OrderBean ob2 : checkoutlist.getCheckoutlist().values()){
		pro_id = ob2.getPro_id();
		ord_amount = ob2.getOrd_amount();
		// 將訂單細項資料封裝到OrderItemBean內,並將oib存入資料庫
		oib = new OrderItemBean(order_id, pro_id, ord_amount, discount);
		orderItemDAO.insert(oib);
		//刪除結帳清單內已結帳商品的Session
		checkoutlist.deleteProduct(pro_id);
		}
		
		//刪除訂單清單內已結帳訂單的Session
		orderList.deleteOrderListItem(art_id);
		
		
		RequestDispatcher rd = request.getRequestDispatcher("../_15_ShoppingCart/Shopping_OK.jsp");
		rd.forward(request, response);
	}
}