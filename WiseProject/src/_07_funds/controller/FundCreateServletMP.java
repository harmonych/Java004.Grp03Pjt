package _07_funds.controller;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
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
import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;

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
@WebServlet("/_07_funds/FundCreate.do")
public class FundCreateServletMP extends HttpServlet {
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
		
		
		int artid = 1;
		String fcname = "";
		String fcmoneys = "";
		int nowmoney = 0;
		String createtime = "";
		String starttime = "";
		String endtime = "";
		String updatetime = "";
		String fcintroduction ="";
		String hashtag="";

		Collection<Part> parts = request.getParts(); // 取出HTTP multipart
														// request內所有的parts
		GlobalService.exploreParts(parts, request);
		// 由parts != null來判斷此上傳資料是否為HTTP multipart request
		if (parts != null) { // 如果這是一個上傳資料的表單
			for (Part p : parts) {
				String fldName = p.getName();
				String value = request.getParameter(fldName);

				// 1. 讀取使用者輸入資料
				if (p.getContentType() == null) {
					if (fldName.equals("fcname")) {
						fcname = value;
					} else if (fldName.equals("fcmoneys")) {
						fcmoneys = value;
					} else if (fldName.equalsIgnoreCase("starttime")) {
						starttime = value;
					} else if (fldName.equalsIgnoreCase("endtime")) {
						endtime = value;
					} else if (fldName.equalsIgnoreCase("fcintroduction")) {
						fcintroduction = value;
					} else if (fldName.equalsIgnoreCase("hashtag")) {
						hashtag = value;
					}
				}	
				
			}
			System.out.println("123");
				// 2. 進行必要的資料轉換

				// 3. 檢查使用者輸入資料
				if (fcname == null || fcname.trim().length() == 0) {
					errorMsg.put("errorfcnameEmpty", "專案名稱欄必須輸入");
				}
				if (fcmoneys == null || fcmoneys.trim().length() == 0) {
					errorMsg.put("errorfcmoneysEmpty", "募資金額欄必須輸入");
				}
				if (starttime == null || starttime.trim().length() == 0) {
					errorMsg.put("errorstarttimeEmpty", "專案開始日期欄必須輸入");
				}
				if (endtime == null || endtime.trim().length() == 0) {
					errorMsg.put("errorendtimeEmpty", "募資結束日期欄必須輸入");
				} 
				if (hashtag == null || hashtag.trim().length() == 0) {
					errorMsg.put("errorhashtagEmpty", "tag欄必須輸入");
				} 
				
				
			}else {
					errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
				}
				System.out.println("123");// 如果有錯誤
				if (!errorMsg.isEmpty()) {
					// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
//					RequestDispatcher rd = request.getRequestDispatcher("../_04_findfunds/createproject.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("../_10_Fc_Create/Fc_Create_NEW.jsp");
					rd.forward(request, response);
					return;
				}
			
				System.out.println("123");
				int fcmoney = Integer.parseInt(fcmoneys);
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
				Date date = new Date();
				createtime = sdFormat.format(date);
				updatetime = createtime;
				try {
					// 4. 進行Business Logic運算
					// RegisterServiceFile類別的功能：
				
					IFundsDAO rs = new FundsHibernateDAO();

					FundsBean fb = new FundsBean(artid, fcname, fcmoney, nowmoney, createtime, starttime, endtime,
							updatetime, fcintroduction,hashtag);
					
					int n = rs.insert(fb);
					if (n == 1) {
						msgOK.put("InsertOK", "<Font color='red'>新增成功，請開始使用本系統</Font>");
						response.sendRedirect("../_10_Fc_Create/Fc_Create_Pic.jsp");
						return;
					} else {
						errorMsg.put("errorAccountDup", "新增此筆資料有誤(RegisterServlet)");
					}

					// 5.依照 Business Logic 運算結果來挑選適當的畫面
					if (!errorMsg.isEmpty()) {
						// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
//						RequestDispatcher rd = request.getRequestDispatcher("../_04_findfunds/createproject.jsp");
						RequestDispatcher rd = request.getRequestDispatcher("../_10_Fc_Create/Fc_Create_NEW.jsp");
						rd.forward(request, response);
						return;
					}
				} catch (Exception e) {
					e.printStackTrace();
					errorMsg.put("errorAccountDup", e.getMessage());
//					RequestDispatcher rd = request.getRequestDispatcher("../_04_findfunds/createproject.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("../_10_Fc_Create/Fc_Create_NEW.jsp");
					rd.forward(request, response);
				}
			
		
	}
}