<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
</head>
<body>
  <h1>Hello, World!! </h1>

  <%
    String name = request.getParameter("username");
    if (name == null || name.trim().isEmpty()) {
      name = "익명";
    }
  %>

  <h2> 안녕하세요 <%= name %>님! </h2>
  <p> JSP가 여러분의 이름을 받아서 출력합니다.</p>

</body>
</html>
