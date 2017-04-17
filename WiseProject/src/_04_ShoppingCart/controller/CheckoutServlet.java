package _04_ShoppingCart.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

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
import _08_product.model.IProPicDAO;
import _08_product.model.ProPicBean;
import _08_product.model.ProPicHBNDAO;
@WebServlet("/_04_ShoppingCart/Checkout.do")
public class CheckoutServlet extends HttpServlet {
	// 當使用者查看結帳清單時，瀏覽器會送出請求到本程式
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
		ShoppingCart checkoutlist = (ShoppingCart)session.getAttribute("CheckOutList");
		IProPicDAO dao = new ProPicHBNDAO();
		List<ProPicBean> pbl = new ArrayList<>();
		List<ProPicBean> adrlist = new ArrayList<>();
		int i =0;
		int loop =0;
		   
		
		// 如果找不到ShoppingCart物件
		if (cart == null) {
			// 就新建ShoppingCart物件
			cart = new ShoppingCart();
			// 將此新建ShoppingCart的物件放到session物件內
			session.setAttribute("ShoppingCart", cart);   // ${ShoppingCart.zzz}
		
		}
		// 如果找不到CheckOutList物件
		if (checkoutlist == null) {
			// 就新建CheckOutList物件
			checkoutlist = new ShoppingCart();
			// 將此新建CheckOutList的物件放到session物件內
			session.setAttribute("CheckOutList", checkoutlist);   // ${CheckOutList.zzz}
		
		}
		
		int art_id = Integer.parseInt(request.getParameter("art_id"));
		
		System.out.println("******"+art_id+"*****");
		
		
		
		checkoutlist.addCheckOutList(art_id, cart);
		request.setAttribute("total", checkoutlist.getTotal());
		
		for (OrderBean ob3 : checkoutlist.getCheckoutlist().values()) {  
			  
			   System.out.println("=================================");
			   System.out.println("ob3");
			   System.out.println(ob3.getArt_id());
			   System.out.println(ob3.getArt_id());
			   System.out.println(ob3.getPro_id());
			  
			   
			   System.out.println(ob3.getPro_name());
			   System.out.println(ob3.getArt_user_name());
			   System.out.println("=================================");
			  
			}  
		for (ProPicBean pp:pbl){
			if(pp.getPro_id() != i && i!=0){
				i = pp.getPro_id();
				adrlist.add(pp);
				loop++;
			}else if(pp.getPro_id() != i && i==0){
				i = pp.getPro_id();
				adrlist.add(pp);
				loop++;
			}
		}
		request.setAttribute("loop", loop);
		request.setAttribute("pbl", pbl);
		RequestDispatcher rd = request.getRequestDispatcher("../_15_ShoppingCart/ShoppingCart_Order.jsp");
		rd.forward(request, response);
	}
}