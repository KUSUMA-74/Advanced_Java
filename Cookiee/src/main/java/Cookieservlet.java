// Step 1: Required imports
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

// Step 2: Create servlet class and use WebServlet annotation
@WebServlet("/CookieServlet")
public class Cookieservlet extends HttpServlet {
    int count = 0; // count for loading times

    // Step 3: Handle GET requests
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");

        PrintWriter out = response.getWriter();

        // Step 4: Create or retrieve cookies
        String userName = request.getParameter("userName");
        if (userName != null && !userName.trim().isEmpty()) {
            // Encode the user name to make it safe for cookie
            String encodedUserName = URLEncoder.encode(userName, StandardCharsets.UTF_8.toString());

            // Create a new cookie
            Cookie userCookie = new Cookie("user", encodedUserName);

            // Step 5: Set cookie properties
            userCookie.setMaxAge(60); // Cookie expires in 1 minute
            userCookie.setPath("/");

            // Step 6: Add cookie to response
            response.addCookie(userCookie);
        }

        // Step 7: Read existing cookies
        Cookie[] cookies = request.getCookies();
        String existingUser = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("user")) {
                    // Decode the value to display correctly
                    existingUser = URLDecoder.decode(cookie.getValue(), StandardCharsets.UTF_8.toString());
                    break;
                }
            }
        }

        // Step 8: Generate HTML response
        out.println("<html>");
        out.println("<head><title>Cookie Example</title></head>");
        out.println("<body>");

        if (existingUser != null) {
            count += 1;
            out.println("<font color=blue><h2>Welcome back, " + existingUser + "!</h2></font>");
            out.println("<font color=magenta><h2>You have visited this page " + count + " times!</h2></font>");
            out.println("<form action='CookieServlet' method='post'>");
            out.println("<input type='submit' value='Logout'>");
            out.println("</form>");
        } else {
            out.println("<h2>Welcome Guest!</h2>");
            out.println("<form action='CookieServlet' method='get'>");
            out.println("Enter your name: <input type='text' name='userName'>");
            out.println("<input type='submit' value='Submit'>");
            out.println("</form>");
        }

        out.println("</body></html>");
    }

    // Step 10: Handle POST requests (for logout)
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Delete the cookie by setting its max age to 0
        Cookie cookie = new Cookie("user", "");
        cookie.setMaxAge(0);
        cookie.setPath("/");
        response.addCookie(cookie);

        // Redirect back to the servlet
        response.sendRedirect("CookieServlet");
    }
}
