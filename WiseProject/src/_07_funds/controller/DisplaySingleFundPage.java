package _07_funds.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Request;

import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;

@WebServlet("/_11_Fc_info/DisplayFund")
public class DisplaySingleFundPage extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	public DisplaySingleFundPage() {
		super();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		IFundsDAO fdao = new FundsHibernateDAO();
		FundsBean fb = fdao.findByPrimaryKey(Integer.parseInt(req.getParameter("fc_id")));
//		FundsBean fb = fdao.findByPrimaryKey(Integer.parseInt(req.getPathInfo().substring(1)));
		System.out.println("----fb-----");
		System.out.println(fb.getArt_id());
//		System.out.println(Integer.parseInt(req.getPathInfo().substring(1)));
		req.setAttribute("fb", fb);
		req.getRequestDispatcher("Fc_Info.jsp").forward(req, resp);
	}

	
}
