package _11_message.controller.pro;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import _11_message.model.promessage.ProMessageBean;
import _11_message.model.promessage.ProMsgHBNDAO;




@WebServlet("/_11_message/promessage.do")
public class ProMessageServlet extends HttpServlet {
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
		
		String msg_title = request.getParameter("msg_title");
		String prev_msg_ids = request.getParameter("prev_msg_id");
		int prev_msg_id=Integer.parseInt(prev_msg_ids);
		int user_id =0;//(int)session.getAttribute("user_id");
		String sender_name = null;//(String)session.getAttribute("user_name");
		
		String reciever_name = request.getParameter("reciever_name");
		Timestamp ts=new Timestamp(System.currentTimeMillis());
		String pro_ids =  request.getParameter("pro_id");
		int pro_id =Integer.parseInt(pro_ids);
		String msg_txt = request.getParameter("msg_txt");
		int msg_status = 0;
		
		
		
		
		if (msg_title == null || msg_title.trim().length() == 0) {
			errorMsgMap.put("TitleError", "必須輸入主旨");
		}
		
		if (msg_txt == null || msg_txt.trim().length() == 0) {
			errorMsgMap.put("ContentError", "必須輸入內文");
		}
		if (!errorMsgMap.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("blog.jsp");
			rd.forward(request, response);
			return;
		}

			int n = 0;

			ProMessageBean mb = new ProMessageBean(msg_title,prev_msg_id,user_id,sender_name,reciever_name,
					ts,pro_id,msg_txt,msg_status );
		    ProMsgHBNDAO ms = new ProMsgHBNDAO();
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