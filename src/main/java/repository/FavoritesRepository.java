package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import model.Favorite;
import model.User;
import model.Video;

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

    public List<Object[]> getAllFavoriteVideo() {
        EntityManager em = getEntityManager();

        Query query = em.createQuery("SELECT v.title,count(f),max(f.likeDate),min(f.likeDate) from Video v  join  v.videoFavorites f group by v.title", Object[].class);
        return query.getResultList();

    }

    public List<Object[]> getAllFavoriteUserByTitle(String title) {
        EntityManager em = getEntityManager();
        if (title == null) title = "";
        String escapedTitle = title.replace("[", "\\[").replace("]", "\\]");
        TypedQuery<Object[]> query = em.createQuery("select u.id,u.fullName,s.emails,s.shareDate from User u join u.userShares s where s.video.title like :title escape '\\'", Object[].class);
        query.setParameter("title", "%" + escapedTitle + "%");
        return query.getResultList();
    }

}
