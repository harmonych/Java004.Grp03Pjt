package _11_message.model.message;

public interface IMessage {
	
	public int insertmessage(MessageBean mb);
	
	public MessageBean Messagequery(int r_user_id);
	
	public int changesender(int msg_id);

	public int changerecieve(int msg_id);

	public int Checkreciever(String user_name);
	
	public void setR_user_id(int r_user_id);

	public MessageBean Messagerecievequery(int s_user_id);
}
