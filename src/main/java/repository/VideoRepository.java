package repository;

import jakarta.persistence.*;
import model.User;
import model.Video;
import util.XEntityFactory;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class VideoRepository extends GenericRepositoryIml<Video, String> {


    public VideoRepository() {
        super(Video.class);


    }


    public List<Video> fillAllMaxResult(int pageNumber, int pageSize) {
        String hql = "FROM Video v  where v.active = true order by viewCount desc ";
        TypedQuery<Video> query = getEntityManager().createQuery(hql, Video.class);
        query.setFirstResult((pageNumber) * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }


    public int getTotalVideoCount() {
        String hql = "SELECT COUNT(v) FROM  Video  v where v.active = true";
        Long count = (Long) getEntityManager().createQuery(hql).getSingleResult();
        return count.intValue();
    }

    public Map<Integer, List<Video>> fillAllVideoByPage(int pageNumber, int pageSize) {

        Map<Integer, List<Video>> listMap = new HashMap<>();
        listMap.put(pageNumber, fillAllMaxResult(pageNumber, pageSize));
        return listMap;
    }

    public List<Video> getVideoFavoritesByUser(User user) {
        return getEntityManager().createQuery("select f.video from Favorite f where f.user=:User").setParameter("User", user).getResultList();
    }

    public boolean updateViewCount(String videoID) {
        EntityTransaction transaction = getEntityManager().getTransaction();
        transaction.begin();
        StoredProcedureQuery query = getEntityManager().createStoredProcedureQuery("UPVIEWCOUNT");
        query.registerStoredProcedureParameter("videoID", String.class, ParameterMode.IN);
        query.registerStoredProcedureParameter("rowCount", Boolean.class, ParameterMode.OUT);
        query.setParameter("videoID", videoID);
        query.execute();
        boolean result = (Boolean) query.getOutputParameterValue("rowCount");
        transaction.commit();
        getEntityManager().refresh(findById(videoID));
        return result;
    }

    public List<String> getAllVideoByTitle() {
        EntityManager em = getEntityManager();
        return em.createQuery("select v.title from Video v").getResultList();
    }

}
