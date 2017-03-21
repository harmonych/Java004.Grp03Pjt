package _07_funds.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="funds_collection")
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
	private String fcintroduction;
	private String hashtag;
	
	public FundsBean(int artid, String fcname, int fcmoney, int nowmoney, String createtime, String starttime,
			String endtime, String updatetime, String fcintroduction, String hashtag) {
		super();
		this.artid = artid;
		this.fcname = fcname;
		this.fcmoney = fcmoney;
		this.nowmoney = nowmoney;
		this.createtime = createtime;
		this.starttime = starttime;
		this.endtime = endtime;
		this.updatetime = updatetime;
		this.fcintroduction = fcintroduction;
		this.hashtag = hashtag;
	}
	
	public FundsBean(int fcid, int artid,String fcname,int fcmoney,int nowmoney,
			String createtime,String starttime,String endtime,String updatetime, String fcintroduction,String hashtag) {
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
		this.hashtag=hashtag;
	}
	public FundsBean(){
		
	}
	@Id
	@Column(name = "fc_id", unique = true, nullable = false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getFcid() {
		return fcid;
	}
	public void setFcid(int fcid) {
		this.fcid = fcid;
	}
	@Column(name = "art_id")
	public int getArtid() {
		return artid;
	}
	public void setArtid(int artid) {
		this.artid = artid;
	}
	@Column(name = "fc_name")
	public String getFcname() {
		return fcname;
	}
	public void setFcname(String fcname) {
		this.fcname = fcname;
	}
	@Column(name = "fc_money")
	public int getFcmoney() {
		return fcmoney;
	}
	public void setFcmoney(int fcmoney) {
		this.fcmoney = fcmoney;
	}
	@Column(name = "now_money")
	public int getNowmoney() {
		return nowmoney;
	}
	public void setNowmoney(int nowmoney) {
		this.nowmoney = nowmoney;
	}

	@Column(name = "create_time")
	public String getCreatetime() {
		return createtime;
	}
	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	@Column(name = "start_time")
	public String getStarttime() {
		return starttime;
	}
	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}
	@Column(name = "end_time")
	public String getEndtime() {
		return endtime;
	}
	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	@Column(name = "update_time")
	public String getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(String updatetime) {
		this.updatetime = updatetime;
	}
	@Column(name = "fc_introduction", columnDefinition="LongText")
	public String getFcintroduction() {
		return fcintroduction;
	}
	public void setFcintroduction(String fcintroduction) {
		this.fcintroduction = fcintroduction;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
}