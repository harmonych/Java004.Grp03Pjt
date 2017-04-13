package _08_product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;
import _01_register.model.MemberBean;
import _08_product.model.IProPicDAO;
import _08_product.model.IProductDAO;
import _08_product.model.ProPicBean;
import _08_product.model.ProPicHBNDAO;
import _08_product.model.ProductBean;
import _08_product.model.ProductHibernateDAO;

@WebServlet("/_13_Product_info/DisplayProduct")
public class DisplaySingleProductPage extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	public DisplaySingleProductPage() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ArtistBean ab = null;
		MemberBean mb = null;
		ProPicBean ppb = null;
		IProductDAO pdao = new ProductHibernateDAO();
		IArtistDAO adao = new ArtistHibernateDAO();
		IProPicDAO ppdao = new ProPicHBNDAO();
		ProductBean pb = pdao.findByPrimaryKey(Integer.parseInt(req.getParameter("pro_id")));
//		FundsBean fb = fdao.findByPrimaryKey(Integer.parseInt(req.getPathInfo().substring(1)));
//		System.out.println(Integer.parseInt(req.getPathInfo().substring(1)));
		ppb = ppdao.findByPrimaryKey(pb.getPro_id());
		ab = adao.findByPrimaryKey(pb.getArt_id());
		mb = ab.getMemberbean();

		req.setAttribute("ppb", ppb);
		req.setAttribute("pb", pb);
		req.setAttribute("ab", ab);
		req.setAttribute("mb", mb);
		req.getRequestDispatcher("Product_info.jsp").forward(req, resp);
	}

	
}
