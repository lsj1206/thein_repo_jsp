<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Action Tag</title>
</head>
<body>
  <jsp:useBean id="person" class="dao.Person" scope="request" />
  <p> 아이디 : <%= person.getId() %>
  <p> 이  름 : <%= person.getName() %>
</body>
</html>
