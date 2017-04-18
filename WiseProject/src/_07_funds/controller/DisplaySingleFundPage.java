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
import _01_register.model.MemberBean;
import _07_funds.model.FcPicBean;
import _07_funds.model.FcPicHBNDAO;
import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFcPicDAO;
import _07_funds.model.IFundsDAO;
import _09_sponsor.model.ISponsorDAO;
import _09_sponsor.model.SponsorBean;
import _09_sponsor.model.SponsorHBNDAO;

@WebServlet("/_11_Fc_info/DisplayFund")
public class DisplaySingleFundPage extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	public DisplaySingleFundPage() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IFundsDAO fdao = new FundsHibernateDAO();
		IFcPicDAO fpdao = new FcPicHBNDAO();
		IArtistDAO adao = new ArtistHibernateDAO();
		//判斷是否贊助過
		ISponsorDAO sdao = new SponsorHBNDAO();
		int fc_id = Integer.parseInt(req.getParameter("fc_id"));
		FundsBean fb = fdao.findByPrimaryKey(fc_id);
		List<FcPicBean> fplist = fpdao.getPicAddressJSON(fc_id);
		ArtistBean ab = adao.findByArtId((fb.getArt_id()));
		MemberBean mb = ab.getMemberbean();
		List<SponsorBean> slist= sdao.findAllByFcId(fc_id);
		for (SponsorBean s: slist){
		System.out.println(s.getUser_id());
		}
//		FundsBean fb = fdao.findByPrimaryKey(Integer.parseInt(req.getPathInfo().substring(1)));
//		System.out.println(Integer.parseInt(req.getPathInfo().substring(1)));
		req.setAttribute("sl", slist);
		req.setAttribute("fpl", fplist);
		req.setAttribute("fb", fb);
		req.setAttribute("ab", ab);
		req.setAttribute("mb", mb);
		req.getRequestDispatcher("Fc_Info2.jsp").forward(req, resp);
	}
}
