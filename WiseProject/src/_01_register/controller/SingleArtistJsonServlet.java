package _01_register.controller;

import java.io.IOException;
import java.io.PrintWriter;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;
import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
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
@WebServlet("/_01_register/singleartist.json")
//以art_id來找特定一創作者
public class SingleArtistJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SingleArtistJsonServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int art_id = Integer.parseInt(request.getParameter("art_id").trim());
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("UTF-8");
		try {
			IArtistDAO jdbc = new ArtistHibernateDAO();
			jdbc.setArt_id(art_id);
			ArtistBean ab = jdbc.findByPrimaryKey(art_id);			
			String singleArtistJson = new Gson().toJson(ab);			
            out.write(singleArtistJson);
		} catch (Exception e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}
}
