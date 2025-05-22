<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<head>
    <title>Employee Entry Form</title>
</head>
<body>
    <h2>Enter Employee Details</h2>
    <form method="post">
        Emp No: <input type="text" name="empno"/><br/>
        Name: <input type="text" name="empname"/><br/>
        Basic Salary: <input type="text" name="salary"/><br/>
        <input type="submit" value="Insert"/>
    </form>

    <%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Connect to the database
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee?useSSL=false&serverTimezone=UTC", "root", "");

        // Insert employee data
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String empnoStr = request.getParameter("empno");
            String empname = request.getParameter("empname");
            String salaryStr = request.getParameter("salary");

            if (empnoStr != null && !empnoStr.isEmpty() && empname != null && !empname.isEmpty() && salaryStr != null && !salaryStr.isEmpty()) {
                try {
                    int empno = Integer.parseInt(empnoStr);
                    int salary = Integer.parseInt(salaryStr);

                    // Insert data into the Emp table
                    ps = con.prepareStatement("INSERT INTO Emp (Emp_NO, Emp_Name, Basicsalary) VALUES (?, ?, ?)");
                    ps.setInt(1, empno);
                    ps.setString(2, empname);
                    ps.setInt(3, salary);

                    int rowsAffected = ps.executeUpdate();
                    if (rowsAffected > 0) {
                        out.println("<p style='color:green;'>Employee inserted successfully.</p>");
                    } else {
                        out.println("<p style='color:red;'>Failed to insert employee.</p>");
                    }
                } catch (NumberFormatException e) {
                    out.println("<p style='color:red;'>Invalid input. Please enter valid numbers for Emp No and Salary.</p>");
                }
            } else {
                out.println("<p style='color:red;'>All fields are required.</p>");
            }
        }

        // Display salary report
        out.println("<hr/>");
        out.println("<h3>Salary Report</h3>");
        out.println("<pre>");
        out.println("--------------------------------------------------");

        // Fetch employee data and calculate total salary
        Statement stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM Emp");

        int totalSalary = 0;
        while (rs.next()) {
            int eno = rs.getInt("Emp_NO");
            String ename = rs.getString("Emp_Name");
            int basic = rs.getInt("Basicsalary");
            totalSalary += basic;

            out.println("Emp_No   : " + eno);
            out.println("Emp_Name : " + ename);
            out.println("Basic    : " + basic);
            out.println("--------------------------------------------------");
        }

        out.println("Grand Salary : " + totalSalary);
        out.println("--------------------------------------------------");
        out.println("</pre>");

    } catch (SQLException e) {
        out.println("<p style='color:red;'>SQL Error: " + e.getMessage() + "</p>");
    } catch (ClassNotFoundException e) {
        out.println("<p style='color:red;'>Error: MySQL JDBC Driver not found.</p>");
    } catch (Exception e) {
        out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("<p style='color:red;'>Error closing resources: " + e.getMessage() + "</p>");
        }
    }
    %>
</body>
</html>
