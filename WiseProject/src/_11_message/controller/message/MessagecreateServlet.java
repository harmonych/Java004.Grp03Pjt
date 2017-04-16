package _11_message.controller.message;

import java.io.IOException;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import _00_init.GlobalService;
import _11_message.model.message.IMessage;
import _11_message.model.message.MessageBean;
import _11_message.model.message.MessageHBNDAO;

@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
* 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/_11_message/messagecreate.do")
public class MessagecreateServlet extends HttpServlet {
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
		IMessage mh= new MessageHBNDAO();		
		int s_user_id = 0;//(int)session.getAttribute("user_id");;
		String sender_name = "";//(String)session.getAttribute("user_name");
		String receiver_name = ""; //request.getParameter("reciever_name");
		String msg_title = "";
		String msg_txt = "";
		int s_msg_status = 0;
		int r_msg_status = 0;
		Collection<Part> parts = request.getParts(); // 取出HTTP multipart
		GlobalService.exploreParts(parts, request);
		if (parts != null) { // 如果這是一個上傳資料的表單
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);

				// 1. 讀取使用者輸入資料
				if (p.getContentType() == null) {
					if (fldName.equals("s_user_id")) {
						s_user_id = Integer.parseInt(value);
					} else if (fldName.equalsIgnoreCase("title")) {
						msg_title = value;
					} else if (fldName.equalsIgnoreCase("sender_name")) {
						sender_name = value;
					} else if (fldName.equalsIgnoreCase("receiver_name")) {
						receiver_name = value;
					} else if (fldName.equalsIgnoreCase("msg_txt")) {
						msg_txt = value;
                    }  
				} 
			}
			// 2. 進行必要的資料轉換

			// 3. 檢查使用者輸入資料
			if (msg_title == null || msg_title.trim().length() == 0) {
				errorMsgMap.put("TitleError", "必須輸入主旨");
			}
			
			if (msg_txt == null || msg_txt.trim().length() == 0) {
				errorMsgMap.put("ContentError", "必須輸入內文");
			}
		} else {
			errorMsgMap.put("errTitle", "此表單不是上傳檔案的表單");
		}
		int r_user_id = mh.Checkreciever(receiver_name);
//		if (!errorMsgMap.isEmpty()) {
//			RequestDispatcher rd = request.getRequestDispatcher("/blog.jsp");
//			rd.forward(request, response);
//			return;
//		}

			int n = 0;

			MessageBean mb = new MessageBean(s_user_id,sender_name,receiver_name,r_user_id, msg_title,
					msg_txt,s_msg_status, r_msg_status);
		    MessageHBNDAO ms = new MessageHBNDAO();
		    n = ms.insertmessage(mb);
			System.out.println(n);
		if (n == 0) {
			errorMsgMap.put("InsertError",	"新增失敗");
		} else {
			
		}
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsgMap 是空的，表示沒有任何錯誤，交棒給下一棒
		if (errorMsgMap.isEmpty()) {
			session.setAttribute("MessageInsertOK", "新增留言成功");
//			response.sendRedirect(request.getContextPath() + "/blog.jsp");
			return;
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
//			RequestDispatcher rd = request.getRequestDispatcher("/blog.jsp");
//			rd.forward(request, response);
			return;
		}
	}
}