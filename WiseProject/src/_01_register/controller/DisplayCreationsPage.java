package _01_register.controller;

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
import _01_register.model.MemberBean;
import _07_funds.model.FcPicBean;
import _07_funds.model.FcPicHBNDAO;
import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFcPicDAO;
import _07_funds.model.IFundsDAO;

@WebServlet("/_05_CreationsFreame/DisplayCreations")
public class DisplayCreationsPage extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	public DisplayCreationsPage() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IFundsDAO fdao = new FundsHibernateDAO();
		IFcPicDAO fpdao = new FcPicHBNDAO();
		IArtistDAO adao = new ArtistHibernateDAO();
		FundsBean fb = fdao.findByPrimaryKey(Integer.parseInt(req.getParameter("fc_id")));
		List<FcPicBean> fplist = fpdao.getPicAddressJSON(Integer.parseInt(req.getParameter("fc_id")));
		ArtistBean ab = adao.findByPrimaryKey((fb.getArt_id()));
		MemberBean mb = ab.getMemberbean();
//		FundsBean fb = fdao.findByPrimaryKey(Integer.parseInt(req.getPathInfo().substring(1)));
//		System.out.println(Integer.parseInt(req.getPathInfo().substring(1)));
		req.setAttribute("fpl", fplist);
		req.setAttribute("fb", fb);
		req.setAttribute("ab", ab);
		req.setAttribute("mb", mb);
		req.getRequestDispatcher("Fc_Info2.jsp").forward(req, resp);
	}
}
