package _02_login.model;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.*;

import _00_init.*;
import _01_register.model.MemberBean;
public class LoginServiceDB implements LoginServiceDAO {
	static private List<MemberBean> memberList = new ArrayList<MemberBean>();
	private DataSource ds = null;

	public LoginServiceDB() throws NamingException, SQLException {
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup(GlobalService.JNDI_DB_NAME);
		if (memberList.isEmpty()) {
			populateMemberList(); // 此方法只會執行一次
		}
	}
	public MemberBean checkPassword(String user, String password) throws SQLException {
		String sql = "SELECT * From user_info where account = ? and password = ? ";
		Connection connection = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		MemberBean mb = null;
		try {
			connection = ds.getConnection();
			System.out.println("sql=" + sql);
			pStmt = connection.prepareStatement(sql);
			pStmt.setString(1,  user);
			pStmt.setString(2,  password);
			rs = pStmt.executeQuery();
					
			if (rs.next()) {
				String account = rs.getString("account").trim(); // 必須確定
																// rs.getString("memberID")
																// 不是null才能
																// .trim()
				String pswd = rs.getString("password").trim();
				String user_name = rs.getString("user_name");
				String phonenum = rs.getString("phonenum");
				String email = rs.getString("email");
				String gender = rs.getString("gender");
				String birthday = rs.getString("birthday");
				boolean check_tag = rs.getBoolean("check_tag");
				String file_name = rs.getString("file_name");
				mb = new MemberBean(account, pswd, user_name, phonenum, email, gender, birthday, check_tag, file_name);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
			return mb;
	}
	public void populateMemberList() throws SQLException {
		// 由Database讀取會員資料
		String sql = "SELECT * From user_info";
		Connection connection = null;
		PreparedStatement pStmt = null;
		ResultSet rs = null;
		try {
			connection = ds.getConnection();
			pStmt = connection.prepareStatement(sql);
			rs = pStmt.executeQuery();
			while (rs.next()) {
				String account = rs.getString("account").trim(); // 必須確定
				// rs.getString("memberID")
				// 不是null才能
				// .trim()
				String pswd = rs.getString("password").trim();
				String user_name = rs.getString("user_name");
				String phonenum = rs.getString("phonenum");
				String email = rs.getString("email");
				String gender = rs.getString("gender");
				String birthday = rs.getString("birthday");
				boolean check_tag = rs.getBoolean("check_tag");
				String file_name = rs.getString("file_name");
				MemberBean mb = new MemberBean(account, pswd, user_name, phonenum, email, gender,birthday, check_tag, file_name);
				memberList.add(mb);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (connection != null) {
				connection.close();
			}
		}
	}

	public MemberBean checkIDPassword(String account, String password) {
		// 檢查userId與password是否正確
		for (MemberBean mb : memberList) {
			if (mb.getAccount().trim().equals(account.trim())) {
//				String encrypedString = GlobalService.encryptString(password.trim());
//				String pswd = GlobalService.getMD5Endocing(encrypedString);
				String mbpswd = mb.getPassword().trim();
				if (mbpswd.equals(password)) {
					return mb;
				}
			}
		}
		return null;
	}

	public List<MemberBean> getMemberList() {
		return memberList;
	}
	public void addNewMember(MemberBean mb) {
		memberList.add(mb);
	}
	
}
