package _09_sponsor.model;

import java.util.List;

public interface ISponsorDAO {
	public int sponsor(SponsorBean sb);
	
	public SponsorBean sponsorquery(int userid);
	
	public int cancel(int sponid);
	
	public int getUserid();
	public void setUserid(int userid);
	public int getFcid() ;
	public void setFcid(int fcid) ;
	
	public List<SponsorBean> getAllbyfcJSON(int fcid);
}
