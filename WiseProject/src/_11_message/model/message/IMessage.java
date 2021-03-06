package _11_message.model.message;

import java.util.List;

public interface IMessage {
	
	public int insertmessage(MessageBean mb);
		
	public int changesender(int msg_id);

	public int changerecieve(int msg_id);

	public int Checkreciever(String user_name);
	
	public void setR_user_id(int r_user_id);

	public MessageBean findByPrimaryKey(int msg_id);
	
	public List<MessageBean> getMessagesByRId(int r_user_id);

	public List<MessageBean> getMessagesBySId(int s_user_id);

}
