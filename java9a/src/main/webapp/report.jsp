<%-- 9a. Read all the existing records from the table coffee which is from the database test and delete
an existing coffee product from the table with its id and display the rest of the records using
HTML and JSP to get the field and display the results respectively--%>

<%@ page import="java.sql.*" %>
<%
    String url = "jdbc:mysql://localhost:3306/test";
    String username = "root";
    String password = ""; // Change this

    Connection conn = null;
    PreparedStatement psDelete = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, username, password);

        String idStr = request.getParameter("id");

        if (idStr != null) {
            int id = Integer.parseInt(idStr);

            String deleteQuery = "DELETE FROM coffee WHERE id = ?";
            psDelete = conn.prepareStatement(deleteQuery);
            psDelete.setInt(1, id);

            int rowsDeleted = psDelete.executeUpdate();

            if (rowsDeleted > 0) {
                out.println("<p style='color:green;'>Coffee product with ID " + id + " deleted successfully.</p>");
            } else {
                out.println("<p style='color:red;'>No coffee product found with ID " + id + ".</p>");
            }
        }

        // Read and display remaining records
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM coffee");

        out.println("<h2>Remaining Coffee Products</h2>");
        out.println("<table border='1'><tr><th>ID</th><th>Name</th><th>Price</th></tr>");
        while (rs.next()) {
            out.println("<tr>");
            out.println("<td>" + rs.getInt("id") + "</td>");
            out.println("<td>" + rs.getString("coffee_name") + "</td>");
            out.println("<td>" + rs.getDouble("price") + "</td>");
            out.println("</tr>");
        }
        out.println("</table>");

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (psDelete != null) psDelete.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>