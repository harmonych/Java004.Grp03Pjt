package _11_message.controller.message;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import _11_message.model.message.IMessage;
import _11_message.model.message.MessageBean;
import _11_message.model.message.MessageHBNDAO;

@WebServlet("/_06_mailbox/messageByMsgId.do")
public class MessageByIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
	    response.setContentType("application/json; charset=utf-8");
		int msg_id = Integer.parseInt(request.getParameter("msg_id").trim());
		IMessage dao = new MessageHBNDAO();
		MessageBean msgb = dao.findByPrimaryKey(msg_id);
		request.setAttribute("msgb", msgb);
		request.getRequestDispatcher("ReadMail.jsp").forward(request, response);	
	}
}
