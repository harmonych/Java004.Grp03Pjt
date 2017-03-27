package _09_sponsor.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;


	@Entity
	@Table(name="sponsor")
	public class SponsorBean implements Serializable {
		
		private static final long serialVersionUID = 1L;
		private int spon_id;
		private int fc_id;
		private int user_id;
		private int spon_money;
		private String spon_time;
		private String spon_mode;
		private String spon_account;
		
		public SponsorBean(int sponid, int fcid, int userid, int sponmoney, String spontime, String sponmode,
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
		@Column(name = "spon_id")
		public int getSpon_id() {
			return spon_id;
		}
		public void setSpon_id(int sponid) {
			this.spon_id = sponid;
		}
		@Column(name = "fc_id")
		public int getFc_id() {
			return fc_id;
		}
		public void setFc_id(int fcid) {
			this.fc_id = fcid;
		}
		@Column(name = "user_id")
		public int getUser_id() {
			return user_id;
		}
		public void setUser_id(int userid) {
			this.user_id = userid;
		}
		@Column(name = "spon_money")
		public int getSponmoney() {
			return spon_money;
		}
		public void setSponmoney(int sponmoney) {
			this.spon_money = sponmoney;
		}
		@Column(name = "spon_time")
		public String getSpontime() {
			return spon_time;
		}
		public void setSpontime(String spontime) {
			this.spon_time = spontime;
		}
		@Column(name = "spon_mode")
		public String getSponmode() {
			return spon_mode;
		}
		public void setSponmode(String sponmode) {
			this.spon_mode = sponmode;
		}
		@Column(name = "spon_account")
		public String getSponaccount() {
			return spon_account;
		}
		public void setSponaccount(String sponaccount) {
			this.spon_account = sponaccount;
		}
}
