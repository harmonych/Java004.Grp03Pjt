package _00_init;
/*  
    程式說明：建立表格與設定初始測試資料。
    表格包括：eMember, eBook, eBookCompany, Orders, OrderItems
      
(1) eMember欄位說明:
    seqNo       : 會員流水號Pri.Key  整數      IDENTITY
    memberId    : 會員編號           字串      20
    name        : 姓名               字串      32
    password    : 密碼               字串      32
    address     : 地址               字串      64
    email       : email              字串      64
    tel         : 電話日             字串      15
    userType    : 會員類別           字串      10
    experience  : 使用經驗           整數   
    register    : 註冊時間           datetime
    totalAmount : 訂購總金額         money
    memberImage : 照片               image
    fileName    : 封面圖檔檔名       字串      20
    
(2) eBook欄位說明:
    bookId      : 書籍代號Pri.Key    整數      IDENTITY
    title       : 書籍名稱           字串      50
    author      : 作者               字串      28
    price       : 價格               money
    discount    : 折扣               money
    companyId   : 出版社代號         整數      
    fileName    : 封面圖檔檔名       字串      20
    bookNo      : 書號               字串      20
    CoverImage  : 封面照片           image   

(3) eBookCompany欄位說明:
    id 		     : PrimaryKey         整數      IDENTITY
    name         : 出版社名稱         字串      60
    address      : 出版社地址         字串      60
    url          : 出版社URL          字串      120
    
(4) Orders欄位說明:
    orderNo        : 訂單編號PrimaryKey 整數      IDENTITY
    userId         : 客戶編號           字串      20
    totalAmount    : 總金額             money
    shippingAddress: 出貨地址           字串      64    
    BNO            : 統一編號           字串       8
    invoiceTitle   : 發票抬頭           字串      72
    orderDate      : 訂單日期           datetime 
    ShippingDate   : 出貨日期           datetime
    CancelTag      : 取消               字串       1
    
(5) OrderItems欄位說明:
    seqNo        : PrimaryKey            整數      IDENTITY
    orderNo      : 訂單編號              整數
    bookID       : 書籍代號              整數
    Description  : 說明                  字串      72
    amount       : 數量                  int
    unitPrice    : 單價                  money
    Discount     : 折扣                  money
 
*/
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
public class TableDataReset {
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
             " phonenum varchar(20) NOT NULL, " +
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
      dropString = "DROP TABLE IF EXISTS fundscollection " ;
      createString = "Create Table fundscollection " +
    		  "(fcid int  auto_increment  primary  key , "
				+ " artid			int, " + "fcname    	varchar(60), "
				+ " fcmoney			int, " + " nowmoney		int, "
				+ " createtime		int, " + " starttime  		int, "
				+ "endtime 		int, " + " updatetime   	int, " 
				+ "fcintroduction varchar(60)"
				+ " ) DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;  " ;    
      try {
    	// 執行刪除eBook表格的SQL命令
          stmt.executeUpdate(dropString); 
          // 執行新建eBook表格的SQL命令   
          stmt.executeUpdate(createString);
          // 印出執行成功的訊息
          System.out.println("新建fundscollection表格成功") ;
          String s1 = "INSERT INTO fundscollection VALUES (null, '1', '掛軸募集', '10000','1500','10', '1000','150','1','000');";
   		  String s2 = "INSERT INTO fundscollection VALUES (null, '2', 'Re:0同人本', '20000','2000','11', '1000','150','2','111');";
		  String s3= "INSERT INTO fundscollection VALUES (null, '3', '龍族拼圖畫冊', '30000','5000','12', '1000','150','3','222');";
		  pstmt1 = con.prepareStatement(s1);
          pstmt1.executeUpdate();
          pstmt1 = con.prepareStatement(s2);
          pstmt1.executeUpdate();
          pstmt1 = con.prepareStatement(s3);
          pstmt1.executeUpdate();
          System.out.println("===============fundscollection資料新增成功 ===============") ;
      } catch(SQLException e) {
          System.err.println("新建fundscollection表格時發生SQL例外: " + e.getMessage());
          e.printStackTrace();
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
