<%@ page import="java.sql.*" %>
<html>
<head><title>Delete Employee 'S'</title></head>
<body>
<h2>Delete Employees with Names Starting with 'S'</h2>
<form method="post">
    <input type="submit" value="Delete Records Starting with 'S'">
</form>

<%
if ("post".equalsIgnoreCase(request.getMethod())) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee", "root", "");
        PreparedStatement ps = con.prepareStatement("DELETE FROM Emp WHERE Emp_Name LIKE 'S%'");
        int count = ps.executeUpdate();
        out.println("<p style='color:red;'>" + count + " records deleted.</p>");
        con.close();
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    }
}
%>

<h3>Salary Report</h3>
<%
try {
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee", "root", "");
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("SELECT * FROM Emp");
    while (rs.next()) {
%>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
Emp_No : <%= rs.getInt(1) %><br>
Emp_Name: <%= rs.getString(2) %><br>
Basic : <%= rs.getInt(3) %><br>
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~<br>
<%
    }
    con.close();
} catch (Exception e) {
    out.println("Error loading report.");
}
%>
</body>
</html>