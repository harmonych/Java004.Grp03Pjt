package _08_product.util;

import java.io.BufferedReader;
import java.io.CharArrayWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import _08_product.model.IProPicDAO;
import _08_product.model.IProductDAO;
import _08_product.model.ProPicBean;
import _08_product.model.ProPicHBNDAO;
import _08_product.model.ProductBean;
import _08_product.model.ProductHibernateDAO;



public class DBUtils {
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
	public static void saveCharsToFile(char[] comment, File file, String encoding) {
		try (
		   FileOutputStream fos = new FileOutputStream(file);
		   OutputStreamWriter osw = new OutputStreamWriter(fos, encoding);
		   PrintWriter pw = new PrintWriter(osw) ;		
		) {
			pw.println(new String(comment));
		} catch(IOException ex){
			ex.printStackTrace();
		}
	}
	public static void saveBytesToFile(byte[] picture, File file) {
		try (
		   FileOutputStream fos = new FileOutputStream(file);
		) {
			fos.write(picture);
		} catch(IOException ex){
			ex.printStackTrace();
		}
		
	}
	public static void initPlace(String filename, String encoding){
		IProductDAO dao = new ProductHibernateDAO();
		try (
			FileInputStream fis = new FileInputStream(filename);
			InputStreamReader in = new InputStreamReader(fis, encoding);
			BufferedReader br = new BufferedReader(in);
		) {
			
			String line = "";
			while ((line = br.readLine()) != null) {
			  String[] sa = line.split(",");
			  			  
			  int proid = Integer.parseInt(sa[0].trim());
			  String proname  = sa[1].trim();
			  int price = Integer.parseInt(sa[2].trim());
			  int proinv = Integer.parseInt(sa[3].trim());		      
			  String saletime = sa[4].trim();
			  String prointroduction =sa[5].trim();
			  //char[] prointroduction = DBUtils.fileToChars("text/" + sa[5].trim(), encoding);
			  int artid = Integer.parseInt(sa[6].trim());
			  String hashtag = sa[7].trim();			  
			  ProductBean pb = new ProductBean(proid,proname,price,saletime,proinv,prointroduction,artid,hashtag);
			  dao.insert(pb);

			}
			System.out.println("檔案" + filename + "新增完畢");
		} catch (IOException ex) {
			System.out.println(ex.getMessage() + "==>" + filename);
			ex.printStackTrace();
		}
	}

//	public static void displayData(ProductBean pb) {
//		String saveFolderImg = "D:\\images1221";
//		File dirImg = new File(saveFolderImg);
//		if (!dirImg.exists())  dirImg.mkdirs();
//		String filenameImg = pb.getFcname(); 
//		File fileImg = new File(dirImg, filenameImg);
//		
//		
//		String saveFolderTxt = "D:\\text1221";
//		File dirTxt = new File(saveFolderTxt);
//		if (!dirTxt.exists())  dirTxt.mkdirs();
//		String filenameTxt = "Comment" + fb.getFcid() + ".txt"; 
//		File fileTxt = new File(dirTxt, filenameTxt);
//		
//		System.out.println("Fcid :"  + pb.getFcid());
//		System.out.println("Artid  :"  + pb.getArtid());
//		System.out.println("Fcname     :"  + pb.getFcname());
//		System.out.println("Fcmoney    :"  + pb.getFcmoney());
//		System.out.println("Nowmoney  :"  + pb.getNowmoney());
//		System.out.println("Createtime:"  + pb.getCreatetime());
//		System.out.println("Starttime:"  + pb.getStarttime());
//		System.out.println("Endtime     :"  + pb.getEndtime());
//		System.out.println("Updatetime :"  + pb.getUpdatetime());
//		saveCharsToFile(fb.getFcintroduction(), fileTxt, "BIG5");
//	}
}
