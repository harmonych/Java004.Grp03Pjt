package _01_register.model;

import java.util.List;

public interface IArtistDAO {
	
	public int getUser_id();
	
	public void setUser_id(int user_id);

	int insert(ArtistBean ab);
	
	int insert(MemberBean mb, ArtistBean ab);

	int update(ArtistBean ab);

	int delete(ArtistBean ab);

	int delete(int key);

	ArtistBean findByArtId(int key);

	List<ArtistBean> getAllArtist();
		
	List<ArtistBean> getAllArtisttag(String search);

	int update(MemberBean mb, ArtistBean ab);

	public String findArtNameByArtId(int art_id);

	public String findArtPortraitByArtId(int art_id);

	public void setArt_id(int art_id);

	public int getArt_id();

}