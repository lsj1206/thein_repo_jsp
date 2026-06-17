<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
</head>
<body>
  <h2> 간단 계산기 </h2>
  <form action="result.jsp" method="post">
    숫자 1 : <input type="text" name="num1"><br/>
    연산자 : <select name="op" id="">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select><br/>
    숫자 2 : <input type="text" name="num2"><br/>
    <input type="submit" value="계산하기">

  </form>
</body>
</html>
