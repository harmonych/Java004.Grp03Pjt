package _01_register.model;

import java.io.IOException;
import java.util.List;

public interface IMemberDAO {
	
	public int getUser_id();
	
	public void setUser_id(int user_id);
	
	public boolean idExists(String id) throws IOException;
	
	int insert(MemberBean mb);

	int update(MemberBean mb);

	int delete(MemberBean mb);

	int delete(int key);

	MemberBean findByPrimaryKey(int key);

	List<MemberBean> getAllMember();
}
