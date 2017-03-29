package _01_register.util;
// https://www.google.com/settings/security/lesssecureapps

/*
Step 1. 建立一個javax.mail.Session物件，此物件能與遠方的郵件伺服器
                     進行連線，以便後續的類別可以傳送郵件。
     1-1 新建一個java.util.Properties型別的物件，此物件內含多項與
                       郵件伺服器連線所需資訊。
         // 設定郵件伺服器
	     Properties props = new Properties();
	 	 props.put("mail.smtp.host", "smtp.gmail.com");
	 	 // 設定連線時使用的埠號(465)
	 	 props.put("mail.smtp.socketFactory.port", "465");
	 	 // 聲明要進行SSL(Secure Socket Layer)連線
	 	 props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	 	 // GMail要求必須要進行身分驗證(Authentication)
	  	 props.put("mail.smtp.auth", "true");
	 1-2  新建一個java.util.Authenticator型別的物件，此物件內含使用
	             郵件伺服器時所需的帳號與密碼。            
         Authenticator au = new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication("apriori402@gmail.com",
						"wxxnxxxxxxxxxxxxxxxxxxxxxxxx");
			}
		 };
		  以上為匿名者類別的寫法：產生物件時才定義類別。
     1-3 利用Session類別的靜態方法getDefaultInstance(Properties p,  Authenticator au)
                       來產生Session物件。
         Session session = Session.getDefaultInstance(props, au);
         
Step 2. 準備郵件的內容。
                     郵件的內容分為寄件者，收件者，收副本者，收密件副本者，信件主旨，信件內文，附加檔
     2-0 產生一個javax.mail.internet.MimeMessage物件message 
     2-1 設定寄件人地址: 有兩種方式設定寄件人地址 
           . message.setFrom(Address address)
           . message.addFrom(Address[] addresses)
     2-2 收件者地址: 有多種方式(><)設定寄件人地址
           . setRecipient(Message.RecipientType.TO,
                  Address address)
           . addRecipient(Message.RecipientType.TO,
                  Address address)
           . addRecipients(Message.RecipientType.TO,
                  Address[] addresses)
     2-3 收副本者: 與前同, 不過將TO換成CC
           . setRecipient(Message.RecipientType.CC,
                  Address address)
           . addRecipient(Message.RecipientType.CC,
                  Address address)
           . addRecipients(Message.RecipientType.CC,
                  Address[] addresses)                  
     2-4 收密件副本者: 與前同, 不過將TO換成BCC
           . setRecipient(Message.RecipientType.BCC,
                  Address address)
           . addRecipient(Message.RecipientType.BCC,
                  Address address)
           . addRecipients(Message.RecipientType.BCC,
                  Address[] addresses)                  
         
     2-5 信件主旨: message.setSubject(String subject)         
     2-6 信件內文: message.setText(String text)
     2-7 附件: 附件都封裝在MimeBodyPart內，一個MimeBodyPart的物件
                                    封裝一個附件。而這些MimeBodyPart的物件都會放入MimeMultipart物件內。
              MimeBodyParts are contained in MimeMultipart objects.
     所有附件都放入型別為『Multipart』的容器物件內。 
                                    實際上會使用它的子類別MimeMultipart
 */


/*
如果得到這樣的錯誤訊息:
javax.mail.AuthenticationFailedException: 534-5.7.14 <https://accounts.google.com/ContinueSignIn?sarp=1&scc=1&plt=AKgnsbt


解決之道：
先到gmail.com登入你的gmail帳號

https://www.google.com/settings/security/lesssecureapps

在這個問題上選『開啟』
安全性較低的應用程式存取權限	
     關閉
     開啟  <--- 選它

*/



import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import javax.mail.Address;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class JavaMailUtil {
	private static String userid = "wisejava004";
	private static String password = "java004wise";

	MimeMessage message;
	String from;
	String subject;
	String text;
	List<String> to;
	List<String> cc;
	List<String> bcc;
	List<String> attachment;
	

	/*
	 * 設定信件內文與附件
	 */

	public JavaMailUtil(String from, List<String> to, List<String> cc,
			List<String> bcc, String subject,  String text, List<String> attachment
			) {

		this.from = from;
		if (to == null){
			this.to = new ArrayList<>();
		} else {
			this.to = to;
		}
		if (cc == null){
			this.cc = new ArrayList<>();
		} else {
			this.cc = cc;
		}
		if (bcc == null){
			this.bcc = new ArrayList<>();
		} else {
			this.bcc = bcc;
		}
		if (subject == null) {
		   this.subject = "";
		} else {
		   this.subject = subject;
		}
		if (text == null) {
			   this.text = "";
			} else {
			   this.text = text;
			}
		if (attachment == null){
			this.attachment = new ArrayList<>();
		} else {
			this.attachment = attachment;
		}
	}

	public boolean send() {
		try {
			createSession();
			setAddresses();
			setSubject();
			addContent();
			Transport.send(message);
			return true;
		} catch (MessagingException ex) {
			ex.printStackTrace();
			String msg= ex.getMessage();
			if (msg.indexOf("Please log in via your web browser") > 0){
				System.out.println("請到https://www.google.com/settings/security/lesssecureapps");	
				System.out.println("將安全性較低的應用程式存取權限改為『開啟』，然後重新執行本程式");
			} else {
        		System.out.println(ex.getMessage());
			}
			return false;
		} catch (IOException ex) {
			System.out.println(ex.getMessage());
			return false;
		}
	}

	public void addContent() throws MessagingException, IOException {
		Multipart multipart = new MimeMultipart();
		MimeBodyPart bodyPart0 = new MimeBodyPart();
		int idx1 = tokenCount(text, "<");
		int idx2 = tokenCount(text, ">");
		System.out.println(text);
		System.out.println(idx1);
		System.out.println(idx2);
		if (idx1 == idx2 && idx1 != -1) {
			bodyPart0.setText(text, "UTF-8", "html");
		} else {
			bodyPart0.setText(text, "UTF-8", "plain");
		}
		multipart.addBodyPart(bodyPart0);
		for (String file : attachment) {
			MimeBodyPart bodyPart2 = new MimeBodyPart();
			bodyPart2.attachFile(new File(file));
			bodyPart2.setFileName(getFileName(file));
			multipart.addBodyPart(bodyPart2);
		}
		message.setContent(multipart);

	}

	/*
	 * 設定信件主旨
	 */
	public void setSubject() throws MessagingException {
		message.setSubject(subject, "UTF-8");
	}

	/*
	 * 設定寄件者，收件者，收副本者，收密件副本者
	 */
	public void setAddresses() throws AddressException, MessagingException {
		// 寄件者
		message.setFrom(new InternetAddress(from));
		// 收件者
		List<Address> listTO = new ArrayList<>();
		for (String s : to) {
			listTO.add(new InternetAddress(s));
		}
		message.addRecipients(Message.RecipientType.TO,
				listTO.toArray(new Address[0]));
		// 收副本者
		List<Address> listCC = new ArrayList<>();
		for (String s : cc) {
			listCC.add(new InternetAddress(s));
		}
		message.addRecipients(Message.RecipientType.CC,
				listCC.toArray(new Address[0]));
		// 收密件副本者
		List<Address> listBCC = new ArrayList<>();
		for (String s : bcc) {
			listBCC.add(new InternetAddress(s));
		}
		message.addRecipients(Message.RecipientType.BCC,
				listBCC.toArray(new Address[0]));

	}

	public void createSession() {
		Session session;
		Properties props = new Properties();
		props.put("mail.smtp.host", "smtp.gmail.com");
		// 設定連線時使用的埠號(465)
		props.put("mail.smtp.socketFactory.port", "465");
		// 聲明要進行SSL(Secure Socket Layer)連線
		props.put("mail.smtp.socketFactory.class",
				"javax.net.ssl.SSLSocketFactory");
		// GMail要求必須要進行身分驗證(Authentication)
		props.put("mail.smtp.auth", "true");
//		System.out.println("userid=" + userid);
//		System.out.println("password=" + password);
		Authenticator au = new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userid, password);
			}
		};

		session = Session.getDefaultInstance(props, au);
		message = new MimeMessage(session);
	}

	private static String getFileName(String path) {
		return path.substring(path.lastIndexOf("\\") + 1);
	}
	
	private static int tokenCount(String target, String token) {
		//String target = "helloslkhellodjladfjhello";
		//String token = "hello";
		int lastIndex = 0;
		int count = 0;

		while(lastIndex != -1){

		    lastIndex = target.indexOf(token,lastIndex);

		    if(lastIndex != -1){
		        count ++;
		        lastIndex += token.length();
		    }
		}
		return count;
	}

//	static {
//		userid = System.getProperty("wisejava004");
//		password = System.getProperty("java004wise");
//		
//	}
}
