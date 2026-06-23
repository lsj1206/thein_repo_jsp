<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.DriverManager,
                java.sql.Connection,
                java.sql.PreparedStatement"%>

<%
  request.setCharacterEncoding("UTF-8");
  String method = request.getMethod();

  if("POST".equals(method)) {
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String author = request.getParameter("writer");

    String url    = "jdbc:postgresql://localhost:5432/hrd";
    String dbUser = "postgres";
    String dbPass = "1234";

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
      Class.forName("org.postgresql.Driver");
      conn = DriverManager.getConnection(url,dbUser,dbPass);

      String sql = "INSERT INTO board (title, content, writer) VALUES (?, ?, ?)";
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, title);
      pstmt.setString(2, content);
      pstmt.setString(3, author);

      response.sendRedirect("list.jsp");
      return;

    } catch (Exception e) {
            out.println("오류: " + e.getMessage());
        } finally {
            if (pstmt != null) try { pstmt.close(); } catch(Exception e) {}
            if (conn  != null) try { conn.close();  } catch(Exception e) {}
        }
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>글쓰기</title>
</head>
<body>
  <h2>글쓰기</h2>
  <form method="POST">
    제목 : <input type="text" name="title" style="width:400px"> <br> <br>
    작성자 : <input type="text" name="author"> <br><br>
    내용 : <textarea name="content" rows="8" cols="60"></textarea> <br><br>
    <input type="submit" value="저장">
    <a href="list.jsp">취소</a>
  </form>
</body>
</html>
