<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.DriverManager,
                 java.sql.ResultSet,
                 java.sql.PreparedStatement,
                 java.sql.Connection"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <title>글 보기</title>
</head>
<body>
  <jsp:include page="header.jsp"/>

  <%
 
  int id = Integer.parseInt(request.getParameter("id"));
  
  String url = "jdbc:postgresql://localhost:5432/hrd";
  String dbUser = "postgres";
  String dbPass = "1234";

  Connection conn = null;
  PreparedStatement pstmt = null;
  ResultSet rs = null;

  try {
    Class.forName("org.postgresql.Driver");
    conn = DriverManager.getConnection(url, dbUser, dbPass);

    String sql = "SELECT * FROM board WHERE id = ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, id);
    rs = pstmt.executeQuery();

    if(rs.next()) {
    %>
    <h2><%=rs.getString("title")%></h2>
    <p>작성자 : <%=rs.getString("author")%>
      | 날짜: <%=rs.getTimestamp("reg_date")%></p>
    <hr>
    <p><%=rs.getString("content")%></p>
    <hr>
    <a href="list.jsp">목록으로</a>
    <a href="delete.jsp?id<%= id %>" onclick="return comfirm('정말 삭제할까요?')">삭제</a>
    <%}
  }
  catch (Exception e) {
    out.println("오류 " + e.getMessage());
  }
  finally {
    if (rs != null) try { rs.close(); } catch (Exception e) {}
    if (pstmt != null) try { pstmt.close(); } catch (Exception e) {}
    if (conn != null) try { conn.close(); } catch (Exception e) {}
  }
    %>
</body>
</html>
