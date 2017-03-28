package _11_message.model;

public interface IMessage {
	
	public int insertmessage(MessageBean mb);
	
	public MessageBean Messagequery(int r_user_id);
	
	public int changesender(int msg_id);

	public int changerecieve(int msg_id);

	int Checkreciever(String r_user_id);
}
