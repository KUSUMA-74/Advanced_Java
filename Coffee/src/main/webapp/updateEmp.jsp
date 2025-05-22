<%@ page import="java.sql.*" %>
<html>
<head><title>Update Employee</title></head>
<body>
    <h2>Update Employee Record</h2>
    <form method="post" action="updateEmp.jsp">
        Emp No (to update): <input type="number" name="empno" required><br/>
        New Name: <input type="text" name="empname" required><br/>
        New Salary: <input type="number" name="salary" required><br/>
        <input type="submit" value="Update">
    </form>

<%
String empno = request.getParameter("empno");
String empname = request.getParameter("empname");
String salary = request.getParameter("salary");

if (empno != null && empname != null && salary != null) {
    try {
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Employee", "root", "");
        PreparedStatement ps = con.prepareStatement("UPDATE Emp SET Emp_Name=?, Basicsalary=? WHERE Emp_NO=?");
        ps.setString(1, empname);
        ps.setInt(2, Integer.parseInt(salary));
        ps.setInt(3, Integer.parseInt(empno));
        int result = ps.executeUpdate();

        if (result > 0) {
            out.println("<p style='color:green;'>Record updated successfully!</p>");
        } else {
            out.println("<p style='color:red;'>Record not found!</p>");
        }

    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
}
%>
</body>
</html>