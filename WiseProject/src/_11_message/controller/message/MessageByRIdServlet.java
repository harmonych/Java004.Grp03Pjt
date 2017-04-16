package _11_message.controller.message;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _11_message.model.message.IMessage;
import _11_message.model.message.MessageBean;
import _11_message.model.message.MessageHBNDAO;

@WebServlet("/_06_mailbox/messageReceived.do")
public class MessageByRIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
		int r_user_id = Integer.parseInt(request.getParameter("r_user_id").trim());
		IMessage dao = new MessageHBNDAO();
		dao.setR_user_id(r_user_id);
		List<MessageBean> rmbl = dao.getMessagesByRId(r_user_id);
		request.setAttribute("rmbl", rmbl);
		request.getRequestDispatcher("MailBox.jsp").forward(request, response);		
	}
}
