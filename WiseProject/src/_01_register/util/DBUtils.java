package _01_register.util;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.CharArrayWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.MalformedURLException;
import java.net.URL;

import _01_register.model.ArtistBean;
import _01_register.model.ArtistHibernateDAO;
import _01_register.model.IArtistDAO;
import _01_register.model.IMemberDAO;
import _01_register.model.MemberBean;
import _01_register.model.MemberHibernateDAO;

public class DBUtils {

	public static byte[] isToBytes(InputStream is) {
		byte[] data = null;
		// 緩衝
		byte[] buffer = new byte[8192];
		// 紀錄讀進來長度
		int length = 0;
		// 假如等於-1代表沒有資料了
		try (ByteArrayOutputStream baos = new ByteArrayOutputStream();) {
			while ((length = is.read(buffer)) != -1) {
				// 從緩衝區讀取buffer裡面0~length-1的位置
				baos.write(buffer, 0, length);
			}
			// ByteArrayOutputStream轉成位元陣列
			data = baos.toByteArray();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return data;
	}

	public static char[] fileToChars(String filename, String encoding) {
		try (FileInputStream fis = new FileInputStream(filename);
				InputStreamReader in = new InputStreamReader(fis, encoding);
				CharArrayWriter caw = new CharArrayWriter();) {
			int len = 0;
			char[] ca = new char[8192];
			while ((len = in.read(ca)) != -1) {
				caw.write(ca, 0, len);
			}
			return caw.toCharArray();
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return null;
	}

	public static byte[] fileToBytes(String filename) {
		File f = new File(filename);
		int len = (int) f.length();
		byte[] b = new byte[len];
		try (FileInputStream fis = new FileInputStream(f);) {
			fis.read(b);
		} catch (Exception ex) {
			ex.getMessage();
		}
		return b;
	}

	public static byte[] urlToBytes(String file_url) throws MalformedURLException {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		URL file = new URL(file_url);
		InputStream is = null;
		try {
			is = file.openStream();
			byte[] ba = new byte[8192];
			int len = 0;

			while ((len = is.read(ba)) != -1) {
				baos.write(ba, 0, len);
			}
		} catch (IOException e) {
			System.err.printf("讀取失敗 %s: %s", file.toExternalForm(), e.getMessage());
			e.printStackTrace();
		} finally {
			if (is != null)
				try {
					is.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
		return baos.toByteArray();
	}

	public static void saveCharsToFile(char[] comment, File file, String encoding) {
		try (FileOutputStream fos = new FileOutputStream(file);
				OutputStreamWriter osw = new OutputStreamWriter(fos, encoding);
				PrintWriter pw = new PrintWriter(osw);) {
			pw.println(new String(comment));
		} catch (IOException ex) {
			ex.printStackTrace();
		}
	}

	public static void saveBytesToFile(byte[] picture, File file) {
		try (FileOutputStream fos = new FileOutputStream(file);) {
			fos.write(picture);
		} catch (IOException ex) {
			ex.printStackTrace();
		}

	}

	public static void initUserInfo(String filename, String encoding) {
		IMemberDAO dao = new MemberHibernateDAO();
		IArtistDAO adao = new ArtistHibernateDAO();
		try (FileInputStream fis = new FileInputStream(filename);
				InputStreamReader in = new InputStreamReader(fis, encoding);
				BufferedReader br = new BufferedReader(in);) {

			String line = "";
			while ((line = br.readLine()) != null) {
				String[] sa = line.split(",");
				int userId = Integer.parseInt(sa[0].trim());
				String account = sa[1].trim();
				String password = sa[2].trim();
				String user_name = sa[3].trim();
				String phonenum = sa[4].trim();
				String email = sa[5].trim();
				String gender = sa[6].trim();
				String birthday = sa[7].trim();
				String file_url = sa[8].trim();
				byte[] portrait = DBUtils.urlToBytes(file_url);
				boolean check_tag = Boolean.parseBoolean(sa[9].trim());
				boolean authenticate = Boolean.parseBoolean(sa[10].trim());
				if (check_tag){
					String intro = sa[10].trim();
					String picurl = sa[11].trim();
					byte[] intro_pic = DBUtils.urlToBytes(picurl);
					String bank_account = sa[12].trim();
					String ID = sa[13].trim();
					String real_name = sa[14].trim();
					String address = sa[15].trim();
					String altphno =sa[16].trim();
					String hashtag = sa[17].trim();
					ArtistBean ab = new ArtistBean(user_name, intro, bank_account, ID, real_name, address, altphno, hashtag, intro_pic);
					adao.insert(ab);
				}
				MemberBean mb = new MemberBean(userId, account, password, user_name, phonenum, email, gender, birthday,
						file_url, portrait, check_tag, authenticate);
				dao.insert(mb);

			}
			System.out.println("檔案" + filename + "新增完畢");
		} catch (IOException ex) {
			System.out.println(ex.getMessage() + "==>" + filename);
			ex.printStackTrace();
		}
	}

	// public static void displayData(MemberBean mb) {
	// String saveFolderImg = "D:\\images1221";
	// File dirImg = new File(saveFolderImg);
	// if (!dirImg.exists()) dirImg.mkdirs();
	// String filenameImg = fb.getFcname();
	// File fileImg = new File(dirImg, filenameImg);
	//
	//
	// String saveFolderTxt = "D:\\text1221";
	// File dirTxt = new File(saveFolderTxt);
	// if (!dirTxt.exists()) dirTxt.mkdirs();
	// String filenameTxt = "Comment" + fb.getFcid() + ".txt";
	// File fileTxt = new File(dirTxt, filenameTxt);
	//
	// System.out.println("Fcid :" + fb.getFcid());
	// System.out.println("Artid :" + fb.getArtid());
	// System.out.println("Fcname :" + fb.getFcname());
	// System.out.println("Fcmoney :" + fb.getFcmoney());
	// System.out.println("Nowmoney :" + fb.getNowmoney());
	// System.out.println("Createtime:" + fb.getCreatetime());
	// System.out.println("Starttime:" + fb.getStarttime());
	// System.out.println("Endtime :" + fb.getEndtime());
	// System.out.println("Updatetime :" + fb.getUpdatetime());
	// saveCharsToFile(fb.getFcintroduction(), fileTxt, "BIG5");
	// }
}
