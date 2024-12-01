package repository;


import jakarta.persistence.EntityManager;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import model.Share;

import java.util.List;

public class ShareRepository extends GenericRepositoryIml<Share, Long> {
    public ShareRepository() {
        super(Share.class);
    }


    public List<Object[]> getShareByVideoTitle(String title) {
        EntityManager em = getEntityManager();
        if (title == null) title = "";
        String escapedTitle = title.replace("[", "\\[").replace("]", "\\]");
        TypedQuery<Object[]> query = em.createQuery("select u.fullName,u.email,s.emails,s.shareDate from User u join u.userShares s where s.video.title like :title escape '\\'", Object[].class);
        query.setParameter("title",  "%" + escapedTitle + "%");
        return query.getResultList();
    }



}
