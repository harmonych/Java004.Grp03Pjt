package _11_message.controller.message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _01_register.model.IMemberDAO;
import _01_register.model.MemberBean;
import _01_register.model.MemberHibernateDAO;

@WebServlet("/_06_mailbox/messageReply.do")
public class MessageReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
		int r_user_id = Integer.parseInt(request.getParameter("r_user_id").trim());
		IMemberDAO dao = new MemberHibernateDAO();
		//閱讀該信的ID
		MemberBean mb = dao.findByPrimaryKey(r_user_id);
		request.setAttribute("mb", mb);
		request.getRequestDispatcher("Compose.jsp").forward(request, response);	
	}
}
