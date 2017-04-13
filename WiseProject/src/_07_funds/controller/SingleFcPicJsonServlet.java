package _07_funds.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import _07_funds.model.FcPicBean;
import _07_funds.model.FcPicHBNDAO;
import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFcPicDAO;
import _07_funds.model.IFundsDAO;


/*
1. 呼叫DAO類別(BookJDBC.java)來取得單筆書籍資料
2. 將前端程式送來的書籍記錄的主鍵值，經由DAO類別(BookJDBC.java)的setBookId(bookId);方法傳入DAO內
3. 呼叫DAO類別的getBookTextOnly()讀取由主鍵值指定的一筆書籍資料。由於書籍表格含有BLOB欄位，無法轉為JSON格式，
        所以getBookTextOnly()讀取非BLOB欄位的資料
4. 呼叫Gson的toJson()方法，將單一書籍資料轉換為JSON格式的物件
5. 要寫出JSON格式的資料必須撰寫下列兩行敘述:
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();

*/
//用fc_id找fc_pic資料表內的該fc_id所有物件
@WebServlet("/_07_funds/singleFcPic.json")

public class SingleFcPicJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SingleFcPicJsonServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int fc_id = Integer.parseInt(request.getParameter("fc_id").trim());
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		try {
			IFcPicDAO jdbc = new FcPicHBNDAO();
			jdbc.setFc_id(fc_id);
			List<FcPicBean> fb = jdbc.getPicAddressJSON(fc_id);			
			String singleFundsJson = new Gson().toJson(fb); 			
            out.write(singleFundsJson);
		} catch (Exception e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}
}
