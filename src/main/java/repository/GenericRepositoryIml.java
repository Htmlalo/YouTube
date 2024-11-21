package repository;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Id;
import util.XEntityFactory;

import java.lang.reflect.Field;
import java.util.List;

public class GenericRepositoryIml<T, ID> implements GenericRepository<T, ID> {

    private final Class<T> entityClass;


    private final EntityManager entityManager = XEntityFactory.getEntity();


    private EntityManager getEntityManager() {
        if (entityManager == null || !entityManager.isOpen()) {
            return XEntityFactory.getEntity();
        }
        return entityManager;
    }

    public GenericRepositoryIml(Class<T> entityClass) {
        this.entityClass = entityClass;
    }


    @Override
    public T findById(ID id) {
        return entityManager.find(entityClass, id);
    }


    @Override
    public List<T> findAll() {
        return entityManager.createQuery("SELECT e FROM " + entityClass.getName() + " e", entityClass)
                .getResultList();
    }


    @Override
    public void save(T entity) {
        executeTransaction(entityManager -> entityManager.persist(entity));
    }

    @Override
    public void update(T entity) {
        executeTransaction(entityManager -> entityManager.merge(entity));
    }

    @Override
    public void delete(ID id) {
        executeTransaction(entityManager -> {
                    T entity = entityManager.find(entityClass, id);
                    if (entity != null) entityManager.remove(entity);
                }
        );
    }

    @Override
    public boolean exists(Object ID) {
        Long count = entityManager.createQuery("SELECT count(e) FROM " + entityClass.getName() + " e WHERE e." +
                                getNameIDOfEntity(entityClass) + " = :id"
                        , Long.class)
                .setParameter("id", ID)
                .getSingleResult();
        return count > 0;
    }


    public String getNameIDOfEntity(Class<T> tClass) {
        Field[] fields = tClass.getDeclaredFields();
        String name = "";
        for (Field field : fields) {
            field.setAccessible(true);
            if (field.isAnnotationPresent(Id.class)) {
                name = field.getName();
            }
        }
        return name;
    }


    public void executeTransaction(EntityManagerConsumer<T> action) {
        EntityTransaction transaction = getEntityManager().getTransaction();
        try {
            transaction.begin();
            action.accept(getEntityManager());
            transaction.commit();
        } catch (RuntimeException e) {
            if (transaction.isActive()) {
                transaction.rollback();
                throw e;
            }
        }

    }


    @FunctionalInterface
    interface EntityManagerConsumer<T> {
        void accept(EntityManager entityManager);
    }
}
