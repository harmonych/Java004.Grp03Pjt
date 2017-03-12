package _07_fund.util;

import java.io.BufferedReader;
import java.io.CharArrayWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import _07_fund.model.FundBean;
import _07_fund.model.FundHibernateDAO;
import _07_fund.model.IFundsDAO;



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
		IFundsDAO dao = new FundHibernateDAO();
		try (
			FileInputStream fis = new FileInputStream(filename);
			InputStreamReader in = new InputStreamReader(fis, encoding);
			BufferedReader br = new BufferedReader(in);
		) {
			
			String line = "";
			while ((line = br.readLine()) != null) {
			  String[] sa = line.split(",");
			  int fcid = Integer.parseInt(sa[0].trim());
			  int artid  = Integer.parseInt(sa[1].trim());
			  String fcname = sa[2].trim();
			  int fcmoney = Integer.parseInt(sa[3].trim());
			  int nowmoney = Integer.parseInt(sa[4].trim());
			  String createtime = sa[5].trim();
			  String starttime = sa[6].trim();
			  String endtime =  sa[7].trim();
			  String updatetime  =sa[8].trim();
			  
			  
//			  SimpleDateFormat simple = new SimpleDateFormat();
//			  simple.applyPattern("yyyy/MM/dd");
//			  try{
//			  Date createtime = simple.parse(sa[5].trim());
//			  Date starttime = simple.parse(sa[6].trim());
//			  Date endtime =  simple.parse(sa[7].trim());
//			  Date updatetime  =  simple.parse(sa[8].trim());
//			  }catch(ParseException e){
//				  e.printStackTrace();
//			  }
			  String fcintroduction = sa[9].trim();
			  //char[] fcintroduction = DBUtils.fileToChars("text/" + sa[9].trim(), encoding);
			  String hashtag = sa[10].trim();
			  FundBean fb = new FundBean(fcid,artid,fcname,fcmoney,nowmoney,createtime,starttime,endtime,updatetime,fcintroduction,hashtag);
			  
			  dao.insert(fb);

			}
			System.out.println("檔案" + filename + "新增完畢");
		} catch (IOException ex) {
			System.out.println(ex.getMessage() + "==>" + filename);
			ex.printStackTrace();
		}
	}

//	public static void displayData(FundsBean fb) {
//		String saveFolderImg = "D:\\images1221";
//		File dirImg = new File(saveFolderImg);
//		if (!dirImg.exists())  dirImg.mkdirs();
//		String filenameImg = fb.getFcname(); 
//		File fileImg = new File(dirImg, filenameImg);
//		
//		
//		String saveFolderTxt = "D:\\text1221";
//		File dirTxt = new File(saveFolderTxt);
//		if (!dirTxt.exists())  dirTxt.mkdirs();
//		String filenameTxt = "Comment" + fb.getFcid() + ".txt"; 
//		File fileTxt = new File(dirTxt, filenameTxt);
//		
//		System.out.println("Fcid :"  + fb.getFcid());
//		System.out.println("Artid  :"  + fb.getArtid());
//		System.out.println("Fcname     :"  + fb.getFcname());
//		System.out.println("Fcmoney    :"  + fb.getFcmoney());
//		System.out.println("Nowmoney  :"  + fb.getNowmoney());
//		System.out.println("Createtime:"  + fb.getCreatetime());
//		System.out.println("Starttime:"  + fb.getStarttime());
//		System.out.println("Endtime     :"  + fb.getEndtime());
//		System.out.println("Updatetime :"  + fb.getUpdatetime());
//		saveCharsToFile(fb.getFcintroduction(), fileTxt, "BIG5");
//	}
}
