/*Q5. Write a Java Program for Eliminating all whitespace characters from a string using user defined
function removeWhitespace()*/

public class WhitespaceRemover {

    public static String removeWhitespace(String str) {
        if (str == null) return null;

        StringBuilder result = new StringBuilder();
        for (char c : str.toCharArray()) {
            if (!Character.isWhitespace(c)) {
                result.append(c);
            }
        }
        return result.toString();
    }

    public static void main(String[] args) {
        String input = "  Java   Programming   ";
        System.out.println("Without whitespace: '" + removeWhitespace(input) + "'");
    }
}
