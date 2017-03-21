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
		private int sponid;
		private int fcid;
		private int userid;
		private int sponmoney;
		private String spontime;
		private String sponmode;
		private String sponaccount;
		
		public SponsorBean(int sponid, int fcid, int userid, int sponmoney, String spontime, String sponmode,
				String sponaccount) {
			super();
			this.sponid = sponid;
			this.fcid = fcid;
			this.userid = userid;
			this.sponmoney = sponmoney;
			this.spontime = spontime;
			this.sponmode = sponmode;
			this.sponaccount = sponaccount;
		}
		public SponsorBean() {
			
			
		}
		
		@Id
		@Column(name = "spon_id")
		public int getSponid() {
			return sponid;
		}
		public void setSponid(int sponid) {
			this.sponid = sponid;
		}
		@Column(name = "fc_id")
		public int getFcid() {
			return fcid;
		}
		public void setFcid(int fcid) {
			this.fcid = fcid;
		}
		@Column(name = "user_id")
		public int getUserid() {
			return userid;
		}
		public void setUserid(int userid) {
			this.userid = userid;
		}
		@Column(name = "spon_money")
		public int getSponmoney() {
			return sponmoney;
		}
		public void setSponmoney(int sponmoney) {
			this.sponmoney = sponmoney;
		}
		@Column(name = "spon_time")
		public String getSpontime() {
			return spontime;
		}
		public void setSpontime(String spontime) {
			this.spontime = spontime;
		}
		@Column(name = "spon_mode")
		public String getSponmode() {
			return sponmode;
		}
		public void setSponmode(String sponmode) {
			this.sponmode = sponmode;
		}
		@Column(name = "spon_account")
		public String getSponaccount() {
			return sponaccount;
		}
		public void setSponaccount(String sponaccount) {
			this.sponaccount = sponaccount;
		}
}
