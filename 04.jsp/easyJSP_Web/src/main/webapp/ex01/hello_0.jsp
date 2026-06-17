<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>인사 페이지</title>
</head>
<body>
  Index JSP 안녕
  <h2>JSP 개발환경 구축 완료!</h2>

  <%! String name = "JDK21 = Eclipse EE"; %>
  <h3><%= name %></h3>

  <h2> 이름을 입력하세요 </h2>
  <form action="hello_1.jsp" method="get">
    이름: <input type="text" name="username" placeholder="이름을 입력하세요">
    <input type="submit" value="인사하기">
  </form>
</body>
</html>
