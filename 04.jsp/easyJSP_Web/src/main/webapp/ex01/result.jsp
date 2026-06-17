<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  request.setCharacterEncoding("UTF-8");

  String n1 = request.getParameter("num1");
  String op = request.getParameter("op");
  String n2 = request.getParameter("num2");

  double num1 = Double.parseDouble(n1);
  double num2 = Double.parseDouble(n2);
  double result = 0;

  String error = "";

  switch(op) {
    case "+" : result = num1 + num2; break;
    case "-" : result = num1 - num2; break;
    case "*" : result = num1 * num2; break;
    case "/" :
      if(num2 == 0) {
        error = "0으로 나눌 수 없습니다.";
        break;
      };
      result = num1 / num2;
      break;
    default : error = "잘못된 연산자입니다."; break;
  }
%>
<%!
  private String fmt(double d) {
    return d == (long) d ? String.valueOf((long) d) : String.valueOf(d);
  }
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Document</title>
</head>
<body>
  <h1>계산결과</h1>

  <p><%= error.equals("") ? fmt(num1) + " " + op + " " + fmt(num2) + " = " + fmt(result) : error %></p>

  <a href="op.jsp">계산기</a>
</body>
</html>
