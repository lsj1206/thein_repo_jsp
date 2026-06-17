<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
</head>
<body>
  <jsp:useBean id="person" class="dao.Person" scope="request" />

  <%-- 01 setter--%>
  <jsp:setProperty name="person" property="id" value="19991231" />
  <jsp:setProperty name="person" property="name" value="가나다" />
  <%-- 02 getter--%>
  <p> 아이디 : <jsp:getProperty property="id" name="person" />
  <p> 이  름 : <jsp:getProperty property="name" name="person" />

</body>
</html>
