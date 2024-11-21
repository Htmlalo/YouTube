package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import model.User;
import model.Video;
import util.XEntityFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VideoRepository extends GenericRepositoryIml<Video, String> {


    private final EntityManager entityManager;

    public VideoRepository() {
        super(Video.class);
        this.entityManager = XEntityFactory.getEntity();

    }


    public List<Video> fillAllMaxResult(int pageNumber, int pageSize) {
        String hql = "FROM Video v  order by viewCount desc ";
        TypedQuery<Video> query = entityManager.createQuery(hql, Video.class);
        query.setFirstResult((pageNumber) * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }


    public int getTotalVideoCount() {
        String hql = "SELECT COUNT(v) FROM  Video  v";
        Long count = (Long) entityManager.createQuery(hql).getSingleResult();
        return count.intValue();
    }

    public Map<Integer, List<Video>> fillAllVideoByPage(int pageNumber, int pageSize) {

        Map<Integer, List<Video>> listMap = new HashMap<>();
        listMap.put(pageNumber, fillAllMaxResult(pageNumber, pageSize));
        return listMap;
    }

    public List<Video> getVideoFavoritesByUser(User user) {
        return entityManager.createQuery("select f.video from Favorite f where f.user=:User").setParameter("User", user).getResultList();
    }

}
