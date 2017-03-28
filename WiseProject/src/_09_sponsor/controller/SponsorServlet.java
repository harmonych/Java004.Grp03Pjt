package _09_sponsor.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import _00_init.GlobalService;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFundsDAO;
import _09_sponsor.model.ISponsorDAO;
import _09_sponsor.model.SponsorBean;
import _09_sponsor.model.SponsorHBNDAO;


@WebServlet("/_09_sponsor/sponsor.do")
public class SponsorServlet extends HttpServlet {
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
		
		
		
		int fcid = 1;
		int userid = 1;
				//(int)session.getAttribute("user_id");
		int sponmoney;
		String sponmoneys = null;
		String spontime;
		String sponmode = null;
		String sponaccount = null;

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
					if (fldName.equals("sponmoneys")) {
						sponmoneys = value;
					} else if (fldName.equalsIgnoreCase("sponmode")) {
						sponmode = value;
					} else if (fldName.equalsIgnoreCase("sponaccount")) {
						sponaccount = value;
					}
				}	
				
			}
			System.out.println("123");
				// 2. 進行必要的資料轉換

				// 3. 檢查使用者輸入資料
				if (sponmoneys == null || sponmoneys.trim().length() == 0) {
					errorMsg.put("errorsponmoneysEmpty", "贊助金額欄必須輸入");
				}
				if (sponmode == null || sponmode.trim().length() == 0) {
					errorMsg.put("errorsponmodeEmpty", "贊助方式欄必須選擇");
				}
				if (sponaccount == null || sponaccount.trim().length() == 0) {
					errorMsg.put("errorsponaccountEmpty", "退款帳號欄必須輸入");
				} 
								
				
			}else {
					errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
				}
				System.out.println("123");// 如果有錯誤
				if (!errorMsg.isEmpty()) {
					// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
					RequestDispatcher rd = request.getRequestDispatcher("../_03_productsale/CreateProduct.jsp");
					rd.forward(request, response);
					return;
				}
			
				System.out.println("123");
				sponmoney = Integer.parseInt(sponmoneys);
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
				Date date = new Date();
				spontime = sdFormat.format(date);
				
				try {
					// 4. 進行Business Logic運算
					// RegisterServiceFile類別的功能：
				
					ISponsorDAO rs = new SponsorHBNDAO();
					SponsorBean sb = new SponsorBean(fcid,userid,sponmoney,spontime,sponmode,sponaccount);
					
					IFundsDAO dao=new FundsHibernateDAO();
					int s = dao.updateSponsor(fcid,sponmoney);
					
					int n = rs.sponsor(sb);
					if (n == 1&&s==1) {
						msgOK.put("InsertOK", "<Font color='red'>新增成功，請開始使用本系統</Font>");
						response.sendRedirect("../index.jsp");
						return;
					} else {
						errorMsg.put("errorAccountDup", "新增此筆資料有誤(RegisterServlet)");
					}

					// 5.依照 Business Logic 運算結果來挑選適當的畫面
					if (!errorMsg.isEmpty()) {
						// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
						RequestDispatcher rd = request.getRequestDispatcher("../_03_productsale/CreateProduct.jsp");
						rd.forward(request, response);
						return;
					}
				} catch (Exception e) {
					e.printStackTrace();
					errorMsg.put("errorAccountDup", e.getMessage());
					RequestDispatcher rd = request.getRequestDispatcher("../_03_productsale/CreateProduct.jsp");
					rd.forward(request, response);
				}
			
		
	}
}