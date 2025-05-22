/*Q4. Write a Java Program for Checking if a string reads the same backward as forward (ignoring case
and punctuation) using user defined function isPalindrome():*/

public class PalindromeChecker {

    public static boolean isPalindrome(String s) {
        StringBuilder cleaned = new StringBuilder();

        for (char c : s.toCharArray()) {
            if (Character.isLetterOrDigit(c)) {
                cleaned.append(Character.toLowerCase(c));
            }
        }

        String cleanedStr = cleaned.toString();
        String reversedStr = cleaned.reverse().toString();

        return cleanedStr.equals(reversedStr);
    }

    public static void main(String[] args) {
        System.out.println(isPalindrome("121"));  
        System.out.println(isPalindrome("200"));                      
    }
}
