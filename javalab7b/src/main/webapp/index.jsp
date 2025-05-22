<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cookie List Management</title>
    <style>
        .cookie-table {
            border-collapse: collapse;
            width: 60%;
            margin: 20px 0;
        }
        .cookie-table th, .cookie-table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        .cookie-table th {
            background-color: #f2f2f2;
        }
        .auto-refresh {
            color: #666;
            font-size: 0.9em;
            margin-bottom: 10px;
        }
    </style>
    <script>
        // ↓ Comment out or remove this during debugging ↓
        /*
        setTimeout(function() {
            window.location.reload();
        }, 1000);
        */
    </script>
</head>
<body>
    <h2>Cookie List Management</h2>

    <!-- Form to set cookies -->
    <form action="setCookie.jsp" method="post">
        <h3>Set New Cookie</h3>
        <table>
            <tr>
                <td><label for="cookieName">Cookie Name:</label></td>
                <td><input type="text" id="cookieName" name="cookieName" required></td>
            </tr>
            <tr>
                <td><label for="domain">Domain:</label></td>
                <td><input type="text" id="domain" name="domain" required></td>
            </tr>
            <tr>
                <td><label for="maxAge">Max Age (seconds):</label></td>
                <td><input type="number" id="maxAge" name="maxAge" value="10" min="1" required></td>
            </tr>
            <tr>
                <td colspan="2">
                    <button type="submit">Add Cookie</button>
                </td>
            </tr>
        </table>
    </form>

    <hr/>

    <!-- Display list of set cookies -->
    <h3>List of Active Cookies</h3>
    <p class="auto-refresh">List updates automatically when cookies expire.</p>
    <table class="cookie-table">
        <thead>
            <tr>
                <th>Cookie Name</th>
                <th>Domain</th>
                <th>Max Age (seconds)</th>
            </tr>
        </thead>
        <tbody>
            <%
                @SuppressWarnings("unchecked")
                List<Map<String, String>> cookieList =
                    (List<Map<String, String>>) session.getAttribute("cookieList");
                long currentTime = System.currentTimeMillis() / 1000;

                if (cookieList != null) {
                    Iterator<Map<String, String>> iter = cookieList.iterator();
                    while (iter.hasNext()) {
                        Map<String, String> c = iter.next();
                        long setTime = Long.parseLong(c.get("setTime"));
                        int age = Integer.parseInt(c.get("maxAge"));
                        if (currentTime > setTime + age) {
                            iter.remove();  // expired
                        }
                    }
                    session.setAttribute("cookieList", cookieList);
                }

                if (cookieList != null && !cookieList.isEmpty()) {
                    for (Map<String, String> c : cookieList) {
            %>
            <tr>
                <td><%= c.get("name")   %></td>
                <td><%= c.get("domain") %></td>
                <td><%= c.get("maxAge") %></td>
            </tr>
            <%
                    }
                } else {
            %>
            <tr>
                <td colspan="3" style="text-align:center;">No active cookies</td>
            </tr>
            <%
                }
            %>
        </tbody>
    </table>
</body>
</html>