package _08_product.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;
import _08_product.model.IProductDAO;
import _08_product.model.ProductBean;
import _08_product.model.ProductHibernateDAO;


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
@WebServlet("/_08_product/singleproduct.json")

public class SingleProJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SingleProJsonServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int proid = 1;
		//fcid = Integer.parseInt(request.getParameter("fcid").trim());
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		try {
			IProductDAO dao = new ProductHibernateDAO();
			List<ProductBean> list = dao.getAllProductJSON();
			dao.setPro_Id(proid);
			ProductBean fb = dao.findByPrimaryKey(proid);

			
			String singleFundsJson = new Gson().toJson(fb); 
			
            out.write(singleFundsJson);
		} catch (Exception e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}
}
