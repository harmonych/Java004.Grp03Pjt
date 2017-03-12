package _01_register.model;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;

public interface RegisterServiceDAO {
	public int saveMember(MemberBean mb, InputStream is, long size, String filename)
	    throws SQLException ;
	public boolean idExists(String id) throws IOException;

}
