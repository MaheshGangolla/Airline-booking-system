package airlinereservationsystem;


import java.util.HashMap;
import java.util.Map;
import java.util.Random;

public class PasswordResetService {
    private static final Map<String, String> emailToCodeMap = new HashMap<>();

    public static String generateCode() {
        Random random = new Random();
        int code = 100000 + random.nextInt(900000);
        return String.valueOf(code);
    }

    public static void storeCode(String email, String code) {
        emailToCodeMap.put(email, code);
        System.out.println("ecm"+emailToCodeMap);
    }

    public static String getCode(String email) {
        return emailToCodeMap.get(email);
    }

    public static void removeCode(String email) {
        emailToCodeMap.remove(email);
    }
}
