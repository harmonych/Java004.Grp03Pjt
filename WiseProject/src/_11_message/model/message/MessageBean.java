package _11_message.model.message;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="message")
public class MessageBean {
	int msg_id; 
	int s_user_id; 
	String sender_name; 
	String reciever_name; 
	int r_user_id;
	String title;
	
	String msg_txt;
	Timestamp msg_time;
	int s_msg_state;
	int r_msg_state;
	
	public MessageBean(int s_user_id, String sender_name, String reciever_name, int r_user_id, String title,
			String msg_txt, Timestamp msg_time, int s_msg_state, int r_msg_state) {
		super();
		this.s_user_id = s_user_id;
		this.sender_name = sender_name;
		this.reciever_name = reciever_name;
		this.r_user_id = r_user_id;
		this.title = title;
		this.msg_txt = msg_txt;
		this.msg_time = msg_time;
		this.s_msg_state = s_msg_state;
		this.r_msg_state = r_msg_state;
	}
	
	public MessageBean(int msg_id, int s_user_id, String sender_name, String reciever_name, int r_user_id,
			String title,String msg_txt, Timestamp msg_time,int s_msg_state,int r_msg_state) {
		super();
		this.msg_id = msg_id;
		this.s_user_id = s_user_id;
		this.sender_name = sender_name;
		this.reciever_name = reciever_name;
		this.r_user_id = r_user_id;
		this.title= title;
		this.msg_txt = msg_txt;
		this.msg_time = msg_time;
		this.s_msg_state= s_msg_state;
		this.r_msg_state= r_msg_state;
	}
	@Id
	public int getMsg_id() {
		return msg_id;
	}
	public void setMsg_id(int msg_id) {
		this.msg_id = msg_id;
	}
	
	public int getS_user_id() {
		return s_user_id;
	}
	public void setS_user_id(int s_user_id) {
		this.s_user_id = s_user_id;
	}
	public int getR_user_id() {
		return r_user_id;
	}
	public void setR_user_id(int r_user_id) {
		this.r_user_id = r_user_id;
	}
	public String getSender_name() {
		return sender_name;
	}
	public void setSender_name(String sender_name) {
		this.sender_name = sender_name;
	}
	public String getReciever_name() {
		return reciever_name;
	}
	public void setReciever_name(String reciever_name) {
		this.reciever_name = reciever_name;
	}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(columnDefinition="LongText")
	public String getMsg_txt() {
		return msg_txt;
	}
	public void setMsg_txt(String msg_txt) {
		this.msg_txt = msg_txt;
	}
	public Timestamp getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(Timestamp msg_time) {
		this.msg_time = msg_time;
	}
	public int getS_msg_state() {
		return s_msg_state;
	}
	public void setS_msg_state(int show) {
		this.s_msg_state = show;
	}
	public int getR_msg_state() {
		return r_msg_state;
	}
	public void setR_msg_state(int r_msg_state) {
		this.r_msg_state = r_msg_state;
	}
	
   
	
	
	
	
}
