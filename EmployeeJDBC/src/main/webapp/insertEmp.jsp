<%@ page import="java.sql.*" %>
<html>
<head><title>Insert Employee</title></head>
<body>
<h2>Enter Employee Details</h2>
<form method="post">
    Emp No: <input type="text" name="eno" required><br>
    Emp Name: <input type="text" name="ename" required><br>
    Basic Salary: <input type="text" name="basic" required><br>
    <input type="submit" value="Insert">
</form>

<%
String eno = request.getParameter("eno");
String ename = request.getParameter("ename");
String basic = request.getParameter("basic");

if (eno != null && ename != null && basic != null) {
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee", "root", "");
        PreparedStatement ps = con.prepareStatement("INSERT INTO Emp VALUES (?, ?, ?)");
        ps.setInt(1, Integer.parseInt(eno));
        ps.setString(2, ename);
        ps.setInt(3, Integer.parseInt(basic));
        ps.executeUpdate();
        out.println("<p style='color:green;'>Inserted successfully.</p>");
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