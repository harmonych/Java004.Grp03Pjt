package _09_sponsor.model;

import java.util.List;

public interface ISponsorDAO {
	public int sponsor(SponsorBean sb);
	
	public SponsorBean sponsorquery(int userid);
	
	public int cancel(int sponid);
	
	public int getUser_id();
	public void setUser_id(int userid);
	public int getFc_id() ;
	public void setFc_id(int fcid) ;
	
	public List<SponsorBean> getAllbyfcJSON(int fcid);
}
