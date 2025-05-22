<!--  8d. Develop a JDBC project using JDBC to update the fields empno, empname and basicsalary into
the table Emp of the database Employee using HTML and JSP to get the fields and display the
results respectively-->
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<html>
<body>
<h2>Update Employee Details</h2>
<form method="post">
  Emp No: <input type="text" name="empno"/><br/>
  Name: <input type="text" name="empname"/><br/>
  Basic Salary: <input type="text" name="salary"/><br/>
  <input type="submit" value="Update"/>
</form>

<%
Connection con = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employee", "root", "");

    if(request.getParameter("empno") != null) {
        int empno = Integer.parseInt(request.getParameter("empno"));
        String empname = request.getParameter("empname");
        int salary = Integer.parseInt(request.getParameter("salary"));

        PreparedStatement ps = con.prepareStatement(
            "UPDATE Emp SET Emp_Name = ?, Basicsalary = ? WHERE Emp_NO = ?"
        );
        ps.setString(1, empname);
        ps.setInt(2, salary);
        ps.setInt(3, empno);

        int i = ps.executeUpdate();
        if(i > 0) {
            out.println("<p style='color:green;'>Employee updated successfully.</p>");
        } else {
            out.println("<p style='color:red;'>No employee found with Emp No: " + empno + "</p>");
        }
    }

    // Generate Salary Report
    out.println("<hr/>");
    out.println("<h3>Salary Report</h3>");
    out.println("<pre>");
    out.println("---------------------------------------------");

    Statement stmt = con.createStatement();
    ResultSet rs = stmt.executeQuery("SELECT * FROM Emp");

    int total = 0;
    while(rs.next()) {
        int eno = rs.getInt("Emp_NO");
        String ename = rs.getString("Emp_Name");
        int basic = rs.getInt("Basicsalary");
        total += basic;

        out.println("Emp_No   : " + eno);
        out.println("Emp_Name : " + ename);
        out.println("Basic    : " + basic);
        out.println("---------------------------------------------");
    }

    out.println("Grand Salary : " + total);
    out.println("---------------------------------------------");
    out.println("</pre>");

} catch(Exception e) {
    out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
} finally {
    if(con != null) con.close();
}
%>
</body>
</html>