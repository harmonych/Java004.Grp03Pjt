package _01_register.model;

import java.util.List;

public interface IArtistDAO {

	int insert(ArtistBean ab);

	int update(ArtistBean ab);

	int delete(ArtistBean ab);

	int delete(int key);

	ArtistBean findByPrimaryKey(int key);

	List<ArtistBean> getAllArtist();
	
	List<ArtistBean> getAllArtisttag(String search);

}