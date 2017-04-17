package _07_funds.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;


@WebServlet("/_10_Fc_Create/CreateFund")
public class DisplaySingleFundCreatePage extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	public DisplaySingleFundCreatePage() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IArtistDAO adao = new ArtistHibernateDAO();
		ArtistBean ab = adao.findByArtId(Integer.parseInt(req.getParameter("art_id")));
//		FundsBean fb = fdao.findByPrimaryKey(Integer.parseInt(req.getPathInfo().substring(1)));
//		System.out.println(Integer.parseInt(req.getPathInfo().substring(1)));
		
		req.setAttribute("ab", ab);
		
		req.getRequestDispatcher("Fc_Create_NEW.jsp").forward(req, resp);
	}
}
