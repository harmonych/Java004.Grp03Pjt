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

@WebServlet("/_06_mailbox/messageSent.do")
public class MessageBySIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
//寄的人ID來搜尋
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
		int s_user_id = Integer.parseInt(request.getParameter("s_user_id").trim());
		IMessage dao = new MessageHBNDAO();
		List<MessageBean> smbl = dao.getMessagesBySId(s_user_id);
		request.setAttribute("smbl", smbl);
		request.getRequestDispatcher("MailBoxS.jsp").forward(request, response);		
	}
}
