package _06_follow.model;

import java.util.List;

public interface IFollowDAO {
	public int follow(FollowBean fb);
	public int cencelfollw(int follow_id);
	public List<FollowBean> userfollowquery(int user_id);
	public List<FollowBean> artfollowquery(int art_id);
}
