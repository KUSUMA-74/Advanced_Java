/*Write a Java Program for Counting the number of words in a string using user defined function
countWords() */

public class WordCounter {

    public static int countWords(String str) {
        if (str == null || str.trim().isEmpty()) return 0;

        String[] words = str.trim().split("\\s+");
        return words.length;
    }

    public static void main(String[] args) {
        String input = "Java programming is fun!";
        System.out.println("Word count: " + countWords(input));
    }
}
