package _11_message.model.promessage;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="pro_message")
public class ProMessageBean {
	private int msg_id;
	private String msg_title;
	private int prev_msg_id;
	private int user_id;
	private String sender_name;
	private String receiver_name;
	private Timestamp msg_time;
	private int pro_id;
	private String msg_text;
	private int msg_status;
	
	//所有建構子
	public ProMessageBean(int msg_id, String msg_title, int prev_msg_id, int user_id, String sender_name,
			String receiver_name, Timestamp msg_time, int pro_id, String msg_text, int msg_status) {
		super();
		this.msg_id = msg_id;
		this.msg_title = msg_title;
		this.prev_msg_id = prev_msg_id;
		this.user_id = user_id;
		this.sender_name = sender_name;
		this.receiver_name = receiver_name;
		this.msg_time = msg_time;
		this.pro_id = pro_id;
		this.msg_text = msg_text;
		this.msg_status = msg_status;
	}

	public ProMessageBean(String msg_title, int prev_msg_id, int user_id, String sender_name,
			String receiver_name, int pro_id, String msg_text, int msg_status) {
		super();
		this.msg_title = msg_title;
		this.prev_msg_id = prev_msg_id;
		this.user_id = user_id;
		this.sender_name = sender_name;
		this.receiver_name = receiver_name;
		this.pro_id = pro_id;
		this.msg_text = msg_text;
		this.msg_status = msg_status;
	}

	public ProMessageBean(String msg_title, int user_id, String sender_name, String receiver_name,
			int pro_id, String msg_text, int msg_status) {
		super();
		this.msg_title = msg_title;
		this.user_id = user_id;
		this.sender_name = sender_name;
		this.receiver_name = receiver_name;
		this.pro_id = pro_id;
		this.msg_text = msg_text;
		this.msg_status = msg_status;
	}

	public ProMessageBean(String msg_title, int prev_msg_id, int user_id, String sender_name, String receiver_name,
			Timestamp msg_time, int pro_id, String msg_text, int msg_status) {
		super();
		this.msg_title = msg_title;
		this.prev_msg_id = prev_msg_id;
		this.user_id = user_id;
		this.sender_name = sender_name;
		this.receiver_name = receiver_name;
		this.msg_time = msg_time;
		this.pro_id = pro_id;
		this.msg_text = msg_text;
		this.msg_status = msg_status;
	}
	
	public ProMessageBean() {
		super();
	}

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}
	public String getMsg_title() {
		return msg_title;
	}
	public void setMsg_title(String msg_title) {
		this.msg_title = msg_title;
	}
	@Column(nullable = true)
	public int getPrev_msg_id() {
		return prev_msg_id;
	}
	public void setPrev_msg_id(int prev_msg_id) {
		this.prev_msg_id = prev_msg_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getSender_name() {
		return sender_name;
	}
	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	public Timestamp getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(Timestamp msg_time) {
		this.msg_time = msg_time;
	}
	@Column(nullable = false)
	public int getPro_id() {
		return pro_id;
	}
	public void setPro_id(int pro_id) {
		this.pro_id = pro_id;
	}
	@Column(columnDefinition="LongText")
	public String getMsg_text() {
		return msg_text;
	}
	public void setMsg_text(String msg_text) {
		this.msg_text = msg_text;
	}
	public int getMsg_status() {
		return msg_status;
	}
	public void setMsg_status(int msg_status) {
		this.msg_status = msg_status;
	}
	
	
}
