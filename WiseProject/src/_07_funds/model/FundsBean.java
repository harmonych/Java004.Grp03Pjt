package _07_funds.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


@Entity

public class FundsBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int fcid;
	private int artid;
	private String fcname;
	private int fcmoney;
	private int nowmoney;
	private String createtime;
	private String starttime;
	private String endtime;
	private String updatetime;
	private char[] fcintroduction;
	
	public FundsBean(int fcid, int artid,String fcname,int fcmoney,int nowmoney,
			String createtime,String starttime,String endtime,String updatetime, char[] fcintroduction) {
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
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
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
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	@Column(columnDefinition="LongText")
	public char[] getFcintroduction() {
		return fcintroduction;
	}
	public void setFcintroduction(char[] fcintroduction) {
		this.fcintroduction = fcintroduction;
	}
}