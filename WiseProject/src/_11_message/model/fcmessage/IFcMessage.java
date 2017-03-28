package _11_message.model.fcmessage;

public interface IFcMessage {
	public int insertmessage(FcMessageBean mb);
	
	public FcMessageBean Messagequery(int pro_id);
	
	public int change(int msg_id);

	public void setPro_id(int pro_id);
}
