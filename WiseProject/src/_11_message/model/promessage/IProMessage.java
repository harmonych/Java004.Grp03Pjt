package _11_message.model.promessage;

import java.util.List;

public interface IProMessage {
	public int insertmessage(ProMessageBean mb);
	
	public List<ProMessageBean> Messagequery(int pro_id);
	
	public int change(int msg_id);

	public void setPro_id(int pro_id);
}
