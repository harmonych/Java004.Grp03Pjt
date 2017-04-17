package _08_product.controller;

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
import _08_product.model.IProPicDAO;
import _08_product.model.IProductDAO;
import _08_product.model.ProPicBean;
import _08_product.model.ProPicHBNDAO;
import _08_product.model.ProductBean;
import _08_product.model.ProductHibernateDAO;

@WebServlet("/_12_Product_Create/CreateProduct")
public class DisplaySingleProductCreate extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	public DisplaySingleProductCreate() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		IArtistDAO adao = new ArtistHibernateDAO();
		ArtistBean ab = adao.findByArtId(Integer.parseInt(req.getParameter("art_id")));

		
		req.setAttribute("ab", ab);
		
		req.getRequestDispatcher("Product_Create_NEW.jsp").forward(req, resp);
	}

	
}
