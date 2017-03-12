package _02_login.model;

import java.sql.SQLException;
import java.util.List;

import _01_register.model.MemberBean;

public interface LoginServiceDAO {
	public void populateMemberList() throws SQLException ;
	public MemberBean checkIDPassword(String userId, String password) ;
	public List<MemberBean> getMemberList();
	public void addNewMember(MemberBean mb);
}
