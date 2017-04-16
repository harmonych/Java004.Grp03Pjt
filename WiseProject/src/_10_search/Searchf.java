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


import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;



@WebServlet("/_10_search/search.json")
public class Searchf extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();

		HttpSession session = request.getSession();
	
		String hashtag =request.getParameter("search");
		
				
						try {
							IFundsDAO dao = new FundsHibernateDAO();
							List<FundsBean> list = dao.getAllFundsJSONtag(hashtag);
							String fJson = new Gson().toJson(list);
													
							out.write(fJson);
							out.flush();
						} catch (Exception e) {
							throw new ServletException("DB error", e);
						} finally {
							out.close();
						}
					
					
				}
			}
		
