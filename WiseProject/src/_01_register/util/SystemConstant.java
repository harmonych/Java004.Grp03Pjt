package _01_register.util;

public class SystemConstant {    
    public static final String JDBC_DRIVER = "com.mysql.jdbc.Driver"; 
    public static final String HOST = "127.0.0.1";
    public static final String DB = "jspDB";
    public static final String USER = "root";
    public static final String PASSWORD = "password";
    public static final String URL = "jdbc:mysql://" + HOST + ":3306/" + SystemConstant.DB
			+ "?user=" + SystemConstant.USER + "&password="
			+ SystemConstant.PASSWORD + "&useSSL=true&useUnicode=yes&characterEncoding=UTF-8";
}




