package _09_sponsor.controller;

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
import com.google.gson.GsonBuilder;

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

//unfinished
@WebServlet("/_17_Fc_List/allSponsorByUser.do")
public class SponsorByUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
	    int user_id = Integer.parseInt(request.getParameter("user_id").trim());
	    ISponsorDAO dao = new SponsorHBNDAO();
	    IFundsDAO fdao = new FundsHibernateDAO();
	    List<FundsBean> flist = new ArrayList<>();
	    List<SponsorBean> list = dao.getAllByUserId(user_id);
	    for (SponsorBean b : list){
	    	 flist.add(fdao.findByPrimaryKey((b.getFc_id())));
	    	 
	    }
//		IFundsDAO fdao = new FundsHibernateDAO();
//		IFcPicDAO fpdao = new FcPicHBNDAO();
//		IArtistDAO adao = new ArtistHibernateDAO();
//		FundsBean fb = fdao.findByPrimaryKey(Integer.parseInt(req.getParameter("fc_id")));
//		List<FcPicBean> fplist = fpdao.getPicAddressJSON(Integer.parseInt(req.getParameter("fc_id")));
//		ArtistBean ab = adao.findByArtId((fb.getArt_id()));
//		MemberBean mb = ab.getMemberbean();
////		FundsBean fb = fdao.findByPrimaryKey(Integer.parseInt(req.getPathInfo().substring(1)));
////		System.out.println(Integer.parseInt(req.getPathInfo().substring(1)));
//		req.setAttribute("fpl", fplist);
//		req.setAttribute("fb", fb);
//		req.setAttribute("ab", ab);
//		req.setAttribute("mb", mb);
//		req.getRequestDispatcher("Fc_List_User.jsp").forward(req, resp);
	}
}
