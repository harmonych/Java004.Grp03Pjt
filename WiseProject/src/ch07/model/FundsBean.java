package ch07.model;

import java.io.Serializable;

//本類別封裝單筆募資專案資料
public class FundsBean implements Serializable {
	private static final long serialVersionUID = 1L;
	int fcid;
	int artid;
	String fcname;
	int fcmoney;
	int nowmoney;
	int createtime;
	int starttime;
	int endtime;
	int updatetime;
	String fcintroduction;
	
	public FundsBean(int fcid, int artid,String fcname,int fcmoney,int nowmoney,
			int createtime,int starttime,int endtime,int updatetime, String fcintroduction) {
		this.fcid = fcid;
		this.artid = artid;
		this.fcname = fcname;
		this.fcmoney = fcmoney;
		this.nowmoney =nowmoney;
		this.createtime = createtime;
		this.starttime =starttime;
		this.endtime =endtime;
		this.updatetime =updatetime;
		this.fcintroduction =fcintroduction;
	}
	public FundsBean(){
		
	}
	
	public int getFcid() {
		return fcid;
	}
	public void setFcid(int fcid) {
		this.fcid = fcid;
	}
	public int getArtid() {
		return artid;
	}
	public void setArtid(int artid) {
		this.artid = artid;
	}
	public String getFcname() {
		return fcname;
	}
	public void setFcname(String fcname) {
		this.fcname = fcname;
	}
	public int getFcmoney() {
		return fcmoney;
	}
	public void setFcmoney(int fcmoney) {
		this.fcmoney = fcmoney;
	}
	public int getNowmoney() {
		return nowmoney;
	}
	public void setNowmoney(int nowmoney) {
		this.nowmoney = nowmoney;
	}
	public int getCreatetime() {
		return createtime;
	}
	public void setCreatetime(int createtime) {
		this.createtime = createtime;
	}
	public int getStarttime() {
		return starttime;
	}
	public void setStarttime(int starttime) {
		this.starttime = starttime;
	}
	public int getEndtime() {
		return endtime;
	}
	public void setEndtime(int endtime) {
		this.endtime = endtime;
	}
	public int getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(int updatetime) {
		this.updatetime = updatetime;
	}
	public String getFcintroduction() {
		return fcintroduction;
	}
	public void setFcintroduction(String fcintroduction) {
		this.fcintroduction = fcintroduction;
	}
}