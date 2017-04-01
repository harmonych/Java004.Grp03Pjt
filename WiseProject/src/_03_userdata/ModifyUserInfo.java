package _03_userdata;

import java.io.IOException;
import java.io.InputStream;
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
import _01_register.controller.JavaMailMain;
import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;
import _01_register.model.IMemberDAO;
import _01_register.model.MemberBean;
import _01_register.model.MemberHibernateDAO;
import _01_register.util.DBUtils;

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
@WebServlet("/_14_UserData/ModifyUserInfo.do")
public class ModifyUserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8"); // 文字資料轉內碼
		// 準備存放錯誤訊息的Map物件
		Map<String, String> errorMsg = new HashMap<String, String>();
		// 準備存放註冊成功之訊息的Map物件
		Map<String, String> msgOK = new HashMap<String, String>();
		// 註冊成功後將用response.sendRedirect()導向新的畫面，所以需要
		// session物件來存放共用資料。
		HttpSession session = request.getSession();
		request.setAttribute("MsgMap", errorMsg); // 顯示錯誤訊息
		session.setAttribute("MsgOK", msgOK); // 顯示正常訊息

		int userId = 0;
		int artId = 0;
		String account = "";
		String old_password = "";
		String password = "";
		String password2 = "";
		String user_name = "";
		String phonenum = "";
		String email = "";
		String gender = "";
		String birthday = "";
		String fileName = "";
		boolean check_tag = false;
		boolean authenticate = false;
		String Introduction = "";
		String bank_account = "";
		String ID = "";
		String art_name = "";
		String art_address = "";
		String hashtag = "";
		String intro_pic_name = "";

		InputStream is = null;
		InputStream ipis = null;
		IMemberDAO mb = new MemberHibernateDAO();
		IArtistDAO ab = new ArtistHibernateDAO();
		MemberBean old_mb = null;
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
					
					if (fldName.equals("user_id")) {
						userId = Integer.parseInt(value);
					}else if (fldName.equals("account")) {
						account = value;
					}else if (fldName.equals("old_password")) {
						old_password = value;
					} else if (fldName.equalsIgnoreCase("password")) {
						password = value;
					} else if (fldName.equalsIgnoreCase("password2")) {
						password2 = value;
					} else if (fldName.equalsIgnoreCase("user_name")) {
						user_name = value;
					} else if (fldName.equalsIgnoreCase("phonenum")) {
						phonenum = value;
					} else if (fldName.equalsIgnoreCase("email")) {
						email = value;
					} else if (fldName.equalsIgnoreCase("gender")) {
						gender = value;
					} else if (fldName.equalsIgnoreCase("birthday")) {
						birthday = value;
					} else if (fldName.equals("registerArtist")) {
						check_tag = Boolean.parseBoolean(value);	
					} else if (fldName.equals("authenticate")) {
						authenticate = Boolean.parseBoolean(value);
					}else if (fldName.equals("art_id")) {
						artId = Integer.parseInt(value);
					}else if (fldName.equalsIgnoreCase("Introduction")) {
						Introduction = value;
					} else if (fldName.equalsIgnoreCase("bank_account")) {
						bank_account = value;
					} else if (fldName.equalsIgnoreCase("ID")) {
						ID = value;
					} else if (fldName.equalsIgnoreCase("art_name")) {
						art_name = value;
					} else if (fldName.equalsIgnoreCase("art_address")) {
						art_address = value;
					} else if (fldName.equalsIgnoreCase("hashtag")) {
						hashtag = value;
					}
				} else {
					if (fldName.equalsIgnoreCase("portrait") && value!=null) {
						fileName = GlobalService.getFileName(p); // 此為圖片檔的檔名
						fileName = GlobalService.adjustFileName(fileName, GlobalService.IMAGE_FILENAME_LENGTH);
						if (fileName != null && fileName.trim().length() > 0) {
							is = p.getInputStream();
						}
					}				
					if (fldName.equalsIgnoreCase("intro_pic") && value!=null) {
						intro_pic_name = GlobalService.getFileName(p); // 此為圖片檔的檔名
						intro_pic_name = GlobalService.adjustFileName(intro_pic_name,
								GlobalService.IMAGE_FILENAME_LENGTH);
						
						if (intro_pic_name != null && intro_pic_name.trim().length() > 0) {
							ipis = p.getInputStream();
						}
					}
				}
			}
			// 2. 進行必要的資料轉換

			// 3. 檢查使用者輸入資料
			//讀取更新前的會員資料
			old_mb = mb.findByPrimaryKey(userId);
			
			if (old_password == null || old_password.trim().length() == 0) {
				errorMsg.put("errorOldPassword", "原註冊密碼欄必須輸入");
			} else if (!old_password.equals(old_mb.getPassword())) {
				errorMsg.put("errorOldPassword", "密碼錯誤，請重新輸入!");
			}
			if (password == null || password.trim().length() == 0) {
				password = old_mb.getPassword();
			} else if (!Pattern.matches("^(?=.*[a-zA-Z]+)(?=.*\\d+)[a-zA-Z0-9]{6,16}$", password)) {
				errorMsg.put("errorPassword", "密碼長度須介於6-16字之間並包含英文、數字");
			} 
			if (password.trim().length() > 0 && password2.trim().length() > 0 && !password.equals(old_mb.getPassword())) {
				if (!password.trim().equals(password2.trim())) {
					errorMsg.put("errorPassword2", "密碼欄必須與確認欄一致");
					errorMsg.put("errorPassword", "*");
				}
			}
			if (user_name == null || user_name.trim().length() == 0) {
				user_name = old_mb.getPassword();
			} else if (mb.checkExists(user_name) && !user_name.equals(old_mb.getUser_name()) ) {
				errorMsg.put("errorUserName", "此會員名稱已被註冊，請更換會員名稱");
			}

			if (phonenum == null || phonenum.trim().length() == 0) {
				errorMsg.put("errorPhonenum", "手機號碼欄必須輸入");
			} else if (!Pattern.matches("^([0][9])\\d{8}", phonenum)) {
				errorMsg.put("errorPhonenum", "手機號碼格式錯誤");
			} else if (mb.checkExists(phonenum) && !phonenum.equals(old_mb.getPhonenum())) {
				errorMsg.put("errorPhonenum", "此手機號碼已被註冊，請更換手機號碼");
			}

			if (email == null || email.trim().length() == 0) {
				errorMsg.put("errorEmail", "會員信箱欄必須輸入");
			} else if (!Pattern.matches("^\\w+\\.*\\w+@(\\w+\\.){1,5}[a-zA-Z]{2,3}$", email)) {
				errorMsg.put("errorEmail", "會員信箱格式錯誤");
			} else if (mb.checkExists(email) && !email.equals(old_mb.getEmail())) {
				errorMsg.put("errorEmail", "此會員信箱已被註冊，請更換會員信箱");
			}

			if (check_tag) {
				

				if (ID == null || ID.trim().length() == 0) {
					errorMsg.put("errorID", "身分證字號欄必須輸入");
				} else if (!Pattern.matches("[ABCDEFGHJKLMNPQRSTUVXYWZIO][12]\\d{8}", ID)) {
					errorMsg.put("errorID", "身分證字號格式錯誤");
				}else if (mb.checkExists(ID)) {
					errorMsg.put("errorID", "此身分證字號已被註冊，請更換身分證字號");
				}

				if (art_name == null || art_name.trim().length() == 0) {
					errorMsg.put("errorArtName", "真實姓名欄必須輸入");
				}
				if (art_address == null || art_address.trim().length() == 0) {
					errorMsg.put("errorArtAddress", "通訊地址欄必須輸入");
				}
				
				

			}
		} else {
			errorMsg.put("errTitle", "此表單不是上傳檔案的表單");
		}
		// 如果有錯誤

		if (!errorMsg.isEmpty()) {
			// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
			RequestDispatcher rd = request.getRequestDispatcher("/_14_UserData//ModifyUserInfo.jsp");
			rd.forward(request, response);
			return;
		}
		try {
			// 4. 進行Business Logic運算
			// 儲存會員的資料
    
//          String gender = ID.charAt(1);        利用ID判定男女
			MemberBean mem = new MemberBean(userId, account, password, user_name, phonenum, email, gender, birthday, check_tag,
					authenticate);
			int n = 0;
			if (is != null) {
				String dirPortrait = getServletContext().getInitParameter("upload.location.portrait");
				DBUtils.isToFiles(is, fileName, dirPortrait);
				mem.setFile_name("http://saudade.myasustor.com/JPjt/portrait/"+fileName);
			}
			
			//如果Email有更新，將認證設為false
			if(!email.equalsIgnoreCase(old_mb.getEmail())){
				mem.setAuthenticate(false);
			};
			
			// 如果修改一般會員資料，僅將MemberBean mem寫入Database
			if (!check_tag) {
				n = mb.update(mem);
			}else{
				ArtistBean art = new ArtistBean(artId, user_name, Introduction, bank_account, ID, art_name, art_address,
						hashtag);
				if (ipis != null) {
					String dirIntro = getServletContext().getInitParameter("upload.location.intro"); 
					DBUtils.isToFiles(ipis, intro_pic_name, dirIntro);
					art.setFile_name( "http://saudade.myasustor.com/JPjt/intro_pic/" + intro_pic_name);
				}
				// 如果修改創作者會員資料，會將MemberBean mem及ArtistBean art寫入Database
				n = ab.update(mem, art);
				
			}
			
			

			if (n == 1) {
				if(!email.equalsIgnoreCase(old_mb.getEmail())){
					JavaMailMain.sendModifyMail(email, userId);
				}	
				response.sendRedirect("ModUserInfoOk.jsp");
				return;
			} else {
				errorMsg.put("errorAccountDup", "新增此筆資料有誤(RegisterServlet)");
			}

			// 5.依照 Business Logic 運算結果來挑選適當的畫面
			if (!errorMsg.isEmpty()) {
				// 導向原來輸入資料的畫面，這次會顯示錯誤訊息
				RequestDispatcher rd = request.getRequestDispatcher("/_14_UserData//ModifyUserInfo.jsp");
				rd.forward(request, response);
				return;
			}
		} catch (Exception e) {
			e.printStackTrace();
			errorMsg.put("errorAccountDup", e.getMessage());
			RequestDispatcher rd = request.getRequestDispatcher("/_14_UserData//ModifyUserInfo.jsp");
			rd.forward(request, response);
		}
	}
}