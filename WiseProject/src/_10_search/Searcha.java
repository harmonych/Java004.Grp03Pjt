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



	@WebServlet("/_10_search/searcha.json")
	public class Searcha extends HttpServlet {

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
//			String checkboxf = "";
//			String checkboxa = "";
//			String checkboxp = "";
			if (parts != null) { // 如果這是一個上傳資料的表單
				for (Part p : parts) {
					String fldName = p.getName();
					String value = request.getParameter(fldName);
//					checkboxf = request.getParameter("checkboxfund");
//					checkboxa = request.getParameter("checkboxart");
//					checkboxp = request.getParameter("checkboxproduct");
					// 1. 讀取使用者輸入資料
					if (p.getContentType() == null) {
						if (fldName.equals("hashtag")) {
							hashtag = value;
						}

				
						
//						if (checkboxa != (null)) {
							try {
								IArtistDAO dao = new ArtistHibernateDAO();
								List<ArtistBean> list = dao.getAllArtisttag(hashtag);
								String aJson = new Gson().toJson(list);
								out.write(aJson);
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