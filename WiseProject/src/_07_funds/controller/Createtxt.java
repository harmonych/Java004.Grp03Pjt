package _07_funds.controller;

import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;

public class Createtxt {
	public static void newFile(String filePathAndName,char[] fileContent) {
		 

		 try{
		 String filePath = filePathAndName;
		 filePath = filePath.toString();
		 File myFilePath = new File(filePath);
		 if (!myFilePath.exists()) {
		 myFilePath.createNewFile();
		 }
		 FileWriter resultFile = new FileWriter(myFilePath);
		 PrintWriter myFile = new PrintWriter(resultFile);
		 char[] strContent = fileContent;
		 myFile.println(strContent);
		 resultFile.close();
		  

		 }
		 catch(Exception e) {
		 System.out.println("新建目錄操作出錯");
		 e.printStackTrace();
		  
		 }
		 return ;
		 }
   }


