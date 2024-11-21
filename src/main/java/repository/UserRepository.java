package repository;

import model.User;

public class UserRepository extends GenericRepositoryIml<User, String> {


    public UserRepository() {
        super(User.class);
    }

}
