package ch07.model;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import _00_init.SystemUtil;

public class FundsJDBC {
	DataSource ds;
	int fcid;

	public int getFcId() {
		return fcid;
	}

	public void setFcId(int fcid) {
		this.fcid = fcid;
	}

	public FundsJDBC() {
		try {
			Context context = new InitialContext();
			ds = (DataSource) context.lookup(SystemUtil.JNDI);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
	public List<FundsBean> getAllFundsJSON() throws SQLException {
		List<FundsBean> list = new ArrayList<>();
		Connection con = ds.getConnection();
		try {
			String sql = "Select * from fundscollection";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				//
				int fcid = rs.getInt("fcid");
				int artid = rs.getInt("artid");
				String fcname = rs.getString("fcname");
				int fcmoney = rs.getInt("fcmoney");
				int nowmoney = rs.getInt("nowmoney");
				int createtime = rs.getInt("createtime");
				int starttime = rs.getInt("starttime");
				int endtime = rs.getInt("endtime");
				int updatetime = rs.getInt("updatetime");
				String fcintroduction = rs.getString("fcintroduction");
				
				FundsBean fb = new FundsBean(fcid, artid, fcname, fcmoney, nowmoney,
						createtime, starttime, endtime, updatetime,fcintroduction);
				list.add(fb);
			}
		} finally {
			con.close();
		}
		return list;
	}
	public List<FundsBean> getAllFunds() throws SQLException {
		List<FundsBean> list = new ArrayList<>();
		Connection con = ds.getConnection();
		try {
			String sql = "Select * from fundscollection";
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			while (rs.next()) {
				//
				int fcid = rs.getInt("fcid");
				int artid = rs.getInt("artid");
				String fcname = rs.getString("fcname");
				int fcmoney = rs.getInt("fcmoney");
				int nowmoney = rs.getInt("nowmoney");
				int createtime = rs.getInt("createtime");
				int starttime = rs.getInt("starttime");
				int endtime = rs.getInt("endtime");
				int updatetime = rs.getInt("updatetime");
				String fcintroduction = rs.getString("fcintroduction");
				FundsBean fb = new FundsBean(fcid, artid, fcname, fcmoney, nowmoney,
						createtime, starttime, endtime, updatetime,fcintroduction);
				list.add(fb);
				
			}
		} finally {
			con.close();
		}
		return list;

	}

	public FundsBean getBook() throws SQLException {
		Connection con = null;
		FundsBean fb = null;
		try {
			String sql = "Select * from fundscollection where fcid = ?";

			con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, fcid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				int fcid = rs.getInt("fcid");
				int artid = rs.getInt("artid");
				String fcname = rs.getString("fcname");
				int fcmoney = rs.getInt("fcmoney");
				int nowmoney = rs.getInt("nowmoney");
				int createtime = rs.getInt("createtime");
				int starttime = rs.getInt("starttime");
				int endtime = rs.getInt("endtime");
				int updatetime = rs.getInt("updatetime");
				String fcintroduction = rs.getString("fcintroduction");
				fb = new FundsBean(fcid, artid, fcname, fcmoney, nowmoney,
						createtime, starttime, endtime, updatetime,fcintroduction);
			
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return fb;
	}
	public FundsBean getFundsTextOnly() throws SQLException {
		Connection con = null;
		FundsBean fb = null;
		try {
			String sql = "Select * from fundscollection where fcid = ?";

			con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			stmt.setInt(1, fcid);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				int fcid = rs.getInt("fcid");
				int artid = rs.getInt("artid");
				String fcname = rs.getString("fcname");
				int fcmoney = rs.getInt("fcmoney");
				int nowmoney = rs.getInt("nowmoney");
				int createtime = rs.getInt("createtime");
				int starttime = rs.getInt("starttime");
				int endtime = rs.getInt("endtime");
				int updatetime = rs.getInt("updatetime");
				String fcintroduction = rs.getString("fcintroduction");
				fb = new FundsBean(fcid, artid, fcname, fcmoney, nowmoney,
						createtime, starttime, endtime, updatetime,fcintroduction);
			}
		} finally {
			if (con != null) {
				con.close();
			}
		}
		return fb;

	}
}
