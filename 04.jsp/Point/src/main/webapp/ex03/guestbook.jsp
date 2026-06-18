<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,
             java.sql.DriverManager,
             java.sql.ResultSet,
             java.sql.Statement"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>방명록</title>
  <style>
    .dbForm{
      margin: 10px;
      padding: 10px;
    }
    .dbForm input[type="text"], .dbForm textarea {
      vertical-align: top;
      width: 250px;
      margin: 5px 0 10px 0;
      padding: 5px;
    }
    .dbData{
      margin: 10px;
      padding: 10px;
      border: 1px solid #ccc;
    }
    .dbDate{
      color : gray;
      font-size : 0.9em;
    }
  </style>
</head>
<body>
  <h2>방명록</h2>
  <form class="dbForm" action="save.jsp" method="POST">
    이  름 : <input type="text" name="name"> <br>
    메세지 : <textarea name="message" rows="3" cols="40"></textarea> <br>
    <input type="submit" value="저장">
  </form>
  <hr>
  <%
    String url = "jdbc:postgresql://localhost:5432/hrd";
    String dbUser = "postgres";
    String dbPass = "1234";

    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(url, dbUser, dbPass);
        stmt = conn.createStatement();
        rs   = stmt.executeQuery("SELECT * FROM guestbook ORDER BY id DESC");

        while (rs.next()) {
  %>
    <div class="dbData">
      <b><%= rs.getString("name") %></b>
      <span class="dbDate"><%= rs.getString("reg_date") %></span><br>
      <%= rs.getString("message") %>
    </div>
  <%
        }
      } catch (Exception e) {
        out.println("<p>오류: " + e.getMessage() + "</p>");
      } finally {
        if (rs != null) try { rs.close(); } catch (Exception e) {}
        if (stmt != null) try { stmt.close(); } catch (Exception e) {}
        if (conn != null) try { conn.close(); } catch (Exception e) {}
      }
  %>
</body>
</html>
