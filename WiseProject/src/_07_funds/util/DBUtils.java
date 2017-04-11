package _07_funds.util;

import java.io.BufferedReader;
import java.io.CharArrayWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import _07_funds.model.FcPicBean;
import _07_funds.model.FcPicHBNDAO;
import _07_funds.model.FundsBean;
import _07_funds.model.FundsHibernateDAO;
import _07_funds.model.IFcPicDAO;
import _07_funds.model.IFundsDAO;



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
		IFundsDAO dao = new FundsHibernateDAO();
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
			  FundsBean fb = new FundsBean(fcid,artid,fcname,fcmoney,nowmoney,createtime,starttime,endtime,updatetime,fcintroduction,hashtag);
			  
			  dao.insert(fb);

			}
			System.out.println("檔案" + filename + "新增完畢");
		} catch (IOException ex) {
			System.out.println(ex.getMessage() + "==>" + filename);
			ex.printStackTrace();
		}
	}
	
	public static void initFcPic(String filename, String encoding){
		IFcPicDAO dao = new FcPicHBNDAO();
		try (
			FileInputStream fis = new FileInputStream(filename);
			InputStreamReader in = new InputStreamReader(fis, encoding);
			BufferedReader br = new BufferedReader(in);
		) {
			
			String line = "";
			while ((line = br.readLine()) != null) {
			  String[] sa = line.split(",");
			  int pic_id = Integer.parseInt(sa[0].trim());
			  int fc_id  = Integer.parseInt(sa[1].trim());
			  String pic_address = sa[2].trim();
			  FcPicBean fpb = new FcPicBean(pic_id, fc_id, pic_address);
			  dao.insert(fpb);

			}
			System.out.println("檔案" + filename + "新增完畢");
		} catch (IOException ex) {
			System.out.println(ex.getMessage() + "==>" + filename);
			ex.printStackTrace();
		}
	}

	public static void displayData(FundsBean fb) {
		
		System.out.println("Fcid :"  + fb.getFc_id());
		System.out.println("Artid  :"  + fb.getArt_id());
		System.out.println("Fcname     :"  + fb.getFc_name());
		System.out.println("Fcmoney    :"  + fb.getFc_money());
		System.out.println("Nowmoney  :"  + fb.getNow_money());
		System.out.println("Createtime:"  + fb.getCreate_time());
		System.out.println("Starttime:"  + fb.getStart_time());
		System.out.println("Endtime     :"  + fb.getEnd_time());
		System.out.println("Updatetime :"  + fb.getUpdate_time());
		System.out.println("introduction :"+fb.getFc_introduction());
	}
}
