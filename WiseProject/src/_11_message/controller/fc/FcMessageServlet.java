package _11_message.controller.fc;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import _00_init.GlobalService;
import _11_message.model.fcmessage.FcMessageBean;
import _11_message.model.fcmessage.FcMsgHBNDAO;
import _11_message.model.promessage.IProMessage;
import _11_message.model.promessage.ProMessageBean;
import _11_message.model.promessage.ProMsgHBNDAO;



@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
* 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/_11_message/fcMessage.do")
public class FcMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsg = new HashMap<String, String>();
		// 將errorMsgMap放入request物件內，識別字串為 "ErrorMsgKey"
		request.setAttribute("ErrorMsgKey", errorMsg);		
		String msg_title = "";//request.getParameter("msg_title");
		String prev_msg_ids = ""; //request.getParameter("prev_msg_id");
		int prev_msg_id = 0;
		int user_id = 0 ; //Integer.parseInt(request.getParameter("user_id"));
		String sender_name = ""; //(String)session.getAttribute("user_name");
//		int r_user_id = Integer.parseInt(request.getParameter("r_user_id"));
		String receiver_name = "";
		int fc_id =0;
		String msg_txt = "";
		int msg_status = 1 ;
		Collection<Part> parts = request.getParts(); // 取出HTTP multipart
		GlobalService.exploreParts(parts, request);
		
		if (parts != null) { // 如果這是一個上傳資料的表單
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);

				// 1. 讀取使用者輸入資料
				if (p.getContentType() == null) {
					if (fldName.equals("user_id")) {
						user_id = Integer.parseInt(value);
					} else if (fldName.equals("prev_msg_id")) {
						prev_msg_ids = value;
						if( prev_msg_ids != null) {
							prev_msg_id = Integer.parseInt(prev_msg_ids);
						}else{
							prev_msg_id = 0;
						}
					} else if (fldName.equalsIgnoreCase("msg_title")) {
						msg_title = value;
					} else if (fldName.equalsIgnoreCase("sender_name")) {
						sender_name = value;
					} else if (fldName.equalsIgnoreCase("receiver_name")) {
						receiver_name = value;
					} else if (fldName.equals("fc_id")) {
						fc_id = Integer.parseInt(value);
					} else if (fldName.equalsIgnoreCase("msg_txt")) {
						msg_txt = value;
                    }  else if (fldName.equals("msg_status")) {
                    	if (value != ""){
                    		if(Integer.parseInt(request.getParameter("msg_status")) == 0) msg_status =0;		
                    	}
                    } 
				} 
			}
			// 2. 檢查使用者輸入資料
			if (msg_title == null || msg_title.trim().length() == 0) {
				errorMsg.put("TitleError", "必須輸入主旨");
			}
			
			if (msg_txt == null || msg_txt.trim().length() == 0) {
				errorMsg.put("ContentError", "必須輸入內文");
			}
		} else {
			errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
		}
		if (!errorMsg.isEmpty()) {
//			RequestDispatcher rd = request.getRequestDispatcher("blog.jsp");
//			rd.forward(request, response);
			return;
		}

			int n = 0;
			

			FcMessageBean mb = new FcMessageBean(msg_title,prev_msg_id,user_id,sender_name,receiver_name,fc_id,msg_txt,msg_status );
		    FcMsgHBNDAO ms = new FcMsgHBNDAO();
		    n = ms.insertmessage(mb);
			
		if (n == 0) {
			errorMsg.put("InsertError",	"新增失敗");
		} else {
			
		}
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsg 是空的，表示沒有任何錯誤，交棒給下一棒
		if (errorMsg.isEmpty()) {
			session.setAttribute("MessageInsertOK", "留言成功");
//			response.sendRedirect(request.getContextPath() + "/index.jsp");
			return;
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
//			RequestDispatcher rd = request.getRequestDispatcher("blog.jsp");
//			rd.forward(request, response);
			return;
		}
	}
}