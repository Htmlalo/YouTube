package service.Login;

import lombok.Getter;
import lombok.Setter;
import model.User;
import repository.UserRepository;

import java.util.List;

@Getter
@Setter

public class UserService {
    private final UserRepository userRepository;

    public UserService() {
        userRepository = new UserRepository();
    }

    public List<User> getAllUser() {
        return userRepository.findAll();
    }

    public boolean delete(String id) {
        try {
            userRepository.delete(id);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

    public User checkLogin(String userName, String password) {
        return userRepository.findById(userName);

    }

    public User getUserById(String Id) {
        return userRepository.findById(Id);
    }

    public void save(User user) {
        userRepository.save(user);
    }

    public boolean checkAccount(String userName) {
        return userRepository.exists(userName);
    }

    public boolean updateAccount(User user) {
        try {
            userRepository.update(user);
            return true;
        } catch (Exception e) {
            return false;
        }
    }

}
