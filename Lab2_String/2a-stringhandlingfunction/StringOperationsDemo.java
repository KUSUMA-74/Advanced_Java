/*2 a. Develop a java program for performing various string operations with different string
handling functions directed as follows
String Creation and Basic Operations, Length and Character Access, String Comparison, String
Searching, Substring Operations , String Modification, Whitespace Handling, String
Concatenation, String Splitting, StringBuilder Demo, String Formatting , Validate Email with
contains( ) and startsWith() and endsWith()*/

public class StringOperationsDemo {

    public static void main(String[] args) {
        
        // 1. String Creation and Basic Operations
        String str1 = "Hello";
        String str2 = new String("World");
        System.out.println("String 1: " + str1);
        System.out.println("String 2: " + str2);

        // 2. Length and Character Access
        System.out.println("Length of str1: " + str1.length());
        System.out.println("Character at index 1 in str1: " + str1.charAt(1));

        // 3. String Comparison
        System.out.println("str1 equals str2? " + str1.equals(str2));
        System.out.println("str1 equalsIgnoreCase 'hello'? " + str1.equalsIgnoreCase("hello"));

        // 4. String Searching
        String sample = "Java programming language";
        System.out.println("Index of 'programming': " + sample.indexOf("programming"));
        System.out.println("Contains 'Java'? " + sample.contains("Java"));

        // 5. Substring Operations
        System.out.println("Substring from index 5: " + sample.substring(5));
        System.out.println("Substring from 5 to 16: " + sample.substring(5, 16));

        // 6. String Modification
        String replaced = sample.replace("Java", "Python");
        System.out.println("Replaced String: " + replaced);

        // 7. Whitespace Handling
        String withSpaces = "   Trim this string   ";
        System.out.println("Before trim: '" + withSpaces + "'");
        System.out.println("After trim: '" + withSpaces.trim() + "'");

        // 8. String Concatenation
        String fullName = str1.concat(" ").concat(str2);
        System.out.println("Concatenated String: " + fullName);

        // 9. String Splitting
        String csv = "apple,banana,mango,grapes";
        String[] fruits = csv.split(",");
        System.out.println("Fruits list:");
        for (String fruit : fruits) {
            System.out.println(fruit);
        }

        // 10. StringBuilder Demo
        StringBuilder sb = new StringBuilder("Hello");
        sb.append(" Java");
        sb.insert(5, " and");
        sb.replace(6, 9, "Python");
        System.out.println("StringBuilder result: " + sb.toString());

        // 11. String Formatting
        int age = 25;
        String name = "Alice";
        String formatted = String.format("Name: %s, Age: %d", name, age);
        System.out.println("Formatted String: " + formatted);

        // 12. Email Validation using contains(), startsWith(), endsWith()
        String email = "user@example.com";
        boolean isValid = email.contains("@") &&
                          email.startsWith("user") &&
                          email.endsWith(".com");
        System.out.println("Email: " + email);
        System.out.println("Is valid email? " + isValid);
    }
}