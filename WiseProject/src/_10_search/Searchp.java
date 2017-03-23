package _10_search;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import _00_init.GlobalService;
import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;
import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;
import _08_product.model.IProductDAO;
import _08_product.model.ProductBean;
import _08_product.model.ProductHibernateDAO;


	@WebServlet("/_10_search/searchp.json")
	public class Searchp extends HttpServlet {

		protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/json; charset=utf-8");
			PrintWriter out = response.getWriter();

			HttpSession session = request.getSession();
			Collection<Part> parts = request.getParts(); // 取出HTTP multipart
															// request內所有的parts
			GlobalService.exploreParts(parts, request);
			String hashtag = "";
			
			if (parts != null) { // 如果這是一個上傳資料的表單
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);
					
					// 1. 讀取使用者輸入資料
					if (p.getContentType() == null) {
						if (fldName.equals("hashtag")) {
							hashtag = value;
						}

							try {
								IProductDAO dao = new ProductHibernateDAO();
								List<ProductBean> list = dao.getAllProductJSONtag(hashtag);
								String pJson = new Gson().toJson(list);
								out.write(pJson);
								out.flush();
							} catch (Exception e) {
								throw new ServletException("DB error", e);
							} finally {
								out.close();
							}
						}
						
					
				}
			}
		}
	}

