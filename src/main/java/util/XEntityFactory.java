package util;

import jakarta.persistence.Entity;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.apache.commons.collections.Factory;


public class XEntityFactory {
    // Sử dụng từ khóa volatile để đảm bảo tính nhất quán khi có nhiều luồng
    // valatile luôn cho kết quả mới nhất của 1 biên cho cách luồn khác được thấy
    private static volatile EntityManagerFactory entityManagerFactory;

    private XEntityFactory() {
    }

    // Sử dụng double-checked-locking (DCL) để tránh khởi tạo 1 đối tượng mới thường được dùng trong SingLeton

    public static EntityManager getEntity() {
        if (entityManagerFactory == null) {
            synchronized (XEntityFactory.class) {
                if (entityManagerFactory == null) {
                    System.out.println("Thanh công");
                    entityManagerFactory = Persistence.createEntityManagerFactory("YouTuuBee-unit");
                }
            }
        }
        return entityManagerFactory.createEntityManager();
    }


    public static void shutdown() {
        if (entityManagerFactory != null && entityManagerFactory.isOpen()) {
            entityManagerFactory.close();
        }
    }

    public static void main(String[] args) {
        getEntity();
    }
}
