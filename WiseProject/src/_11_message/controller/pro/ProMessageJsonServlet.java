package _11_message.controller.pro;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import _11_message.model.promessage.IProMessage;
import _11_message.model.promessage.ProMessageBean;
import _11_message.model.promessage.ProMsgHBNDAO;

/*
  1. 呼叫DAO類別(BookJDBC.java)來取得所有的書籍資料，這些書籍資料存放入List<BookBean>物件內
  2. 呼叫Gson的toJson()方法，將List<BookBean>內所有書籍資料全部轉換為JSON格式的陣列
  3. 要寫出JSON格式的資料必須撰寫下列兩行敘述:
  	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
  
 */
// 
@WebServlet("/_11_message/promessage.json")
public class ProMessageJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		int pro_id = 0;
		pro_id = Integer.parseInt(request.getParameter("pro_id").trim());
		try {
			IProMessage dao = new ProMsgHBNDAO();
			dao.setPro_id(pro_id);
			ProMessageBean mb = dao.Messagequery(pro_id);
			
//			for (FundsBean temp : list) {
//				System.out.println(temp.getArtid());
//			}
			
			String msg = new Gson().toJson(mb);
			
			
            out.write(msg);
            out.flush();
		} catch (Exception e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}
}
