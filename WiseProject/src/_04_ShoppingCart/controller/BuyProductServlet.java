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
import _04_ShoppingCart.model.OrderBean;
import _04_ShoppingCart.model.ShoppingCart;
@WebServlet("/_04_ShoppingCart/OrderList.do")
public class BuyProductServlet extends HttpServlet {
	// 當使用者按下『加入購物車』時，瀏覽器會送出請求到本程式
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession(false);
		if (session == null) {      // 使用逾時
			request.setAttribute("Errors", "使用逾時，請重新登入(SessionTimeOut)");
			RequestDispatcher rd = request.getRequestDispatcher("/_02_login/login.jsp");
			rd.forward(request, response);
			return;
		}
		// 取出存放在session物件內的ShoppingCart物件
		ShoppingCart cart = (ShoppingCart)session.getAttribute("ShoppingCart");
		ShoppingCart orderList = (ShoppingCart)session.getAttribute("OrderList");
		// 如果找不到ShoppingCart物件
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 將此新建ShoppingCart的物件放到session物件內
			session.setAttribute("ShoppingCart", cart);   // ${ShoppingCart.zzz}
		// 如果找不到orderList物件
		}
		if(orderList == null){
			// 就新建orderList物件
			orderList = new ShoppingCart();
			// 將此新建orderList的物件放到session物件內
			session.setAttribute("OrderList", orderList);   // ${ShoppingCart.zzz}
		}
		String user_id_str		= request.getParameter("user_id");
		String pro_id_str		= request.getParameter("pro_id");
		String art_id_str 		= request.getParameter("art_id");
		String price_str 		= request.getParameter("price");
		String pro_name 	= request.getParameter("pro_name");
		String ord_amount_str 	= request.getParameter("ord_amount");
		
		
		int user_id = 0 ; 
		int pro_id = 0 ;
		int art_id = 0 ;
		int price = 0 ;
		int ord_amount = 0 ;
		
		try{
			 //進行資料型態的轉換
			user_id = Integer.parseInt(user_id_str.trim());
			pro_id = Integer.parseInt(pro_id_str.trim());
			art_id = Integer.parseInt(art_id_str.trim());
			price = Integer.parseInt(price_str.trim());
			ord_amount = Integer.parseInt(ord_amount_str.trim());
			System.out.println("user_id" + user_id);
			System.out.println("pro_id" + pro_id);
			System.out.println("art_id" + art_id);
			System.out.println("price" + price);
			System.out.println("ord_amount" + ord_amount);
			
		} catch(NumberFormatException e){
			throw new ServletException(e); 
		}
		// 將訂單資料封裝到OrderBean內
		IArtistDAO aDAO = new ArtistHibernateDAO();
		ArtistBean ab = aDAO.findByArtId(art_id);
		String artUserName =  ab.getMemberbean().getUser_name();
		OrderBean ob = new OrderBean(user_id, art_id, artUserName, "", 0, 0, "", 0, 1,
									pro_id, pro_name, price, ord_amount);
		
		
		// 將OrderItemBean加入ShoppingCart的物件內
		cart.addToCart(pro_id, ob);
		orderList.addOrderList(art_id, ob);
		RequestDispatcher rd = request.getRequestDispatcher("../_15_ShoppingCart/ShoppingCart_List.jsp");
		rd.forward(request, response);
	}
}