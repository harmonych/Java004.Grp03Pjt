package _06_follow.model;

import java.io.Serializable;
import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="follow")
public class FollowBean implements Serializable {
	private static final long serialVersionUID = 1L;
	private int follow_id;
	private int user_id;
	private int f_user_id;
	private Timestamp follow_time;
	public FollowBean(int user_id, int f_user_id, Timestamp follow_time) {
		super();
		this.user_id = user_id;
		this.f_user_id = f_user_id;
		this.follow_time = follow_time;
	}
	public FollowBean(int follow_id, int user_id, int f_user_id, Timestamp follow_time) {
		super();
		this.follow_id = follow_id;
		this.user_id = user_id;
		this.f_user_id = f_user_id;
		this.follow_time = follow_time;
	}
	public FollowBean() {
		super();
	}
	@Id
	public int getFollow_id() {
		return follow_id;
	}
	public void setFollow_id(int follow_id) {
		this.follow_id = follow_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getF_user_id() {
		return f_user_id;
	}
	public void setF_user_id(int f_user_id) {
		this.f_user_id = f_user_id;
	}
	public Timestamp getFollow_time() {
		return follow_time;
	}
	public void setFollow_time(Timestamp follow_time) {
		this.follow_time = follow_time;
	}
}
