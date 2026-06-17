<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Welcome</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" />
  </head>
  <body>
    <div class="container py-4">
      <%@ include file="menu.jsp" %>
      <%! String greeting = "도서 쇼핑몰에 오신 것을 환영합니다.";
      String tagline = "Welcome to Web Market!"; %>

      <div class="container-fluid py-5">
        <h1 class="display-5 fw-bold"><%= greeting %></h1>
        <p class="col-md-8 fs-4">BookMarket</p>
      </div>

      <div class="row align-items-md-stretch text-center">
        <div class="col-md-12">
          <div class="h-100 p-5">
            <h3><%= tagline %></h3>
            <%
              Date day = new java.util.Date();
              String am_pm;
              int hour = day.getHours();
              int minute = day.getMinutes();
              int second = day.getSeconds();
              if (hour / 12 == 0) {
                am_pm = "오전";
              } else {
                am_pm = "오후";
                hour = hour - 12;
              }
              String CT = hour + "시 " + minute + "분 " + second + "초";
              out.println("접속 시간은 " + am_pm + " " + CT + "입니다.");
            %>
          </div>
        </div>
      </div>
      <%@ include file="footer.jsp" %>
    </div>
  </body>
</html>
