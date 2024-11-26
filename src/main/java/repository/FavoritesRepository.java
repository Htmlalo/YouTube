package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import model.Favorite;
import model.User;
import model.Video;
import org.hibernate.Transaction;
import util.XEntityFactory;

import java.util.List;

public class FavoritesRepository extends GenericRepositoryIml<Favorite, Long> {


    public FavoritesRepository() {
        super(Favorite.class);

    }

    public int deleteFavorite(User user, Video video) {
        EntityManager em = getEntityManager();
        int result = 0;

        try {
            em.getTransaction().begin(); // Bắt đầu transaction
            Query query = em.createQuery("DELETE FROM Favorite f WHERE f.user = :user AND f.video = :video");
            query.setParameter("user", user);
            query.setParameter("video", video);
            result = query.executeUpdate(); // Thực thi DELETE
            em.getTransaction().commit(); // Commit transaction
        } catch (Exception e) {
            em.getTransaction().rollback(); // Rollback nếu có lỗi
            e.printStackTrace();
        } finally {
            em.close(); // Đảm bảo đóng EntityManager
        }

        return result;
    }



}
