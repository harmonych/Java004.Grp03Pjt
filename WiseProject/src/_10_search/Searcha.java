package _10_search;

import java.io.IOException;
import java.io.PrintWriter;


import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

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

		String hashtag = request.getParameter("search");

		try {
			IArtistDAO dao = new ArtistHibernateDAO();
			List<ArtistBean> list = dao.getAllArtisttag(hashtag);
			
			String aJson = new GsonBuilder().excludeFieldsWithoutExposeAnnotation().create().toJson(list);
			
			out.write(aJson);
			out.flush();
		} catch (Exception e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}

	}

}
