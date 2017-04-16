package _09_sponsor.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.google.gson.annotations.Expose;


@Entity
@Table(name="sponsor")
public class SponsorBean implements Serializable {

	private static final long serialVersionUID = 1L;
@Expose	    private int spon_id;
@Expose		private int fc_id;
@Expose		private int user_id;
@Expose		private int spon_money;
@Expose		private Timestamp spon_time;
@Expose		private int spon_mode;
@Expose		private String spon_account;
		
		//網頁上傳入
		public SponsorBean(int fc_id, int user_id, int spon_money) {
			super();
			this.fc_id = fc_id;
			this.user_id = user_id;
			this.spon_money = spon_money;
		}
		//修改
		public SponsorBean(int spon_money, int spon_mode, String spon_account) {
			super();
			this.spon_money = spon_money;
			this.spon_mode = spon_mode;
			this.spon_account = spon_account;
		}
		public SponsorBean(int fc_id, int user_id, int spon_money, int spon_mode, String spon_account) {
			super();
			this.fc_id = fc_id;
			this.user_id = user_id;
			this.spon_money = spon_money;
			this.spon_mode = spon_mode;
			this.spon_account = spon_account;
		}
		//所有
		public SponsorBean(int sponid, int fcid, int userid, int sponmoney, Timestamp spontime, int sponmode,
				String sponaccount) {
			super();
			this.spon_id = sponid;
			this.fc_id = fcid;
			this.user_id = userid;
			this.spon_money = sponmoney;
			this.spon_time = spontime;
			this.spon_mode = sponmode;
			this.spon_account = sponaccount;
		}

		public SponsorBean() {
					
		}
		
		@Id
		@GeneratedValue(strategy=GenerationType.AUTO)
		public int getSpon_id() {
			return spon_id;
		}
		public void setSpon_id(int sponid) {
			this.spon_id = sponid;
		}
		@Column(nullable = false)
		public int getFc_id() {
			return fc_id;
		}
		public void setFc_id(int fcid) {
			this.fc_id = fcid;
		}
		@Column(nullable = false)
		public int getUser_id() {
			return user_id;
		}
		public void setUser_id(int userid) {
			this.user_id = userid;
		}
		@Column(name = "spon_money")
		public int getSpon_money() {
			return spon_money;
		}
		public void setSpon_money(int sponmoney) {
			this.spon_money = sponmoney;
		}
		@Column(name = "spon_time")
		public Timestamp getSpon_time() {
			return spon_time;
		}
		public void setSpon_time(Timestamp spontime) {
			this.spon_time = spontime;
		}
		@Column(name = "spon_mode")
		public int getSpon_mode() {
			return spon_mode;
		}
		public void setSpon_mode(int sponmode) {
			this.spon_mode = sponmode;
		}
		@Column(name = "spon_account")
		public String getSpon_account() {
			return spon_account;
		}
		@Column(nullable = true)
		public void setSpon_account(String sponaccount) {
			this.spon_account = sponaccount;
		}
}
