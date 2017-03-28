package _11_message.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _11_message.model.MessageBean;
import _11_message.model.MessageHBNDAO;


@WebServlet("/_11_message/message.do")
public class MessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		// 將errorMsgMap放入request物件內，識別字串為 "ErrorMsgKey"
		request.setAttribute("ErrorMsgKey", errorMsgMap);
		MessageHBNDAO mh= new MessageHBNDAO();
		
		int s_user_id = 1;//(int)session.getAttribute("user_id");;
		String sender_name = null;//(String)session.getAttribute("user_name");
		
		String reciever_name = request.getParameter("reciever_name");
		int r_user_id = mh.Checkreciever(reciever_name);
		String title = request.getParameter("title");
		String msg_txt = request.getParameter("msg_txt");
		Timestamp ts=new Timestamp(System.currentTimeMillis());
		int s_msg_state = 0;
		int r_msg_state = 0;
		
		
		if (title == null || title.trim().length() == 0) {
			errorMsgMap.put("TitleError", "必須輸入主旨");
		}
		String content = request.getParameter("content");
		if (content == null || content.trim().length() == 0) {
			errorMsgMap.put("ContentError", "必須輸入內文");
		}
		if (!errorMsgMap.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("blog.jsp");
			rd.forward(request, response);
			return;
		}

			int n = 0;

			MessageBean mb = new MessageBean(s_user_id,sender_name,reciever_name,r_user_id, title,
					msg_txt,ts,s_msg_state, r_msg_state);
		    MessageHBNDAO ms = new MessageHBNDAO();
		    n = ms.insertmessage(mb);
			
		if (n == 0) {
			errorMsgMap.put("InsertError",	"新增失敗");
		} else {
			
		}
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsgMap 是空的，表示沒有任何錯誤，交棒給下一棒
		if (errorMsgMap.isEmpty()) {
			session.setAttribute("MessageInsertOK", "新增留言成功");
			response.sendRedirect(request.getContextPath() + "/index_xss.jsp");
			return;
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
			RequestDispatcher rd = request.getRequestDispatcher("blog.jsp");
			rd.forward(request, response);
			return;
		}
	}
}