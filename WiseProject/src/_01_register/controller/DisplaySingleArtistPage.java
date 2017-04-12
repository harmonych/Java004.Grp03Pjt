package _01_register.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;

@WebServlet("/_05_CreationsFrame/DisplayArtist")
public class DisplaySingleArtistPage extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	public DisplaySingleArtistPage() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IArtistDAO adao = new ArtistHibernateDAO();
		ArtistBean ab = adao.findByPrimaryKey(Integer.parseInt(req.getParameter("art_id")));
//		System.out.println(Integer.parseInt(req.getPathInfo().substring(1)));
		req.setAttribute("ab", ab);
		req.getRequestDispatcher("CreationsPage2.jsp").forward(req, resp);
	}

	
}
