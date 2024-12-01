package service;

import model.Favorite;
import model.User;
import model.Video;
import repository.FavoritesRepository;

import java.util.List;

public class FavoritesService {
    private FavoritesRepository favoritesRepository;

    public FavoritesService() {
        favoritesRepository = new FavoritesRepository();
    }

    public List<Favorite> findAll() {
        return findAll();
    }

    public int deleteFavorite(User user, Video video) {
        return favoritesRepository.deleteFavorite(user, video);
    }

    public void save(Favorite favorite) {
        favoritesRepository.save(favorite);
    }

    public List<Object[]> getAllFavoriteVideo() {
        return favoritesRepository.getAllFavoriteVideo();
    }

    public List<Object[]> getAllFavoriteUserByTitle(String title) {
        return favoritesRepository.getAllFavoriteUserByTitle(title);
    }
}
