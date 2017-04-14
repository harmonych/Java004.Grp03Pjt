package _10_search.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.google.gson.Gson;

import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;
import _01_register.model.IMemberDAO;
import _01_register.model.MemberBean;
import _01_register.model.MemberHibernateDAO;



/*
  1. 呼叫DAO類別(BookJDBC.java)來取得所有的書籍資料，這些書籍資料存放入List<BookBean>物件內
  2. 呼叫Gson的toJson()方法，將List<BookBean>內所有書籍資料全部轉換為JSON格式的陣列
  3. 要寫出JSON格式的資料必須撰寫下列兩行敘述:
  	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
  
 */
// 
@WebServlet("/_08_ImgSearch/searchAllArtist.json")
public class SearchAllArtistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			IMemberDAO dao = new MemberHibernateDAO();
			List<MemberBean> list = dao.getAllArtistSearch();
			String categoriesJson = new Gson().toJson(list); 
            out.write(categoriesJson);
            out.flush();
		} catch (Exception e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}
}
