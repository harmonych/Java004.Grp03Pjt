package _00_init;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
public class EDMTableDataWithImageReset {
   public static final String UTF8_BOM = "\uFEFF";  // 定義 UTF-8的BOM字元 
   
   public static void main(String args[]) {
      Connection con;
      PreparedStatement pstmt;
      PreparedStatement pstmt1;
      Statement stmt;
      String dropString;   
      String createString;
      String line  = "";
      String sql   = "";
      String sql1  = "";
      String encrypedString = "";
      try {
          // 連上後端的資料庫
          con =  DriverManager.getConnection(
        		  GlobalService.DB_URLMySQL, 
        		  GlobalService.USERID, 
        		  GlobalService.PASSWORD);
          // 建立Statement物件，以便傳送SQL命令到後端的資料庫
          stmt = con.createStatement();
          
      }  catch(SQLException e) {
          System.err.println("存取資料庫有關的例外：" + e.getMessage() );
          e.printStackTrace() ;
          return ;
      }
      // 定義刪除eMember表格的SQL命令
      dropString = "DROP Table UserInfo " ;
      try {    
    	  // 執行刪除eMember表格的SQL命令
          stmt.executeUpdate(dropString); 
          // 印出執行成功的訊息
          System.out.println("UserInfo表格刪除成功") ;
      } catch(SQLException e) {
          System.err.println("刪除UserInfo表格時發生例外: " + e.getMessage());
      }
      // 定義新建eMember表格的SQL命令      
      createString = "Create Table UserInfo " +
             " (account varchar(40) NOT NULL Primary Key, " +
             " password varchar(32) NOT NULL, " +
             " user_name varchar(20) NOT NULL, " +
             " phonenum char(10) NOT NULL, " +
             " email varchar(40) NOT NULL, " +
             " gender char(1), " +
             " birthday datetime, " +
             " head_pic MediumBlob, " +
             " fileName varchar(20)" +
             ") CHARACTER SET utf8 COLLATE utf8_general_ci";    
      try {
          //  執行新建eMember表格的SQL命令   
          stmt.executeUpdate(createString);
          // 印出執行成功的訊息
          System.out.println("UserInfo表格產生成功") ;
          //  對eMember表格新增三筆測試用紀錄  
          sql1 = "insert into UserInfo " +
	  		" (account, password, user_name, phonenum, email, gender, birthday, " +
	  		" head_pic, fileName) " +
	  		" values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
          pstmt1 = con.prepareStatement(sql1);
          //Statement pstmt2 = con.createStatement();
          pstmt1.setString(1, "anan");
          encrypedString = GlobalService.encryptString("123");
          pstmt1.setString(2, GlobalService.getMD5Endocing(encrypedString));  //密碼都是 123
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
    	  // 設定fileName欄位
    	  String fileName = imageFile.getName();
    	  // 調整檔名的字元數
    	  fileName = GlobalService.adjustFileName(fileName, GlobalService.IMAGE_FILENAME_LENGTH);
    	  pstmt1.setString(9, fileName);    	  
          pstmt1.executeUpdate();
        
          //-------
          sql1 = "insert into UserInfo " +
      	  		" (account, password, user_name, phonenum, email, gender, birthday, " +
      	  		" head_pic, fileName) " +
      	  		" values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                pstmt1 = con.prepareStatement(sql1);
                //Statement pstmt2 = con.createStatement();
                pstmt1.setString(1, "mary");
                encrypedString = GlobalService.encryptString("456");
                pstmt1.setString(2, GlobalService.getMD5Endocing(encrypedString));  //密碼都是 123
                pstmt1.setString(3, "MaryChen");
                pstmt1.setString(4, "0954653423");
                pstmt1.setString(5, "MaryChen@gmail.com");
                pstmt1.setString(6, "女");
                pstmt1.setString(7, "1993-01-01");
                // 讀取要寫入表格的圖片檔
          	  imageFile = new File("WebContent/images/smallPic/mickyabcde12345678901234567890.jpeg");
          	  size = imageFile.length();
          	  is = new FileInputStream(imageFile);
          	  // 設定Image欄位
          	  pstmt1.setBlob(8, is, size);
          	  // 設定fileName欄位
          	  fileName = imageFile.getName();
          	  // 調整檔名的字元數
          	  fileName = GlobalService.adjustFileName(fileName, GlobalService.IMAGE_FILENAME_LENGTH);
          	  pstmt1.setString(9, fileName);    	  
               pstmt1.executeUpdate();
          
          

          System.out.println("UserInfo 資料新增成功") ;
      } catch(SQLException e) {
          System.err.println("新建UserInfo表格時發生例外: " + e.getMessage());
          e.printStackTrace();
      } catch(IOException e) {
          System.err.println("新建UserInfo表格時發生IO例外: " + e.getMessage());
      } 
      
      
      // 關閉相關的物件
      finally {
         try {
             if (stmt!=null)  stmt.close();
         } catch(Exception e) {
             System.err.println("關閉相關物件時發生例外: " + e);
         }
         try {
             if (stmt!=null)  con.close();
         } catch(Exception e) {
             System.err.println("關閉相關物件時發生例外: " + e);
         }
      }
   }
}