package _11_message.controller.pro;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import _11_message.model.promessage.IProMessage;
import _11_message.model.promessage.ProMessageBean;
import _11_message.model.promessage.ProMsgHBNDAO;

@WebServlet("/_11_message/promessage.json")
public class ProMessageJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		int pro_id = Integer.parseInt(request.getParameter("pro_id").trim());
		try {
			IProMessage dao = new ProMsgHBNDAO();
			dao.setPro_id(pro_id);
			List<ProMessageBean> pml = dao.Messagequery(pro_id);
			String msg = new Gson().toJson(pml);
            out.write(msg);
            out.flush();
		} catch (Exception e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}
}
