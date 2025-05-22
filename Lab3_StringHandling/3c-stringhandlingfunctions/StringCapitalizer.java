/*Q6. Write a Java Program for Capitalizing the first letter of each word. using user defined function
capitalizeWords()*/

public class StringCapitalizer {

    public static String capitalizeWords(String str) {
        if (str == null || str.isEmpty()) return str;

        StringBuilder result = new StringBuilder();
        String[] words = str.split(" ");

        for (String word : words) {
            if (!word.isEmpty()) {
                result.append(Character.toUpperCase(word.charAt(0)));
                result.append(word.substring(1).toLowerCase());
                result.append(" ");
            }
        }

        return result.toString().trim();
    }

    public static void main(String[] args) {
        String input = "java programming is fun";
        System.out.println("Capitalized: " + capitalizeWords(input)); // Output: "Java Programming Is Fun"
    }
}
