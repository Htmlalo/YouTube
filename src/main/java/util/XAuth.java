package util;

import model.User;

public class XAuth {
    public static User user;

    public static void logOut() {
        if (user != null) user = null;
    }
}
