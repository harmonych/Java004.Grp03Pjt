package _08_product.controller;

import java.io.IOException;
import java.io.InputStream;
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
import _01_register.util.DBUtils;
import _08_product.model.IProPicDAO;
import _08_product.model.IProductDAO;
import _08_product.model.ProPicBean;
import _08_product.model.ProPicHBNDAO;
import _08_product.model.ProductBean;
import _08_product.model.ProductHibernateDAO;

@MultipartConfig(location = "", fileSizeThreshold = 5 * 1024 * 1024, maxFileSize = 1024 * 1024
		* 500, maxRequestSize = 1024 * 1024 * 500 * 5)
@WebServlet("/_12_Product_Create/ProductCreate.do")
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
		
		
		String pro_name="";
		int price=0;
		String sale_time = "" ;
		int pro_inv = 0;
		String pro_introduction="";
		int art_id = 0;
		String hashtag="";
		String introPicName = "";
		String fileName1 = "";
		String fileName2 = "";
		String fileName3 = "";
		InputStream ipsintro = null;
		InputStream ips1 = null;
		InputStream ips2 = null;
		InputStream ips3 = null;
		

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
					if (fldName.equals("pro_name")) {
						pro_name = value;
					} else if (fldName.equals("price")) {
						price = Integer.parseInt(value);
					} else if (fldName.equals("art_id")) {
						art_id = Integer.parseInt(value);
					} else if (fldName.equalsIgnoreCase("sale_time")) {
						sale_time = value;
					} else if (fldName.equals("pro_inv")) {
						pro_inv = Integer.parseInt(value);
					} else if (fldName.equalsIgnoreCase("pro_introduction")) {
						pro_introduction = value;
					} else if (fldName.equalsIgnoreCase("hashtag")) {
						hashtag = value;
					}
				} else {
					
					if (fldName.equalsIgnoreCase("intro_pic")) {
						introPicName = GlobalService.getFileName(p); // 此為圖片檔的檔名
						if (introPicName != null && introPicName.trim().length() > 0) {
							ipsintro = p.getInputStream();
						}
					}else if (fldName.equalsIgnoreCase("pic_1")) {
						fileName1 = GlobalService.getFileName(p); // 此為圖片檔的檔名
						fileName1 = GlobalService.adjustFileName(fileName1 ,
								GlobalService.IMAGE_FILENAME_LENGTH);
						if (fileName1 != null && fileName1.trim().length() > 0) {
							ips1 = p.getInputStream();
						}
					}else if (fldName.equalsIgnoreCase("pic_2")) {
						fileName2 = GlobalService.getFileName(p); // 此為圖片檔的檔名
						fileName2 = GlobalService.adjustFileName(fileName2,
								GlobalService.IMAGE_FILENAME_LENGTH);
						if (fileName2 != null && fileName2.trim().length() > 0) {
							ips2 = p.getInputStream();
						}
					}else if (fldName.equalsIgnoreCase("pic_3")) {
						fileName3 = GlobalService.getFileName(p); // 此為圖片檔的檔名
						fileName3 = GlobalService.adjustFileName(fileName3,
								GlobalService.IMAGE_FILENAME_LENGTH);
						if (fileName3 != null && fileName3.trim().length() > 0) {
							ips3 = p.getInputStream();
						}
					}	
				
				}
			}
			System.out.println("123");
				// 2. 進行必要的資料轉換

				// 3. 檢查使用者輸入資料
				if (pro_name == null || pro_name.trim().length() == 0) {
					errorMsg.put("errorpronameEmpty", "商品名稱欄必須輸入");
				}
				if (price <= 0 ) {
					errorMsg.put("errorpricesEmpty", "商品金額欄必須輸入正確");
				}
				if (sale_time == null || sale_time.trim().length() == 0) {
					errorMsg.put("errorsaletimeEmpty", "上架日期欄必須輸入");
				}
				if (pro_inv <= 0) {
					errorMsg.put("errorproinvsEmpty", "庫存個數欄必須輸入正確");
				} 
				if (hashtag == null || hashtag.trim().length() == 0) {
					errorMsg.put("errorhashtagEmpty", "hashtag欄必須輸入");
				} 
				
				
			}else {
					errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
				}
				System.out.println("123");// 如果有錯誤
				if (!errorMsg.isEmpty()) {
					// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
					//RequestDispatcher rd = request.getRequestDispatcher("../_03_productsale/CreateProductA.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("Product_Create_NEW.jsp");
					rd.forward(request, response);
					return;
				}
			
				System.out.println("123");
				SimpleDateFormat sdFormat = new SimpleDateFormat("yyyy-MM-dd");
				Date date = new Date();
				sale_time = sdFormat.format(date);
				
				try {
					// 4. 進行Business Logic運算
					// RegisterServiceFile類別的功能：
				
					IProductDAO rs = new ProductHibernateDAO();

					ProductBean pb = new ProductBean(pro_name, price, sale_time, pro_inv, pro_introduction, art_id, hashtag);
					
					int n = rs.insert(pb);
					if (n == 1) {
						msgOK.put("InsertOK", "<Font color='red'>新增成功，請開始使用本系統</Font>");
						pb.setPro_id(pb.getPro_id());
						System.out.println("==========");
						int pid = pb.getPro_id();

						System.out.println(pid);
						System.out.println("==========");
						int i =0;
						if(ipsintro != null){
							introPicName = GlobalService.adjustPicName(introPicName, pid);
							String dirPortrait = getServletContext().getInitParameter("upload.location.pro");
							DBUtils.isToFiles(ipsintro, introPicName, dirPortrait);
							ProPicBean ppb = new ProPicBean(pid, "http://saudade.myasustor.com/JPjt/pro_pic_address/" + introPicName);
							IProPicDAO ppdao = new ProPicHBNDAO();
							n = ppdao.insert(ppb);
							if(ips1 != null){
								String dirPortrait1 = getServletContext().getInitParameter("upload.location.pro");
								DBUtils.isToFiles(ips1, fileName1, dirPortrait1);
								ProPicBean ppb1 = new ProPicBean(pid, "http://saudade.myasustor.com/JPjt/pro_pic_address/" + fileName1);
								ppdao.insert(ppb1);
								if(ips2 != null){
									String dirPortrait2 = getServletContext().getInitParameter("upload.location.pro");
									DBUtils.isToFiles(ips2, fileName2, dirPortrait2);
									ProPicBean ppb2 = new ProPicBean(pid, "http://saudade.myasustor.com/JPjt/pro_pic_address/" + fileName2);
									ppdao.insert(ppb2);
									if(ips3 != null){
										String dirPortrait3 = getServletContext().getInitParameter("upload.location.pro");
										DBUtils.isToFiles(ips3, fileName3, dirPortrait3);
										ProPicBean ppb3 = new ProPicBean(pid, "http://saudade.myasustor.com/JPjt/pro_pic_address/" + fileName3);
										ppdao.insert(ppb3);
									}
								}								
							}
						}						
						
						
						response.sendRedirect("../index.jsp");
						return;
					} else {
						errorMsg.put("errorAccountDup", "新增此筆資料有誤(RegisterServlet)");
					}

					// 5.依照 Business Logic 運算結果來挑選適當的畫面
					if (!errorMsg.isEmpty()) {
						// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
						//RequestDispatcher rd = request.getRequestDispatcher("../_03_productsale/CreateProductA.jsp");
						RequestDispatcher rd = request.getRequestDispatcher("../index.jsp");
						rd.forward(request, response);
						return;
					}
				} catch (Exception e) {
					e.printStackTrace();
					errorMsg.put("errorAccountDup", e.getMessage());
					//RequestDispatcher rd = request.getRequestDispatcher("../_03_productsale/CreateProductA.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("../index.jsp");
					rd.forward(request, response);
				}
			
		
	}
}