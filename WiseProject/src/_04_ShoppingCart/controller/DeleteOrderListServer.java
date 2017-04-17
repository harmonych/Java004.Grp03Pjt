package _04_ShoppingCart.controller;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import _04_ShoppingCart.model.ShoppingCart;
// 當在購物清單按下刪除紐時會呼叫此程式
@WebServlet("/_04_ShoppingCart/deleteOrderList.do")
public class DeleteOrderListServer extends HttpServlet {
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
		ShoppingCart orderList = (ShoppingCart)session.getAttribute("OrderList");
		
		int delArtId = Integer.parseInt(request.getParameter("art_id"));
		orderList.deleteOrderListItem(delArtId);
		if(orderList.getOrderList().size() == 0){
			response.sendRedirect("https://goo.gl/f0ItZ5");
		}else{
			RequestDispatcher rd = request.getRequestDispatcher("../_15_ShoppingCart/ShoppingCart_List.jsp");
			rd.forward(request, response);
		}
		
		
	}
}
