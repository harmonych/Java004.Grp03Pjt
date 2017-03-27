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
	private int fc_id;
	
	
	private int art_id;
	private String fc_name;
	private int fc_money;
	private int now_money;
	private String create_time;
	private String start_time;
	private String end_time;
	private String update_time;
	private String fc_introduction;
	private String hashtag;
	
	public FundsBean(int artid, String fcname, int fcmoney, int nowmoney, String createtime, String starttime,
			String endtime, String updatetime, String fcintroduction, String hashtag) {
		super();
		this.art_id = artid;
		this.fc_name = fcname;
		this.fc_money = fcmoney;
		this.now_money = nowmoney;
		this.create_time = createtime;
		this.start_time = starttime;
		this.end_time = endtime;
		this.update_time = updatetime;
		this.fc_introduction = fcintroduction;
		this.hashtag = hashtag;
	}
	
	public FundsBean(int fcid, int artid,String fcname,int fcmoney,int nowmoney,
			String createtime,String starttime,String endtime,String updatetime, String fcintroduction,String hashtag) {
		this.fc_id = fcid;
		this.art_id = artid;
		this.fc_name = fcname;
		this.fc_money = fcmoney;
		this.now_money =nowmoney;
		this.create_time = createtime;
		this.start_time =starttime;
		this.end_time =endtime;
		this.update_time =updatetime;
		this.fc_introduction =fcintroduction;
		this.hashtag=hashtag;
	}
	public FundsBean(){
		
	}
	@Id
	@Column(name = "fc_id", unique = true, nullable = false)
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	public int getFc_id() {
		return fc_id;
	}
	public void setFc_id(int fcid) {
		this.fc_id = fcid;
	}
	@Column(name = "art_id")
	public int getArt_id() {
		return art_id;
	}
	public void setArt_id(int artid) {
		this.art_id = artid;
	}
	@Column(name = "fc_name")
	public String getFc_name() {
		return fc_name;
	}
	public void setFc_name(String fcname) {
		this.fc_name = fcname;
	}
	@Column(name = "fc_money")
	public int getFc_money() {
		return fc_money;
	}
	public void setFc_money(int fcmoney) {
		this.fc_money = fcmoney;
	}
	@Column(name = "now_money")
	public int getNow_money() {
		return now_money;
	}
	public void setNow_money(int nowmoney) {
		this.now_money = nowmoney;
	}

	@Column(name = "create_time")
	public String getCreate_time() {
		return create_time;
	}
	public void setCreate_time(String createtime) {
		this.create_time = createtime;
	}

	@Column(name = "start_time")
	public String getStart_time() {
		return start_time;
	}
	public void setStart_time(String starttime) {
		this.start_time = starttime;
	}
	@Column(name = "end_time")
	public String getEnd_time() {
		return end_time;
	}
	public void setEnd_time(String endtime) {
		this.end_time = endtime;
	}

	@Column(name = "update_time")
	public String getUpdate_time() {
		return update_time;
	}
	public void setUpdate_time(String updatetime) {
		this.update_time = updatetime;
	}
	@Column(name = "fc_introduction", columnDefinition="LongText")
	public String getFc_introduction() {
		return fc_introduction;
	}
	public void setFc_introduction(String fcintroduction) {
		this.fc_introduction = fcintroduction;
	}
	public String getHashtag() {
		return hashtag;
	}
	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}
}