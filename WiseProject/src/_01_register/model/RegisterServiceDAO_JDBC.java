package _01_register.model;

import java.io.*;
import java.sql.*;
import java.sql.Date;
import java.util.*;

import javax.naming.*;
import javax.sql.*;

import _00_init.*;
import _02_login.model.*;

public class RegisterServiceDAO_JDBC implements RegisterServiceDAO {
	private List<MemberBean> memberList;
	LoginServiceDB lsdb;
	private DataSource ds = null;

	public RegisterServiceDAO_JDBC() throws NamingException, SQLException {
		Context ctx = new InitialContext();
		ds = (DataSource) ctx.lookup(GlobalService.JNDI_DB_NAME);
		lsdb = new LoginServiceDB();
		memberList = lsdb.getMemberList();
	}

	synchronized public boolean idExists(String id) throws IOException {
		boolean exist = false; // 檢查id是否已經存在
		for (MemberBean mb : memberList) {
			if (mb.getAccount().equals(id.trim())) {
				exist = true;
				break;
			}
		}
		return exist;
	}

	synchronized public int saveMember(MemberBean mb, InputStream is,
			long size, String filename) throws SQLException {
		PreparedStatement pstmt1 = null;
		Connection conn = ds.getConnection();
		int r = 0;
		try {
			String sql1 = "insert into userInfo " +
					" (account, password, user_name, phonenum, email, gender, birthday, " +
	      	  		" portrait, file_name, check_tag) " +
	      	  		" values (?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
			
			pstmt1 = conn.prepareStatement(sql1);
			pstmt1.setString(1, mb.getAccount());
			String encrypedString = GlobalService.encryptString(mb.getPassword());
			pstmt1.setString(2, GlobalService.getMD5Endocing(encrypedString));
			pstmt1.setString(3, mb.getUser_name());
			pstmt1.setString(4, mb.getPhonenum());
			pstmt1.setString(5, mb.getEmail());
			pstmt1.setString(6, mb.getGender());
			pstmt1.setString(7, mb.getBirthday());
			// 設定Image欄位
			// pstmt1.setBlob(11, is, size); // 此方法目前未支援
			pstmt1.setBinaryStream(8, is, size);
			pstmt1.setString(9, filename);
			pstmt1.setBoolean(10, mb.isCheck_tag());
			r = pstmt1.executeUpdate();
			if (r == 1) {
				// 寫入成功，應該將MemberBean mem立即加入LoginService的memberList內
				// 否則，最新的User將無法登入
				mb.setPassword(GlobalService.getMD5Endocing(encrypedString));
				memberList.add(mb);
			} else {
				throw new SQLException("RegisterServiceDB:新增記錄數 : 0");
			}
			// System.out.println("新增一筆eMember紀錄，是否成功=" + r);
		} finally {
			// 關閉相關的物件
			if (pstmt1 != null) {
				try {
					pstmt1.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			if (conn != null) {
				try {
					conn.close();
				} catch (Exception e) {
					System.err.println("關閉相關物件時發生例外: " + e);
				}
			}
		}
		return r;
	}
}
