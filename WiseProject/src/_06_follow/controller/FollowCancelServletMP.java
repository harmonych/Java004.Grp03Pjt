package _06_follow.controller;

import java.io.IOException;
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

import _06_follow.model.FollowHBNDAO;
import _06_follow.model.IFollowDAO;

/*
 * 本程式讀取使用者輸入資料，進行必要的資料轉換，檢查使用者輸入資料，
 * 進行Business Logic運算，依照Business Logic運算結果來挑選適當的畫面
 * 
 */
//
//啟動檔案上傳的功能：
//1. <form>標籤的 method屬性必須是"post", 而且
//    enctype屬性必須是"multipart/form-data"
//注意：enctype屬性的預設值為"application/x-www-form-urlencoded"
//2. 定義可以挑選上傳檔案的表單欄位：
//<input type='file' name='user-defined_name' />
//
//所謂 HTTP multipart request是指由Http客戶端(如瀏覽器)所建構的ㄧ種請求，
//用來上傳一般的表單資料(form data)與檔案。
//參考網頁：http://stackoverflow.com/questions/913626/what-should-a-multipart-http-request-with-multiple-files-look-like
//
//Servlet規格書一直到Servlet 3.0才提出標準API將檔案上傳的功能標準化。
//
//在Servlet 3.0中，若要能夠處理瀏覽器送來的HTTP multipart request, 
//我們撰寫的Servlet程式必須以註釋
//『javax.servlet.annotation.MultipartConfig』來加以說明。
//
//MultipartConfig的屬性說明:
//location: 上傳之表單資料與檔案暫時存放在Server端之路徑，此路徑必須存在。
//fileSizeThreshold: 檔案的大小臨界值，超過此臨界值，上傳檔案會用存放在硬碟，
//否則存放在主記憶體。
//maxFileSize: 上傳單一檔案之長度限制，如果超過此數值，Web Container會丟出例外
//maxRequestSize: 上傳所有檔案之總長度限制，如果超過此數值，Web Container會丟出例外
@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
		* 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/_06_follow/cancelfollow.do")
public class FollowCancelServletMP extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8"); // 文字資料轉內碼
		response.setContentType("text/html;charset=UTF-8 ");
		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsg = new HashMap<String, String>();
		// 準備存放註冊成功之訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		// 註冊成功後將用response.sendRedirect()導向新的畫面，所以需要
		// session物件來存放共用資料。
		HttpSession session = request.getSession();
		request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
		session.setAttribute("MsgOK", msgOK); // 顯示正常訊息

		int follow_id = Integer.parseInt(request.getParameter("follow_id"));

		try {

			IFollowDAO rs = new FollowHBNDAO();

			int n = rs.cencelfollw(follow_id);
			if (n == 1) {
				msgOK.put("InsertOK", "<Font color='red'>新增成功，請開始使用本系統</Font>");
				request.getRequestDispatcher("/_18_Follow_List/Follow_List.jsp").forward(request, response);
				return;
			} else {
				errorMsg.put("errorAccountDup", "新增此筆資料有誤(RegisterServlet)");
			}

		} catch (Exception e) {
			e.printStackTrace();
			errorMsg.put("errorAccountDup", e.getMessage());
			// RequestDispatcher rd =
			// request.getRequestDispatcher("../_04_findfunds/createproject.jsp");
			RequestDispatcher rd = request.getRequestDispatcher("../_10_Fc_Create/Fc_Create.jsp");
			rd.forward(request, response);
		}

	}
}