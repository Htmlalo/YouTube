package repository;

import jakarta.persistence.EntityManager;
import model.User;

import java.util.List;

public class UserRepository extends GenericRepositoryIml<User, String> {


    public UserRepository() {
        super(User.class);
    }




}
