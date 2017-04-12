package _08_product.controller;

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

import _08_product.model.IProductDAO;
import _08_product.model.ProductBean;
import _08_product.model.ProductHibernateDAO;

@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
		* 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/_09_product/ProductCreate.do")
public class ProCreateServletMP extends HttpServlet {
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
		
		
		String proname="";
		int price=0;
		String prices="";
		String saletime="";
		int proinv=0;
		String proinvs="";
		String prointroduction="";
		int artid = 1;
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
					if (fldName.equals("proname")) {
						proname = value;
					} else if (fldName.equals("prices")) {
						prices= value;
					} else if (fldName.equalsIgnoreCase("saletime")) {
						saletime = value;
					} else if (fldName.equalsIgnoreCase("proinvs")) {
						proinvs = value;
					} else if (fldName.equalsIgnoreCase("prointroduction")) {
						prointroduction = value;
					} else if (fldName.equalsIgnoreCase("hashtag")) {
						hashtag = value;
					}
				}	
				
			}
			System.out.println("123");
				// 2. 進行必要的資料轉換

				// 3. 檢查使用者輸入資料
				if (proname == null || proname.trim().length() == 0) {
					errorMsg.put("errorpronameEmpty", "商品名稱欄必須輸入");
				}
				if (prices == null || prices.trim().length() == 0) {
					errorMsg.put("errorpricesEmpty", "商品金額欄必須輸入");
				}
				if (saletime == null || saletime.trim().length() == 0) {
					errorMsg.put("errorsaletimeEmpty", "上架日期欄必須輸入");
				}
				if (proinvs == null || proinvs.trim().length() == 0) {
					errorMsg.put("errorproinvsEmpty", "庫存個數欄必須輸入");
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
					//RequestDispatcher rd = request.getRequestDispatcher("../_03_productsale/CreateProductA.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("../_12_Product_Create/Product_Create.jsp");
					rd.forward(request, response);
					return;
				}
			
				System.out.println("123");
				price = Integer.parseInt(prices);
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy/MM/dd");
				Date date = new Date();
				saletime = sdFormat.format(date);
				
				try {
					// 4. 進行Business Logic運算
					// RegisterServiceFile類別的功能：
				
					IProductDAO rs = new ProductHibernateDAO();

					ProductBean pb = new ProductBean(proname, price, saletime, proinv, prointroduction, artid,
							hashtag);
					
					int n = rs.insert(pb);
					if (n == 1) {
						msgOK.put("InsertOK", "<Font color='red'>新增成功，請開始使用本系統</Font>");
						response.sendRedirect("../index.jsp");
						return;
					} else {
						errorMsg.put("errorAccountDup", "新增此筆資料有誤(RegisterServlet)");
					}

					// 5.依照 Business Logic 運算結果來挑選適當的畫面
					if (!errorMsg.isEmpty()) {
						// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
						//RequestDispatcher rd = request.getRequestDispatcher("../_03_productsale/CreateProductA.jsp");
						RequestDispatcher rd = request.getRequestDispatcher("../_12_Product_Create/Product_Create NEW.jsp");
						rd.forward(request, response);
						return;
					}
				} catch (Exception e) {
					e.printStackTrace();
					errorMsg.put("errorAccountDup", e.getMessage());
					//RequestDispatcher rd = request.getRequestDispatcher("../_03_productsale/CreateProductA.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("../_12_Product_Create/Product_Create NEW.jsp");
					rd.forward(request, response);
				}
			
		
	}
}