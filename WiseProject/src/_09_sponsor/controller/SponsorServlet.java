package _09_sponsor.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

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
import _09_sponsor.model.ISponsorDAO;
import _09_sponsor.model.SponsorBean;
import _09_sponsor.model.SponsorHBNDAO;
import _11_message.model.promessage.IProMessage;
import _11_message.model.promessage.ProMessageBean;
import _11_message.model.promessage.ProMsgHBNDAO;



@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
* 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/_09_sponsor/sponsoringFc.do")
public class SponsorServlet extends HttpServlet {
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
		int fc_id = 0;
		int user_id = 0 ; //Integer.parseInt(request.getParameter("user_id"));
		int spon_money =0;
		String sps="";
		int spon_mode = 0; //(String)session.getAttribute("user_name");
		String spon_account ="" ;
		Collection<Part> parts = request.getParts(); // 取出HTTP multipart
		GlobalService.exploreParts(parts, request);
		
		if (parts != null) { // 如果這是一個上傳資料的表單
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);

				// 1. 讀取使用者輸入資料
				if (p.getContentType() == null) {
					if (fldName.equals("user_id2")) {
						user_id = Integer.parseInt(value);
					} else if (fldName.equals("spon_mode")) {
						sps = value;
						if( sps != null) {
							spon_mode = Integer.parseInt(sps);
						}else{
							spon_mode = 0;
						}
					} else if (fldName.equals("fc_id2")) {
						fc_id = Integer.parseInt(value);
					} else if (fldName.equals("spon_money")) {
						spon_money = Integer.parseInt(value);
                    }  else if (fldName.equalsIgnoreCase("spon_account")) {
                    	spon_account = value;
                    } 
				} 
			}
			// 3. 檢查使用者輸入資料
//			if (msg_title == null || msg_title.trim().length() == 0) {
//				errorMsg.put("TitleError", "必須輸入主旨");
//			}
//			
//			if (msg_txt == null || msg_txt.trim().length() == 0) {
//				errorMsg.put("ContentError", "必須輸入內文");
//			}
		} else {
			errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
		}
		if (!errorMsg.isEmpty()) {
//			RequestDispatcher rd = request.getRequestDispatcher("blog.jsp");
//			rd.forward(request, response);
			return;
		}

			int n = 0;
			
			if(spon_account == "" && spon_mode ==0){
				ISponsorDAO dao = new SponsorHBNDAO();
				SponsorBean sb = new SponsorBean(fc_id, user_id, spon_money);
				n = dao.sponsor(sb);
			}else if(spon_mode != 0 || spon_account != ""){
				ISponsorDAO dao = new SponsorHBNDAO();
				SponsorBean sb = new SponsorBean(fc_id, user_id, spon_money, spon_mode, spon_account);
				n = dao.sponsor(sb);
			}else{	
				ISponsorDAO dao = new SponsorHBNDAO();
				SponsorBean sb = new SponsorBean(fc_id, user_id, spon_money, spon_mode, spon_account);
			}
			
		if (n == 0) {
			errorMsg.put("InsertError",	"贊助失敗");
		} else {
			
		}
		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsg 是空的，表示沒有任何錯誤，交棒給下一棒
		if (errorMsg.isEmpty()) {
			session.setAttribute("MessageInsertOK", "贊助成功");
//			response.sendRedirect(request.getContextPath() + "index.jsp");
			return;
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
//			RequestDispatcher rd = request.getRequestDispatcher("blog.jsp");
//			rd.forward(request, response);
			return;
		}
	}
}