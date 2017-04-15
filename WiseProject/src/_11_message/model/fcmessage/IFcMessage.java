package _11_message.model.fcmessage;

import java.util.List;

public interface IFcMessage {
	public int insertmessage(FcMessageBean mb);
	
	public List<FcMessageBean> Messagequery(int pro_id);
	
	public int change(int msg_id);

	public void setFc_id(int fc_id);

	public int getFc_id();
}
