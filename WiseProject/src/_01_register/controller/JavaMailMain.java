package _01_register.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import _01_register.model.MemberBean;
import _01_register.util.JavaMailUtil;

public class JavaMailMain {

	public static void sendRegMail(String address, int ui) {
//		
//		String contextPath = req.getContextPath();
		String from = "wisejava004@gmail.com";
		List<String> to = Arrays.asList(new String[] {address});
		List<String> cc = Arrays.asList(new String[] {});
		List<String> bcc = Arrays.asList(new String[] {});
		String subject = "彙思創作募資平台認證信";
		String text = "<h1>歡迎您成為彙思的一份子,</h1>" + "<h2>您可以點擊下列連結完成會員認證</h2>" + "<a href='http://saudade.myasustor.com:8080/WiseProject/_01_register/attestation.jsp?id="+ui+"'>點擊此連結完成帳號認證</a><br>"
				+ "<br><br><font color='blue'> 彙思創作募資平台敬上 </font><br>";
//		List<String> attachment = Arrays
//				.asList(new String[] { "C:\\Windows\\system.ini", "C:\\Windows\\Starter.xml", });
		List<String> attachment = null;
		JavaMailUtil util = new JavaMailUtil(from, to, cc, bcc, subject, text, attachment);
		if (util.send()) {
			System.out.println("發信成功");
		} else {
			System.out.println("發信失敗");
		}
	}
}
