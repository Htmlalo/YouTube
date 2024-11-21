package util;

import java.security.SecureRandom;

public class XEmail {


    


    public static String verificationCode() {
        String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        int CODE_LENGTH = 6;
        SecureRandom randome = new SecureRandom();
        StringBuilder code = new StringBuilder(CODE_LENGTH);
        for (int i = 0; i < CODE_LENGTH; i++) {
            code.append(CHARACTERS.charAt(randome.nextInt(CHARACTERS.length())));
        }
        return code.toString();
    }


}
