package _01_register.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import _01_register.model.IMemberDAO;
import _01_register.model.MemberBean;
import _01_register.model.MemberHibernateDAO;
import _01_register.util.JavaMailUtil;

public class Attestation {

	public static void attEmail(int ui) {

		IMemberDAO attEmail = new MemberHibernateDAO();
		MemberBean mb = attEmail.findByPrimaryKey(ui);
		mb.setAuthenticate(true);
		attEmail.update(mb);
		
	}
}
