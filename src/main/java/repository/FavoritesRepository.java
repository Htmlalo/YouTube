package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.Favorite;
import model.User;
import model.Video;
import util.XEntityFactory;

import java.util.List;

public class FavoritesRepository extends GenericRepositoryIml<Favorite, Long> {
    private final EntityManager entityManager;

    public FavoritesRepository() {
        super(Favorite.class);
        entityManager = XEntityFactory.getEntity();
    }




}
