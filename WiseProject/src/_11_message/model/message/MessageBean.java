package _11_message.model.message;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
@Entity
@Table(name="message")
public class MessageBean implements Serializable{
	private static final long serialVersionUID = 1L;
	int msg_id; 
	int s_user_id; 
	String sender_name; 
	String receiver_name; 
	int r_user_id;
	String title;	
	String msg_txt;
	Date msg_time;
	int s_msg_status;
	int r_msg_status;
	int msg_read = 0;
	//0已讀 1未讀
	
	public MessageBean(int s_user_id, String sender_name, String receiver_name, int r_user_id, String title,
			String msg_txt, int s_msg_status, int r_msg_status) {
		super();
		this.s_user_id = s_user_id;
		this.sender_name = sender_name;
		this.receiver_name = receiver_name;
		this.r_user_id = r_user_id;
		this.title = title;
		this.msg_txt = msg_txt;
		this.s_msg_status = s_msg_status;
		this.r_msg_status = r_msg_status;
	}

	public MessageBean(int s_user_id, String sender_name, String receiver_name, int r_user_id, String title,
			String msg_txt, Date msg_time, int s_msg_status, int r_msg_status) {
		super();
		this.s_user_id = s_user_id;
		this.sender_name = sender_name;
		this.receiver_name = receiver_name;
		this.r_user_id = r_user_id;
		this.title = title;
		this.msg_txt = msg_txt;
		this.msg_time = msg_time;
		this.s_msg_status = s_msg_status;
		this.r_msg_status = r_msg_status;
	}
	
	public MessageBean(int msg_id, int s_user_id, String sender_name, String receiver_name, int r_user_id, String title,
			String msg_txt, Date msg_time, int s_msg_status, int r_msg_status, int msg_read) {
		super();
		this.msg_id = msg_id;
		this.s_user_id = s_user_id;
		this.sender_name = sender_name;
		this.receiver_name = receiver_name;
		this.r_user_id = r_user_id;
		this.title = title;
		this.msg_txt = msg_txt;
		this.msg_time = msg_time;
		this.s_msg_status = s_msg_status;
		this.r_msg_status = r_msg_status;
		this.msg_read = msg_read;
	}

	public MessageBean(int msg_id, int s_user_id, String sender_name, String receiver_name, int r_user_id,
			String title,String msg_txt, Date msg_time,int s_msg_status,int r_msg_status) {
		super();
		this.msg_id = msg_id;
		this.s_user_id = s_user_id;
		this.sender_name = sender_name;
		this.receiver_name = receiver_name;
		this.r_user_id = r_user_id;
		this.title= title;
		this.msg_txt = msg_txt;
		this.msg_time = msg_time;
		this.s_msg_status= s_msg_status;
		this.r_msg_status= r_msg_status;
	}
	
	public MessageBean() {
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
	public String getReceiver_name() {
		return receiver_name;
	}
	public void setReceiver_name(String receiver_name) {
		this.receiver_name = receiver_name;
	}
	@Column(name = "msg_title")
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	@Column(name = "msg_text",columnDefinition="LongText")
	public String getMsg_txt() {
		return msg_txt;
	}
	public void setMsg_txt(String msg_txt) {
		this.msg_txt = msg_txt;
	}
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	public Date getMsg_time() {
		return msg_time;
	}
	public void setMsg_time(Date msg_time) {
		this.msg_time = msg_time;
	}
	public int getS_msg_status() {
		return s_msg_status;
	}
	public void setS_msg_status(int s_msg_status) {
		this.s_msg_status = s_msg_status;
	}
	public int getR_msg_status() {
		return r_msg_status;
	}
	public void setR_msg_status(int r_msg_status) {
		this.r_msg_status = r_msg_status;
	}
	
   	
	
}
