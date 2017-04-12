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
import _01_register.model.MemberBean;

@WebServlet("/_05_CreationsFrame/DisplayArtist")
public class DisplaySingleArtistPage extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	public DisplaySingleArtistPage() {
		super();
	}
//Get方式生成創作者主頁並帶入該art_id的會員資料與創作者資料
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IArtistDAO adao = new ArtistHibernateDAO();
		ArtistBean ab = adao.findByPrimaryKey(Integer.parseInt(req.getParameter("art_id")));
		MemberBean mb =  ab.getMemberbean();
//		System.out.println(Integer.parseInt(req.getPathInfo().substring(1)));
		req.setAttribute("ab", ab);
		req.setAttribute("mb", mb);
		req.getRequestDispatcher("CreationsPage2.jsp").forward(req, resp);
	}

	
}
