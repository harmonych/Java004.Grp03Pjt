package _02_login.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.*;

import javax.naming.NamingException;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.xml.bind.DatatypeConverter;

import _00_init.GlobalService;
import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;
import _01_register.model.MemberBean;
import _02_login.model.LoginServiceDB;

@WebServlet("/_02_login/login.do")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request,
		HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		// 將errorMsgMap放入request物件內，識別字串為 "ErrorMsgKey"
		request.setAttribute("ErrorMsgKey", errorMsgMap);
		// 1. 讀取使用者輸入資料
		String account = request.getParameter("account");
//		String password = GlobalService.getMD5Endocing(GlobalService.encryptString(request.getParameter("password")));
		String password = request.getParameter("password");
		String rm = request.getParameter("rememberMe");
		String requestURI = (String) session.getAttribute("requestURI");
		// 2. 進行必要的資料轉換
		// 無
		// 3. 檢查使用者輸入資料
		// 如果 userId 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (account == null || account.trim().length() == 0) {
			errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
		}
		// 如果 password 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if (password == null || password.trim().length() == 0) {
			errorMsgMap.put("PasswordEmptyError", "密碼欄必須輸入");
		}
		
		//  **********Remember Me**************************** 
		Cookie cookieUser = null;
		Cookie cookiePassword = null;
		Cookie cookieRememberMe = null;
		
		if (rm != null) {   // rm存放瀏覽器送來之RememberMe的選項
			cookieUser = new Cookie("account", account);
			cookieUser.setMaxAge(30*60*60);
			cookieUser.setPath(request.getContextPath());
//			String encodePassword = GlobalService.encryptString(password);
//			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(30*60*60);
			cookiePassword.setPath(request.getContextPath());
			cookieRememberMe = new Cookie("rm", "true");
			cookieRememberMe.setMaxAge(30*60*60);
			cookieRememberMe.setPath(request.getContextPath());
		} else {
			cookieUser = new Cookie("account", account);
			cookieUser.setMaxAge(0);   // MaxAge==0 表示要請瀏覽器刪除此Cookie
			cookieUser.setPath(request.getContextPath());
			//String encodePassword = DatatypeConverter.printBase64Binary(password.getBytes());
//			String encodePassword = GlobalService.encryptString(password);
//			cookiePassword = new Cookie("password", encodePassword);
			cookiePassword = new Cookie("password", password);
			cookiePassword.setMaxAge(0);
			cookiePassword.setPath(request.getContextPath());
			cookieRememberMe = new Cookie("rm", "false");
			cookieRememberMe.setMaxAge(30*60*60);
			cookieRememberMe.setPath(request.getContextPath());
		}
		response.addCookie(cookieUser);
		response.addCookie(cookiePassword);
		response.addCookie(cookieRememberMe);
		//********************************************
		// 如果 errorMsgMap 不是空的，表示有錯誤，交棒給login.jsp
		if (!errorMsgMap.isEmpty()) {
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			return;
		}
		// 4. 進行 Business Logic 運算
		// 將LoginServiceDB類別new為物件，存放物件參考的變數為 lsdb
		LoginServiceDB lsdb;
		try {
			lsdb = new LoginServiceDB();
			// 呼叫 ms物件的 checkIDPassword()，要記得傳入userid與password兩個參數
			
			//MemberBean mb = lsdb.checkIDPassword(userId, password);
//			password = GlobalService.getMD5Endocing(
//					      GlobalService.encryptString(password));
			System.out.println("account=" + account);
			System.out.println("password=" + password);
		    
			MemberBean mb = lsdb.checkPassword(account, password);
			
			
			
			
			
			
			if (mb != null) {
				if(mb.isAuthenticate()){
				// OK, 將mb物件放入Session範圍內，識別字串為"LoginOK"
				session.setAttribute("LoginOK", mb);
					if(mb.isCheck_tag()){
						ArtistBean ab = mb.getArtistbean();
						// OK, 將ab物件放入Session範圍內，識別字串為"IsArtist"
						session.setAttribute("IsArtist", ab);
					}
				}else{
					// NG, 
					errorMsgMap.put("LoginError", "該帳號未完成Email驗證，請至註冊信箱收取驗證信以完成Email驗證");
				}
			} else {
				// NG, userid與密碼的組合錯誤，放一個錯誤訊息到 errorMsgMap 之內
				errorMsgMap.put("LoginError", "該帳號不存在或密碼錯誤");
			}
		} catch (NamingException e) {
			errorMsgMap.put("LoginError",
					"LoginServlet->NamingException:" + e.getMessage());
		} catch (SQLException e) {
			errorMsgMap.put("LoginError",
					"LoginServlet->SQLException:" + e.getMessage());
			e.printStackTrace();
		}

		// 5.依照 Business Logic 運算結果來挑選適當的畫面
		// 如果 errorMsgMap 是空的，表示沒有任何錯誤，交棒給下一棒
		if (errorMsgMap.isEmpty()) {
			// 此時不要用下面兩個敘述，因為網址列的URL不會改變
			// RequestDispatcher rd = request.getRequestDispatcher("...");
			// rd.forward(request, response);
			if (requestURI != null) {
				requestURI = (requestURI.length() == 0 ? request
						.getContextPath() : requestURI);
				response.sendRedirect(response.encodeRedirectURL(requestURI));
				return;
			} else {
				response.sendRedirect(response.encodeRedirectURL(request
						.getContextPath()));
				return;
			}
		} else {
			// 如果errorMsgMap不是空的，表示有錯誤，交棒給login.jsp
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.forward(request, response);
			return;
		}
	}
}
/*
x2Yker/Jn2J2jLiqx4fBmQ==
x2Yker/Jn2J2jLiqx4fBmQ==
*/