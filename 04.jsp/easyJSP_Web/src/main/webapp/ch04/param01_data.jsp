<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Action Tag</title>
</head>
<body>
  <p> 아이디: <%= request.getParameter("id") %></p>
  <% String name = request.getParameter("name"); %>
  <p> 이 름 : <%= java.net.URLDecoder.decode(name) %>
</body>
</html>
