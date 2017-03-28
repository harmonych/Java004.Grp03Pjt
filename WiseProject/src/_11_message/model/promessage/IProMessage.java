package _11_message.model.promessage;

public interface IProMessage {
	public int insertmessage(ProMessageBean mb);
	
	public ProMessageBean Messagequery(int pro_id);
	
	public int change(int msg_id);

	public void setPro_id(int pro_id);
}
