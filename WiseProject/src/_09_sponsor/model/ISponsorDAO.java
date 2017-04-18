package _09_sponsor.model;

import java.util.List;

public interface ISponsorDAO {
	public int getSpon_id();
	public void setSpon_id(int spon_id);
	
	public int getUser_id();
	public void setUser_id(int userid);
	public int getFc_id() ;
	public void setFc_id(int fcid) ;	
	public int sponsor(SponsorBean sb);
	public int cancel(int sponid);
	public SponsorBean FindByPrimaryKey(int spon_id);
	public List<SponsorBean> getAllByFcId(int fcid);
	public List<SponsorBean> getAllByUserId(int userid);
	public List<SponsorBean> findAllByFcId(int fcid);

}
