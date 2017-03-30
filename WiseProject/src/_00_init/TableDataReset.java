package _00_init;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class TableDataReset {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {
		Connection con;
		PreparedStatement pstmt1;
		Statement stmt;
		String dropString;
		String createString;
		String sql1 = "";
		String encrypedString = "";
		try {
			// 連上後端的資料庫
			con = DriverManager.getConnection(GlobalService.DB_URLMySQL, GlobalService.USERID, GlobalService.PASSWORD);
			// 建立Statement物件，以便傳送SQL命令到後端的資料庫
			stmt = con.createStatement();

		} catch (SQLException e) {
			System.err.println("存取資料庫有關的例外：" + e.getMessage());
			e.printStackTrace();
			return;
		}
		// 定義刪除UserInfo表格的SQL命令
		dropString = "DROP Table userInfo ";
		try {
			// 執行刪除UserInfo表格的SQL命令
			stmt.executeUpdate(dropString);
			// 印出執行成功的訊息
			System.out.println("User Info表格刪除成功");
		} catch (SQLException e) {
			System.err.println("刪除User Info表格時發生例外: " + e.getMessage());
		}
		// 定義新建UserInfo表格的SQL命令
		createString = "Create Table userInfo " + " (user_id int Primary Key auto_increment, "
				+ " account varchar(40) NOT NULL, " + " password varchar(32) NOT NULL, "
				+ " user_name varchar(20) NOT NULL, " + " phonenum varchar(20) NOT NULL, "
				+ " email varchar(40) NOT NULL, " + " gender char(1), " + " birthday datetime, "
				+ " head_pic MediumBlob )" + "CHARACTER SET utf8 COLLATE utf8_general_ci";
		try {
			// 執行新建UserInfo表格的SQL命令
			stmt.executeUpdate(createString);
			// 印出執行成功的訊息
			System.out.println("userInfo表格產生成功");
			// 對UserInfo表格新增三筆測試用紀錄
			sql1 = "insert into userInfo "
					+ " (user_id, account, password, user_name, phonenum, email, gender, birthday, "
					+ " head_pic) " + " values (null, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt1 = con.prepareStatement(sql1);
			// Statement pstmt2 = con.createStatement();
			pstmt1.setString(1, "anan");
			encrypedString = GlobalService.encryptString("123");
			pstmt1.setString(2, GlobalService.getMD5Endocing(encrypedString)); 
			pstmt1.setString(3, "AndyChen");
			pstmt1.setString(4, "0987645623");
			pstmt1.setString(5, "h54654@gmail.com");
			pstmt1.setString(6, "男");
			pstmt1.setString(7, "1990-11-11");
			// 讀取要寫入表格的圖片檔
			File imageFile = new File("WebContent/images/smallPic/kittyabcde12345678901234567890.jpg");
			long size = imageFile.length();
			InputStream is = new FileInputStream(imageFile);
			// 設定Image欄位
			pstmt1.setBlob(8, is, size);
			pstmt1.executeUpdate();

			// -------

			pstmt1.setString(1, "mary");
			encrypedString = GlobalService.encryptString("456");
			pstmt1.setString(2, GlobalService.getMD5Endocing(encrypedString)); 
			pstmt1.setString(3, "MaryChen");
			pstmt1.setString(4, "z0954653423");
			pstmt1.setString(5, "MaryChen@gmail.com");
			pstmt1.setString(6, "女");
			pstmt1.setString(7, "1993-01-01");
			// 讀取要寫入表格的圖片檔
			imageFile = new File("WebContent/images/smallPic/mickyabcde12345678901234567890.jpeg");
			size = imageFile.length();
			is = new FileInputStream(imageFile);
			// 設定Image欄位
			pstmt1.setBlob(8, is, size);
			
			pstmt1.executeUpdate();

			System.out.println("UserInfo資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建UserInfo表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		} catch (IOException e) {
			System.err.println("新建UserInfo表格時發生IO例外: " + e.getMessage());
		}

		// ------------------------------------------------------------

		dropString = "DROP TABLE IF EXISTS artist ";
		createString = "Create Table artist" + "(artid int  auto_increment  primary  key ," + " Introduction text,"
				+ " intro_pic MediumBlob, " + " bank_account varchar(20), " + "ID 		char(10), "
				+ "art_name varchar(20), " + "art_address varchar(100), " + "hash_tag varchar(100)"
				+ " ) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;  ";
		try {
			// 執行刪除artist表格的SQL命令
			stmt.executeUpdate(dropString);
			System.out.println("artist表格產生成功");
			// 執行新建artist表格的SQL命令
			stmt.executeUpdate(createString);
			// 印出執行成功的訊息
			System.out.println("artist表格產生成功");
			sql1 = "insert into artist " + " (artid, Introduction, intro_pic, bank_account, "
					+ "ID, art_name, art_address, " +  "hash_tag) " + " values (null, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt1 = con.prepareStatement(sql1);
			// Statement pstmt2 = con.createStatement();
			pstmt1.setString(1, "大家好，我是Andy");
			// 讀取要寫入表格的圖片檔
			File imageFile = new File("WebContent/images/smallPic/doraemon.jpg");
			long size = imageFile.length();
			InputStream is = new FileInputStream(imageFile);
			// 設定Image欄位
			pstmt1.setBlob(2, is, size);
			pstmt1.setString(3, "00010102709483");
			pstmt1.setString(4, "J132564876");
			pstmt1.setString(5, "王小明");
			pstmt1.setString(6, "台北市圈圈路叉叉巷87號");
			pstmt1.setString(7, "02-2234864");
			pstmt1.setString(8, "萌");
			pstmt1.executeUpdate();
			System.out.println("artist資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建artist表格時發生例外: " + e.getMessage());
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			System.err.println("新建artist圖片時發生例外: " + e.getMessage());
			e.printStackTrace();
		}

		// ------------------------------------------------------------

		dropString = "DROP TABLE IF EXISTS fundscollection ";
		createString = "Create Table fundscollection " + "(fcid int  auto_increment  primary  key , "
				+ " artid			int, " + "fcname    	varchar(60), " + " fcmoney			int, "
				+ " nowmoney		int, " + " createtime		int, " + " starttime  		int, "
				+ "endtime 		int, " + " updatetime   	int, " + "fcintroduction varchar(60)"
				+ " ) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;  ";
		try {
			// 執行刪除fundscollection表格的SQL命令
			stmt.executeUpdate(dropString);
			System.out.println("fundscollection表格刪除成功");
			// 執行新建fundscollection表格的SQL命令
			stmt.executeUpdate(createString);
			System.out.println("fundscollection表格產生成功");
			// 新增fundscollection表格資料
			String s1 = "INSERT INTO fundscollection VALUES (null, '1', '掛軸募集', '10000','1500','10', '1000','150','1','000');";
			String s2 = "INSERT INTO fundscollection VALUES (null, '2', 'Re:0同人本', '20000','2000','11', '1000','150','2','111');";
			String s3 = "INSERT INTO fundscollection VALUES (null, '3', '龍族拼圖畫冊', '30000','5000','12', '1000','150','3','222');";
			pstmt1 = con.prepareStatement(s1);
			pstmt1.executeUpdate();
			pstmt1 = con.prepareStatement(s2);
			pstmt1.executeUpdate();
			pstmt1 = con.prepareStatement(s3);
			pstmt1.executeUpdate();
			System.out.println("fundscollection資料新增成功");
		} catch (SQLException e) {
			System.err.println("新建fundscollection表格時發生SQL例外: " + e.getMessage());
			e.printStackTrace();
		}

		// 關閉相關的物件
		finally {
			try {
				if (stmt != null)
					stmt.close();
			} catch (Exception e) {
				System.err.println("關閉相關物件時發生例外: " + e);
			}
			try {
				if (stmt != null)
					con.close();
			} catch (Exception e) {
				System.err.println("關閉相關物件時發生例外: " + e);
			}
		}

	}
}
