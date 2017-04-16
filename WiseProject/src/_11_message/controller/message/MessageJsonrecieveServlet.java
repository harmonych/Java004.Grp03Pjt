package _11_message.controller.message;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import _11_message.model.message.IMessage;
import _11_message.model.message.MessageBean;
import _11_message.model.message.MessageHBNDAO;




/*
  1. 呼叫DAO類別(BookJDBC.java)來取得所有的書籍資料，這些書籍資料存放入List<BookBean>物件內
  2. 呼叫Gson的toJson()方法，將List<BookBean>內所有書籍資料全部轉換為JSON格式的陣列
  3. 要寫出JSON格式的資料必須撰寫下列兩行敘述:
  	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
  
 */
// 
@WebServlet("/_11_message/messager.json")
public class MessageJsonrecieveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		int r_user_id = 0;
		r_user_id = Integer.parseInt(request.getParameter("r_user_id").trim());
		try {
			IMessage dao = new MessageHBNDAO();
			dao.setR_user_id(r_user_id);
			
//			MessageBean mbs = dao.Messagerecievequery(r_user_id);
//			for (FundsBean temp : list) {
//				System.out.println(temp.getArtid());
//			}
//			String msgs = new Gson().toJson(mbs); 
			
//            out.write(msgs);
            out.flush();
		} catch (Exception e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}
}
