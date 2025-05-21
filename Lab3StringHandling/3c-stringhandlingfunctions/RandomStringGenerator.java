/*Q9. Write a Java Program for Creating a random string of a specified length using user defined
function generateRandomString()*/

import java.util.Random;

public class RandomStringGenerator {

    public static String generateRandomString(int length) {
        if (length <= 0) return "";

        String characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        StringBuilder randomString = new StringBuilder();
        Random random = new Random();

        for (int i = 0; i < length; i++) {
            int index = random.nextInt(characters.length());
            randomString.append(characters.charAt(index));
        }

        return randomString.toString();
    }

    public static void main(String[] args) {
        System.out.println(generateRandomString(10));
    }
}
