package service;

import model.Favorite;
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
}
