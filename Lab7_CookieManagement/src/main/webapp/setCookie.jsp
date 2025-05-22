<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="javax.servlet.http.Cookie" %>

<%
  String name   = request.getParameter("cookieName");
  String domain = request.getParameter("domain");
  String maxAge = request.getParameter("maxAge");

  if (name==null || domain==null || maxAge==null) {
%>
    <p style="color:red;">Missing parameters. Please fill out the form completely.</p>
<%
    return;
  }

  // prepare your session list
  @SuppressWarnings("unchecked")
  List<Map<String,String>> cookieList = 
      (List<Map<String,String>>) session.getAttribute("cookieList");
  if (cookieList==null) cookieList = new ArrayList<>();

  long now = System.currentTimeMillis()/1000;
  Map<String,String> entry = new HashMap<>();
  entry.put("name",   name);
  entry.put("domain", domain);
  entry.put("maxAge", maxAge);
  entry.put("setTime", String.valueOf(now));

  Cookie cookie = new Cookie(name,"value");
  // validate maxAge
  try {
    int age = Integer.parseInt(maxAge);
    if (age < 0) throw new NumberFormatException();
    cookie.setMaxAge(age);
  } catch (NumberFormatException e) {
    out.println("<p style='color:red;'>Invalid Max Age; must be a non‑negative integer.</p>");
    return;
  }

  // optional domain check
  if (domain.contains(".") && !domain.startsWith(".")) {
    cookie.setDomain(domain);
  }

  response.addCookie(cookie);
  cookieList.add(entry);
  session.setAttribute("cookieList", cookieList);

  // timestamp for display
  String timestamp = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")
                         .format(new Date(now*1000));
%>
<div class="info-box">
  <h3 class="success">Cookie Set Successfully</h3>
  <p><strong>Cookie Name:</strong> <%= name.replaceAll("<","&lt;") %></p>
  <p><strong>Domain:</strong>      <%= domain.replaceAll("<","&lt;") %></p>
  <p><strong>Max Age:</strong>     <%= maxAge %> seconds</p>
  <p><strong>Set Time:</strong>    <%= timestamp %></p>
  <p><a href="index.jsp">Return to Cookie List</a></p>
</div>